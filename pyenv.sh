mkdir -p .deps

if [ ! -d .deps/pyenv ]; then
 git clone -q https://github.com/pyenv/pyenv.git .deps/pyenv
fi

PYENV_ROOT=.deps/pyenv .deps/pyenv/bin/pyenv install $1

