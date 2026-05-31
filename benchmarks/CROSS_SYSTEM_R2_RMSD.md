## R² / RMSD comparison: published paper vs q2mm @ published vs q2mm @ QFUERZA

Per-system, per-category goodness of fit between MM predictions and the QM training data. _Same reference data is used for both q2mm columns_ (the published TSFF papers use the same training set, evaluated through MacroModel/MM3* instead of q2mm/JaxEngine).

### rh-enamide

| Metric | Published paper R²/RMSD | q2mm @ published start | q2mm @ QFUERZA start |
|---|---:|---:|---:|
| Bond length | R²=— / RMSD=0.03 Å | R²=0.9892 / RMSD=0.03859 Å | R²=0.9791 / RMSD=0.05371 Å |
| Bond angle | R²=— / RMSD=2 deg | R²=0.9545 / RMSD=3.206 deg | R²=0.9503 / RMSD=3.349 deg |
| Hessian eig (diag) | R²=— / RMSD=— mdyn/Å | R²=0.9683 / RMSD=0.06762 mdyn/Å | R²=0.9689 / RMSD=0.067 mdyn/Å |
| Final OF | — | 2.699e+05 | 2.943e+05 |
| Optimizer L-BFGS-B iters | — | 13 | 20 |

_Paper note: Donoghue 2008 is paywalled. Bond RMSD ≤ 0.03 Å and angle RMSD < 2° are upper bounds from Tables 5–6. Energy RMSD ~0.4 kcal/mol from Table 7. Eigenvalue R² not reported by the paper. External-selectivity MUE = 0.6 kcal/mol over 18 test cases._

### pd-allyl

| Metric | Published paper R²/RMSD | q2mm @ published start | q2mm @ QFUERZA start |
|---|---:|---:|---:|
| Bond length | R²=0.988 / RMSD=— Å | R²=0.04612 / RMSD=0.37 Å | R²=0.4155 / RMSD=0.2896 Å |
| Bond angle | R²=0.988 / RMSD=— deg | R²=0.3311 / RMSD=14.26 deg | R²=0.4905 / RMSD=12.45 deg |
| Hessian eig (diag) | R²=0.998 / RMSD=— mdyn/Å | R²=-2.822 / RMSD=0.2789 mdyn/Å | R²=-2.594 / RMSD=0.2705 mdyn/Å |
| Final OF | — | 7.991e+06 | 6.140e+06 |
| Optimizer L-BFGS-B iters | — | 2 | 3 |

_Paper note: Main text: 'R² values for the internal validation range from 0.988 to 0.998 for geometric and Hessian eigenvalues.' The 0.988 is the AGGREGATE geometric R² (bonds+angles+torsions combined) — not per-category. The 0.998 is Hessian eigenvalue R². Charges R² = 0.822. Energy values are EXTERNAL: 77 selectivity predictions, R² = 0.41, MUE = 4.4 kJ/mol = 1.05 kcal/mol._

### pd-conjugate

| Metric | Published paper R²/RMSD | q2mm @ published start | q2mm @ QFUERZA start |
|---|---:|---:|---:|
| Bond length | R²=0.99 / RMSD=— Å | R²=0.9495 / RMSD=0.07567 Å | R²=0.4048 / RMSD=0.2598 Å |
| Bond angle | R²=0.99 / RMSD=— deg | R²=0.03686 / RMSD=17.9 deg | R²=0.1546 / RMSD=16.77 deg |
| Hessian eig (diag) | R²=— / RMSD=— mdyn/Å | R²=-9.642 / RMSD=0.4119 mdyn/Å | R²=-4.641 / RMSD=0.2999 mdyn/Å |
| Final OF | — | 7.235e+06 | 6.220e+06 |
| Optimizer L-BFGS-B iters | — | 3 | 5 |

_Paper note: Internal R² > 0.99 (aggregate, slopes ~1.01) per docs citing paper. No per-category or eigenvalue R² accessible. DOI correction: 10.1021/acs.joc.1c00136 is correct (the joc.0c02918 in some README files is wrong, 404s). Wahlers dissertation Ch. 5 (not Ch. 4). Energy: 82 external predictions, R² = 0.877, MUE = 1.8 kJ/mol = 0.43 kcal/mol._

### rh-conjugate

| Metric | Published paper R²/RMSD | q2mm @ published start | q2mm @ QFUERZA start |
|---|---:|---:|---:|
| Bond length | R²=0.95 / RMSD=— Å | R²=0.8219 / RMSD=0.1651 Å | R²=0.777 / RMSD=0.1847 Å |
| Bond angle | R²=0.95 / RMSD=— deg | R²=0.5398 / RMSD=15.2 deg | R²=0.3374 / RMSD=18.24 deg |
| Hessian eig (diag) | R²=— / RMSD=— mdyn/Å | R²=-12.85 / RMSD=0.4639 mdyn/Å | R²=-4.746 / RMSD=0.2988 mdyn/Å |
| Final OF | — | 5.095e+06 | 7.668e+06 |
| Optimizer L-BFGS-B iters | — | 4 | 2 |

_Paper note: No published paper. Internal aggregate (all categories pooled): bisphosphine slopes 0.94–1.01, R² 0.91–0.99; diene slopes 1.0–1.07, R² 0.92–0.99. No per-category breakdown. R² 0.95 cells are midpoint of those ranges. Energy values are bisphosphine 67-structure EXTERNAL validation: R² = 0.64, MUE = 4.1 kJ/mol = 0.98 kcal/mol. Diene class: R² = 0.37, MUE = 5.3 kJ/mol. Wahlers dissertation Ch. 6 (not Ch. 5)._

### heck-relay

| Metric | Published paper R²/RMSD | q2mm @ published start | q2mm @ QFUERZA start |
|---|---:|---:|---:|
| Bond length | R²=— / RMSD=— Å | R²=0.983 / RMSD=0.04261 Å | R²=-6228 / RMSD=25.77 Å |
| Bond angle | R²=— / RMSD=— deg | R²=0.9088 / RMSD=5.19 deg | R²=-8.348 / RMSD=52.56 deg |
| Hessian eig (diag) | R²=— / RMSD=— mdyn/Å | R²=-14.28 / RMSD=0.5056 mdyn/Å | R²=-4.662 / RMSD=0.3078 mdyn/Å |
| Final OF | — | 1.454e+06 | 1.317e+08 |
| Optimizer L-BFGS-B iters | — | 7 | 0 |

_Paper note: Main text says slope/R² 'near unity' for bonds/angles/torsions/eigenvalues — numeric values are in SI Figs S3–S6 (not accessible). Training-set geometry mean RMSD = 0.25 Å. Energy values are EXTERNAL selectivity validation against 151 corrected experimental points: R² = 0.89, MUE = 1.8 kJ/mol = 0.43 kcal/mol, RMSD = 2.3 kJ/mol = 0.55 kcal/mol._
