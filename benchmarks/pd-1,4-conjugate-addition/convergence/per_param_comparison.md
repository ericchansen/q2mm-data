## Per-parameter comparison: pd-conjugate

Published FF: `pub-pd-conjugate-xm9n3hjy.fld`  
Optimized FF: `pd-conjugate_optimized.fld`

Matched **519** OPT rows (1038 parameter cells: eq + fc per row).

### Summary by category

| Category | N | Mean abs dev | Max abs dev | Median rel dev | Max rel dev |
|---|---:|---:|---:|---:|---:|
| bond eq (Å) | 206 | 0.0072 | 0.7096 | 0.00% | 33.47% |
| bond fc (mdyn/Å) | 206 | 0.3057 | 11.9103 | 0.00% | 98.60% |
| angle eq (°) | 313 | 0.9214 | 54.4817 | 0.00% | 59.66% |
| angle fc (mdyn·Å/rad²) | 313 | 0.0264 | 1.4213 | 0.00% | 3491.64% |

### Summary by chemical motif

| Motif | Param | N | Mean abs dev | Max abs dev | Median rel dev |
|---|---|---:|---:|---:|---:|
| L-M-L angle | eq | 21 | 10.0149 | 54.4817 | 0.00% |
| L-M-L angle | fc | 21 | 0.0779 | 0.7715 | 0.00% |
| M-L bond | eq | 10 | 0.0348 | 0.1934 | 0.00% |
| M-L bond | fc | 10 | 0.8904 | 2.7927 | 0.00% |
| M-L-X angle | eq | 14 | 1.8043 | 13.5610 | 0.00% |
| M-L-X angle | fc | 14 | 0.1940 | 1.2116 | 0.00% |
| X-H bond | eq | 25 | 0.0011 | 0.0240 | 0.00% |
| X-H bond | fc | 25 | 0.3322 | 4.2651 | 0.00% |
| X-H-Y angle | eq | 76 | 0.4694 | 31.1367 | 0.00% |
| X-H-Y angle | fc | 76 | 0.0056 | 0.1859 | 0.00% |
| ligand angle | eq | 202 | 0.0849 | 6.5286 | 0.00% |
| ligand angle | fc | 202 | 0.0173 | 1.4213 | 0.00% |
| ligand bond | eq | 171 | 0.0065 | 0.7096 | 0.00% |
| ligand bond | fc | 171 | 0.2677 | 11.9103 | 0.00% |

### Top 15 largest relative deviations

| Rank | Kind | Param | Atoms | Pub | Optimized | Abs Δ | Rel Δ | Motif |
|---:|---|---|---|---:|---:|---:|---:|---|
| 1 | angle | fc | C2–C2–PD | 0.0347 | 1.2463 | +1.2116 | +3491.64% | M-L-X angle |
| 2 | angle | fc | C2–N2–PD | 0.0044 | -0.0458 | -0.0502 | -1140.91% | M-L-X angle |
| 3 | angle | fc | C2–C2–C2 | 0.0397 | 0.1747 | +0.1350 | +340.05% | ligand angle |
| 4 | angle | fc | C2–C2–PD | 0.3880 | 1.2397 | +0.8517 | +219.51% | M-L-X angle |
| 5 | angle | fc | C2–PD–N2 | 0.0381 | 0.0919 | +0.0538 | +141.21% | L-M-L angle |
| 6 | bond | fc | N2–PD | 2.8324 | 0.0397 | -2.7927 | -98.60% | M-L bond |
| 7 | bond | fc | N2–PD | 2.6731 | 0.0393 | -2.6338 | -98.53% | M-L bond |
| 8 | bond | fc | C3–O3 | 4.9151 | 0.1830 | -4.7321 | -96.28% | ligand bond |
| 9 | bond | fc | C2–C3 | 5.4066 | 0.2444 | -5.1622 | -95.48% | ligand bond |
| 10 | bond | fc | C2–O2 | 12.5120 | 0.6017 | -11.9103 | -95.19% | ligand bond |
| 11 | bond | fc | C2–C2 | 5.6388 | 0.2829 | -5.3559 | -94.98% | ligand bond |
| 12 | bond | fc | C3–N2 | 3.5244 | 0.2031 | -3.3213 | -94.24% | ligand bond |
| 13 | bond | fc | C2–C2 | 4.6494 | 0.2844 | -4.3650 | -93.88% | ligand bond |
| 14 | bond | fc | C2–C2 | 3.5563 | 0.2829 | -3.2734 | -92.05% | ligand bond |
| 15 | angle | fc | C2–PD–N2 | 0.8644 | 0.0929 | -0.7715 | -89.25% | L-M-L angle |
