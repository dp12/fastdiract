#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
source "$SCRIPT_DIR/definitions"

if ! [ -d "$FASTDIRACT_DIR" ]; then
    mkdir -p "$FASTDIRACT_DIR"
else
    echo "error: $FASTDIRACT_DIR already exists"
    exit 1
fi

if ! [ -f "${FASTDIR_FILE}" ]; then
    cat <<EOF > "${FASTDIR_FILE}"
d0 = ~/alpha
d1 = ~/beta
d2 = ~/gamma
d3 = ~/delta
d4 = ~/epsilon
d5 = ~/zeta
d6 = ~/eta
d7 = ~/theta
d8 = ~/iota
d9 = ~/kappa
EOF
    echo "Creating fastdirs template"
else
    echo "fastdirs file already exists"
fi

if ! [ -f "${FASTACT_FILE}" ]; then
    cat <<EOF > "${FASTACT_FILE}"
f0 = echo alpha
f1 = echo beta
f2 = echo gamma
f3 = echo delta
f4 = echo epsilon
f5 = echo zeta
f6 = echo eta
f7 = echo theta
f8 = echo iota
f9 = echo kappa
EOF
    echo "Creating fastactions template"
else
    echo "fastactions file already exists"
fi

echo "Run \"source $SCRIPT_DIR/definitions\" and add it to your bashrc/zshrc file"
