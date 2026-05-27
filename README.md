# q2mm-data

Benchmark results and validation data for
[q2mm](https://github.com/ericchansen/q2mm) (Quantum to Molecular Mechanics).

This repository stores optimizer benchmark outputs (JSON result files,
optimized force fields) and reference validation data separately from the
main codebase.  Numbers cited in the q2mm documentation trace back to the
JSON files committed here.

## Structure

```
benchmarks/
├── ch3f/                                # CH₃F small-molecule benchmark
│   ├── convergence/                     # Ratio-gated end-to-end optimization (current pipeline)
│   ├── results/*.json                   # 100 optimizer runs (L-BFGS-B, Nelder-Mead, Optax, …) — full-matrix CLI output
│   └── forcefields/                     # Optimized force fields per run from the matrix output
├── rh-enamide/                          # Rh-enamide TS (Donoghue 2008), 9 molecules
│   └── convergence/                     # Ratio-gated end-to-end optimization
├── heck-relay/                          # Heck relay (Rosales 2020), 23 molecules
│   ├── convergence/                     # Ratio-gated end-to-end optimization
│   └── diagnostic/                      # Three-baseline diagnostic (q2mm#277 loader bug)
├── pd-allyl-amination/                  # Pd allyl amination (Wahlers 2021), 21 molecules
│   └── convergence/
├── pd-1,4-conjugate-addition/           # Pd 1,4-conjugate addition (Wahlers 2021), 10 molecules
│   └── convergence/
└── rh-1,4-conjugate-addition/           # Rh 1,4-conjugate addition (Wahlers 2022), 10 molecules
    └── convergence/

qfuerza-zenodo/                          # QFUERZA paper validation data (Farrugia 2025)
├── README.md
├── cisplatin/                           # Cisplatin ground state
└── rh-enamide/                          # Rh-enamide QFUERZA/FUERZA force fields
```

Two standard directory layouts:

- `convergence/` — output of `scripts/regenerate_convergence_results.py`
  in q2mm, the canonical end-to-end ratio-gated optimization pipeline.
  Every published-FF system has exactly one of these.  Contains
  `validation_results.json`, `paper_metrics.json`, and the optimized
  `.fld` force field.
- `results/` + `forcefields/` — output of the legacy full-matrix
  `q2mm-benchmark` CLI.  Currently kept only for `ch3f/`, which is
  the source of the optimizer-matrix table in
  [`docs/systems/small-molecules.md`](https://github.com/ericchansen/q2mm/blob/master/docs/systems/small-molecules.md).
  Do not add new `results/`/`forcefields/` directories for other
  systems unless you also wire them into a docs page in the same PR
  (see "Stewardship rule" below).

## Stewardship rule — every committed file earns its place

This repo follows
[q2mm AGENTS.md §2](https://github.com/ericchansen/q2mm/blob/master/AGENTS.md):

> *"Every file earns its place. If you can't explain why a file exists
> and what would break without it, it probably shouldn't be there.
> No deprecated artifacts. If something is superseded, delete the old
> version in the same commit."*

For this repo specifically:

- **Before committing data**, identify the doc page or test fixture that
  references it.  Put the reference link in the PR description.
- **Before deleting code in q2mm that produced a directory layout here**,
  open a paired cleanup PR in q2mm-data — never let the layout
  references go stale on either side.
- **Don't commit speculative or exploratory output** — write it to a
  local scratch dir.  Only artifacts that back a public claim
  (documentation, paper figure, regression test) belong here.

Run `scripts/audit-orphans.sh` (see below) periodically to catch any
directories that have lost their references.  The same audit now runs
automatically on every pull request and weekly on Mondays.

## Auditing for orphaned data

```bash
# from the q2mm-data repo root, point at a checkout of ericchansen/q2mm:
scripts/audit-orphans.sh ../q2mm
```

The audit also runs automatically in
[Audit orphaned benchmark data](.github/workflows/audit-orphans.yml) on every
pull request, weekly on Mondays at 09:00 UTC, and on manual dispatch.

The script walks every `benchmarks/<system>/<subdir>/` and searches the
q2mm checkout (`docs/`, `test/`, `q2mm/`, `scripts/`, `examples/`) for
references to that path.  Any subdirectory without a reference is
reported as a candidate for deletion or wiring-in.

History note: the systems' legacy `results/` / `forcefields/` directories
(other than `ch3f/`) were dropped in
[#7](https://github.com/ericchansen/q2mm-data/pull/7) after the audit
flagged them as orphans — they had been speculatively populated by the
old full-matrix CLI but never referenced anywhere.

## JSON result format

Each benchmark result JSON contains:

| Key | Description |
|-----|-------------|
| `metadata` | System name, optimizer, backend, force field type |
| `environment` | Python version, GPU model, package versions |
| `qm_reference` | QM reference frequencies |
| `seminario` | QFUERZA analytical starting point (RMSD, eigenvalues) |
| `optimized` | Optimizer output: `rmsd`, `elapsed_s`, `converged`, `message`, `param_initial`, `param_final` |

## Relationship to q2mm

- **Documentation**: q2mm docs reference this repo for raw data backing
  benchmark tables and literature reproduction pages.
- **Test fixtures**: Small golden fixtures for CI tests remain in the main
  q2mm repo (`test/fixtures/`).  This repo stores the full benchmark
  outputs that are too large for the main codebase.
- **Reproducibility**: Run `q2mm-benchmark --output <dir>` to regenerate
  any benchmark.  See the
  [q2mm benchmark docs](https://github.com/ericchansen/q2mm/tree/master/docs/benchmarks)
  for details.

## License

Same as [q2mm](https://github.com/ericchansen/q2mm).
