# Convergence baselines

This directory and its sibling `<system>/convergence/` directories hold
the canonical baseline data for the published-FF benchmark systems.

## What's in each `<system>/convergence/` directory

| File | Purpose |
|------|---------|
| `validation_results.json` | Top-level per-system summary: param counts, initial objective score, initial JaxLoss, ratio, ratio status, per-category Seminario fit, optimization result (when run). |
| `paper_metrics.json` | Per-category Seminario + post-optimization fit (R², RMSD, MAE, n_refs for bond_length, bond_angle, eig_diagonal). |
| `<system>_optimized.fld` | (Optional) Optimized force field, written only when the ratio gate passes and L-BFGS-B optimization actually ran. |

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
# Regenerate baseline only (~60-90 min for all 5 systems on a single GPU)
python scripts/regenerate_convergence_results.py \
    --skip-optimization \
    --output-dir ../q2mm-data/benchmarks

# Add optimization to systems that pass the ratio gate
python scripts/regenerate_convergence_results.py \
    --system rh-enamide \
    --system pd-allyl \
    --output-dir ../q2mm-data/benchmarks

# Experimental: bypass the ratio gate for borderline systems
python scripts/regenerate_convergence_results.py \
    --system pd-conjugate \
    --ratio-tol none \
    --output-dir ../q2mm-data/benchmarks
```

See `scripts/regenerate_convergence_results.py --help` for all options.
