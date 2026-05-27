#!/usr/bin/env bash
# audit-orphans.sh — flag benchmarks/<system>/<subdir>/ directories that
# no code or documentation in the q2mm repo references.
#
# Usage:
#   scripts/audit-orphans.sh [path-to-q2mm-checkout]
#
# If no path is given, defaults to ../q2mm (the standard worktree
# layout where q2mm and q2mm-data are siblings).
#
# The audit greps the q2mm checkout's docs/, test/, q2mm/, scripts/,
# and examples/ directories for any path containing the subdir name
# (e.g. "rh-enamide/results"). Any subdirectory of benchmarks/<system>/
# without at least one hit is reported as a candidate orphan.
#
# Exit code: 0 if no orphans, 1 if any are found.
#
# Run periodically (or wire into CI in q2mm-data) to catch directories
# that have lost their references — see README "Stewardship rule".

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
Q2MM_PATH="${1:-${REPO_ROOT}/../q2mm}"

if [ ! -d "${Q2MM_PATH}" ]; then
    echo "ERROR: q2mm checkout not found at ${Q2MM_PATH}" >&2
    echo "Usage: $0 [path-to-q2mm-checkout]" >&2
    exit 2
fi

Q2MM_PATH="$(cd "${Q2MM_PATH}" && pwd)"
echo "Auditing $(realpath --relative-to=. "${REPO_ROOT}/benchmarks")/"
echo "against q2mm checkout at ${Q2MM_PATH}/"
echo

declare -a ORPHANS=()

# Walk benchmarks/<system>/<subdir>/
for sysdir in "${REPO_ROOT}"/benchmarks/*/; do
    for subdir in "${sysdir}"*/; do
        [ -d "${subdir}" ] || continue
        system_name="$(basename "${sysdir}")"
        sub="$(basename "${subdir}")"
        relpath="${system_name}/${sub}"  # e.g. "rh-enamide/results"

        # Search q2mm for any reference — escape glob-special chars in the
        # path for the literal grep.  We accept either a string match in
        # tracked files or a markdown link to the q2mm-data tree path.
        hits=$(
            (
                cd "${Q2MM_PATH}" && \
                git grep -l --fixed-strings -- "${relpath}" -- \
                    docs/ test/ q2mm/ scripts/ examples/ \
                    2>/dev/null || true
            ) | wc -l
        )

        if [ "${hits}" -eq 0 ]; then
            ORPHANS+=("benchmarks/${relpath}")
        fi
    done
done

if [ "${#ORPHANS[@]}" -eq 0 ]; then
    echo "✅ No orphaned directories — every benchmarks/*/subdir is referenced in q2mm."
    exit 0
fi

echo "❌ Found ${#ORPHANS[@]} orphaned director$([ "${#ORPHANS[@]}" -eq 1 ] && echo y || echo ies):"
echo
for orphan in "${ORPHANS[@]}"; do
    size=$(du -sh "${REPO_ROOT}/${orphan}" 2>/dev/null | cut -f1)
    echo "  - ${orphan}  (${size:-?})"
done
echo
echo "These directories have no references in the q2mm repo at ${Q2MM_PATH}."
echo "Either wire them into a doc/test in the same PR, or remove them per"
echo "the stewardship rule in README.md."
exit 1
