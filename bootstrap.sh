#! /bin/bash

set -xeo pipefail

PYTHON_PATH=${PYTHON_PATH:-python3}
echo bootstrapping virtualenv with $PYTHON_PATH

PEX_VERSION=2.1.31

mkdir -p .deps

if [ ! -f .deps/virtualenv.pyz ]; then
  cd .deps
  wget -q https://bootstrap.pypa.io/virtualenv.pyz
  cd ..
fi

if [ ! -f .venv/bin/pex ]; then
  if [ ! -d .venv ]; then
    python .deps/virtualenv.pyz -p "$PYTHON_PATH" .venv
  fi
  .venv/bin/pip install pex=="$PEX_VERSION"
fi
