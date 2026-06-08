# Convergence baselines

This directory and its sibling `<system>/convergence/` directories hold
the canonical baseline data for the published-FF benchmark systems.

As of q2mm PR #290, the canonical layout is:

- `<system>/convergence/` — **canonical default**: QFUERZA-start
  (`starting_point="qfuerza"`). Bond/angle force constants and
  equilibria are derived from the QM Hessian via QFUERZA (Farrugia
  2025) on top of the chemist-provided OPT substructure topology.
- `<system>/from-published/` — opt-out baseline: published-FF-start
  (`starting_point="published"`). Literature OPT values are used as
  the initial parameters. Preserved for backend-vs-literature
  comparison.

Both subdirectories follow the same file layout (see below). See
[`docs/benchmarks/qfuerza-recovery.md`](https://github.com/ericchansen/q2mm/blob/master/docs/benchmarks/qfuerza-recovery.md)
for the framing.

## What's in each `<system>/convergence/` (or `from-published/`) directory

| File | Purpose |
|------|---------|
| `validation_results.json` | Top-level per-system summary: param counts, initial objective score, initial JaxLoss, ratio, ratio status, per-category Seminario fit, optimization result (when run). |
| `paper_metrics.json` | Per-category Seminario + post-optimization fit (R², RMSD, MAE, n_refs for bond_length, bond_angle, eig_diagonal). |
| `<system>_optimized.fld` | (Optional) Optimized force field, written only when the ratio gate passes and L-BFGS-B optimization actually ran. |
| `per_param_comparison.md` | (QFUERZA-start runs) per-parameter comparison of published vs QFUERZA-optimized OPT-row scalars, bucketed by chemical motif. |

Every JSON file is **strict JSON** (no `Infinity`/`NaN` — diverged values
are encoded as structured `ratio_status: "diverged"` with `ratio: null`),
and every file embeds a `provenance` block recording:

- q2mm git SHA + dirty flag
- q2mm-data git SHA + dirty flag
- Full command line used to generate the file
- `ratio_tol` setting
- JAX device(s) and OpenMM platform(s) detected at runtime
- ISO-8601 UTC timestamp

Any number quoted in the q2mm documentation that pertains to convergence
or Seminario fit must be traceable to one of these files (AGENTS.md
Rule 8).

## How to regenerate

From a checkout of `ericchansen/q2mm`, with the supporting-info data
extracted (or `Q2MM_SUPPORTING_INFO` pointing at it):

```bash
# Canonical: QFUERZA-start (default since q2mm PR #290) — writes to convergence/.
# These are the exact flags used to generate the committed artifacts.
python scripts/regenerate_convergence_results.py \
    --output-dir ../q2mm-data/benchmarks \
    --ratio-tol none --ftol 1e-12 \
    --fc-fraction 0.20 --eq-fraction 0.05 \
    --maxiter 500

# heck-relay needs tighter FC bounds (TS landscape with large negative FCs)
python scripts/regenerate_convergence_results.py \
    --system heck-relay \
    --output-dir ../q2mm-data/benchmarks \
    --ratio-tol none --ftol 1e-12 \
    --fc-fraction 0.05 --eq-fraction 0.05 \
    --maxiter 500

# Opt-out: published-FF-start baseline — writes to from-published/
python scripts/regenerate_convergence_results.py \
    --starting-point published \
    --output-dir ../q2mm-data/benchmarks
```

See `scripts/regenerate_convergence_results.py --help` for all options.
Every committed JSON's `provenance.command_line` records the exact
flags used for that artifact — use those as the authoritative
reproduction command if you need to re-derive a specific file.
