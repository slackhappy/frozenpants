#!/usr/bin/env bash

set -euo pipefail

# best explanation so far of tags
# https://snarky.ca/the-challenges-in-designing-a-library-for-pep-425/

./bootstrap.sh

PANTS_VERSION=1.26.0

echo Building pants "$PANTS_VERSION" pex
PANTS_VERSION=${PANTS_VERSION} \
.venv/bin/pex -r requirements.txt \
    -c pants \
    -o pants.pex \
    --venv

echo Done.  Contents:
# show contents
PEX_TOOLS=1 .venv/bin/python3 ./pants.pex info --indent 4
