#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
source "$SCRIPT_DIR/definitions"

if ! [ -d "$FASTDIRACT_DIR" ]; then
    mkdir -p "$FASTDIRACT_DIR"
else
    echo "error: $FASTDIRACT_DIR already exists"
fi

if ! [ -f "${FASTDIR_FILE}__default" ]; then
    cat <<EOF > "${FASTDIR_FILE}__default"
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
    ln -s "$FASTDIRACT_DIR/fastdirs__default" "$FASTDIR_FILE"
    echo "Creating fastdirs template"
else
    echo "fastdirs file already exists"
fi

if ! [ -f "${FASTACT_FILE}__default" ]; then
    cat <<EOF > "${FASTACT_FILE}__default"
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
    ln -s "$FASTDIRACT_DIR/fastactions__default" "$FASTACT_FILE"
    echo "Creating fastactions template"
else
    echo "fastactions file already exists"
fi

if ! [ -f "${FASTVIM_FILE}__default" ]; then
    cat <<EOF > "${FASTVIM_FILE}__default"
v0 = vim alpha
v1 = vim beta
v2 = vim gamma
v3 = vim delta
v4 = vim epsilon
v5 = vim zeta
v6 = vim eta
v7 = vim theta
v8 = vim iota
v9 = vim kappa
EOF
    ln -s "$FASTDIRACT_DIR/fastvim__default" "$FASTVIM_FILE"
    echo "Creating fastvim template"
else
    echo "fastvim file already exists"
fi

echo "Run \"source $SCRIPT_DIR/definitions\" and add it to your bashrc/zshrc file"
