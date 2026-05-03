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
├── ch3f/                            # CH₃F small-molecule benchmark
│   ├── results/*.json               # 100 optimizer runs (L-BFGS-B, Nelder-Mead, Optax, …)
│   └── forcefields/                 # Optimized force fields per run
├── rh-enamide/                      # Rh-enamide TS (Donoghue 2008), 9 molecules
│   ├── results/*.json               # JaxOpt, Optax, and regularized runs
│   └── forcefields/
├── heck-relay/                      # Heck relay (Rosales 2020), 23 molecules
│   ├── results/*.json
│   └── forcefields/
├── pd-allyl-amination/              # Pd allyl amination (Wahlers 2021), 9 molecules
│   ├── results/*.json
│   └── forcefields/
├── pd-1,4-conjugate-addition/       # Pd 1,4-conjugate addition (Wahlers 2021), 10 molecules
│   ├── results/*.json
│   └── forcefields/
└── rh-1,4-conjugate-addition/       # Rh 1,4-conjugate addition (Wahlers 2022), 10 molecules
    ├── results/*.json
    └── forcefields/

qfuerza-zenodo/                      # QFUERZA paper validation data
├── README.md
├── cisplatin/                       # Cisplatin ground state (Farrugia 2025)
└── rh-enamide/                      # Rh-enamide QFUERZA/FUERZA force fields
```

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
