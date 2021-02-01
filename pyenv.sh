mkdir -p .deps

if [ ! -d .deps/pyenv ]; then
 git clone -q https://github.com/pyenv/pyenv.git .deps/pyenv
fi

if [ ! -d ".deps/pyenv/versions/$1" ]; then
  PYENV_ROOT=.deps/pyenv .deps/pyenv/bin/pyenv install "$1"
fi

