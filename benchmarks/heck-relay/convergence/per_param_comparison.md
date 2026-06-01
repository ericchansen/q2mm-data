## Per-parameter comparison: heck-relay

Published FF: `pub-heck-relay-3hpvf1xk.fld`  
Optimized FF: `heck-relay_optimized.fld`

Matched **373** OPT rows (746 parameter cells: eq + fc per row).

### Summary by category

| Category | N | Mean abs dev | Max abs dev | Median rel dev | Max rel dev |
|---|---:|---:|---:|---:|---:|
| bond eq (Å) | 92 | 0.0125 | 0.7078 | 0.00% | 33.54% |
| bond fc (mdyn/Å) | 92 | 0.6763 | 9.3305 | 0.00% | 99.07% |
| angle eq (°) | 281 | 0.7717 | 55.3081 | 0.00% | 60.52% |
| angle fc (mdyn·Å/rad²) | 281 | 0.0931 | 7.9058 | 0.00% | 18633.09% |

### Summary by chemical motif

| Motif | Param | N | Mean abs dev | Max abs dev | Median rel dev |
|---|---|---:|---:|---:|---:|
| X-H bond | eq | 19 | 0.0006 | 0.0063 | 0.00% |
| X-H bond | fc | 19 | 0.5749 | 4.0040 | 0.00% |
| X-H-Y angle | eq | 124 | 0.4324 | 30.4736 | 0.00% |
| X-H-Y angle | fc | 124 | 0.0080 | 0.2877 | 0.00% |
| ligand angle | eq | 157 | 1.0397 | 55.3081 | 0.00% |
| ligand angle | fc | 157 | 0.1602 | 7.9058 | 0.00% |
| ligand bond | eq | 73 | 0.0155 | 0.7078 | 0.00% |
| ligand bond | fc | 73 | 0.7027 | 9.3305 | 0.00% |

### Top 15 largest relative deviations

| Rank | Kind | Param | Atoms | Pub | Optimized | Abs Δ | Rel Δ | Motif |
|---:|---|---|---|---:|---:|---:|---:|---|
| 1 | angle | fc | 2–5–4 | 0.0408 | -7.5615 | -7.6023 | -18633.09% | ligand angle |
| 2 | angle | fc | 2–3–4 | 0.3443 | -7.5615 | -7.9058 | -2296.20% | ligand angle |
| 3 | angle | fc | 3–4–5 | 0.0109 | 0.1789 | +0.1680 | +1541.28% | ligand angle |
| 4 | angle | fc | 2–3–C2 | 0.0183 | 0.1682 | +0.1499 | +819.13% | ligand angle |
| 5 | angle | fc | 3–2–5 | 0.4796 | 1.1349 | +0.6553 | +136.63% | ligand angle |
| 6 | angle | fc | H1–5–H1 | 0.2123 | 0.5000 | +0.2877 | +135.52% | X-H-Y angle |
| 7 | bond | fc | 1–2 | 3.7847 | 0.0352 | -3.7495 | -99.07% | ligand bond |
| 8 | bond | fc | 1–2 | 1.6738 | 0.0352 | -1.6386 | -97.90% | ligand bond |
| 9 | angle | fc | 1–2–3 | 1.6204 | 0.0391 | -1.5813 | -97.59% | ligand angle |
| 10 | bond | fc | 4–5 | 6.2700 | 0.2460 | -6.0240 | -96.08% | ligand bond |
| 11 | bond | fc | C3–4 | 4.3748 | 0.1943 | -4.1805 | -95.56% | ligand bond |
| 12 | angle | fc | 1–2–6 | 1.2907 | 0.0579 | -1.2328 | -95.51% | ligand angle |
| 13 | bond | fc | C3–5 | 4.2280 | 0.1943 | -4.0337 | -95.40% | ligand bond |
| 14 | bond | fc | 2–3 | 9.8049 | 0.4744 | -9.3305 | -95.16% | ligand bond |
| 15 | bond | fc | 3–4 | 7.3324 | 0.3685 | -6.9639 | -94.97% | ligand bond |
