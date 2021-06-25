#!/usr/bin/env bash

set -euo pipefail

# best explanation so far of tags
# https://snarky.ca/the-challenges-in-designing-a-library-for-pep-425/

PEX_VERSION=2.1.31
PANTS_VERSION=1.26.0
PYTHON=${PYTHON:-python3}
PYTHON_MAJOR_MINOR=$($PYTHON --version | grep -o '3\.[0-9]*')
PANTS_INTERPRETER_CONSTRAINT="CPython==$PYTHON_MAJOR_MINOR.*"
echo Setting python constraint $PANTS_INTERPRETER_CONSTRAINT

function pex() {
    local pex_exe="./pex-${PEX_VERSION}.pex"
    if [ ! -x "${pex_exe}" ]; then
         wget \
             -q \
             -O - \
             https://github.com/pantsbuild/pex/releases/download/v${PEX_VERSION}/pex \
             > "${pex_exe}.download"
         chmod +x "${pex_exe}.download"
         mv "${pex_exe}.download" "${pex_exe}"
    fi
    echo "${pex_exe}"
}

PANTS_VERSION=${PANTS_VERSION} \
$PYTHON $(pex) \
    -r requirements.txt \
    --interpreter-constraint "${PANTS_INTERPRETER_CONSTRAINT}" \
    -c pants \
    -o pants.pex \
    --venv

# show contents
PEX_TOOLS=1 ./pants.pex info --indent 4
