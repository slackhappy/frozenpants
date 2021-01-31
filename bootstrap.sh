#! /bin/bash

set -xeo pipefail

if [ ! -d .deps ]; then
  mkdir .deps
fi

if [ ! -f .deps/virtualenv.pyz ]; then
  cd .deps
  wget https://bootstrap.pypa.io/virtualenv.pyz
  cd ..
fi

if [ ! -f .venv/bin/pex ]; then
  if [ ! -d .venv ]; then
    python .deps/virtualenv.pyz -p python3 .venv
  fi
  .venv/bin/pip install pex
fi
