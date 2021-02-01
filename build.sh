#! /bin/bash

set -x

if [ "$(uname)" == 'Linux' ]; then
    ./build_pex.sh
elif [ "$(uname)" == 'Darwin' ]; then
    # pex 2.1.7, used by pants 1.26.0
    # states that it is incompatible with python 3.9
    # (looks like not found, but actual issue is python)
    # can't use system python, which for macos 10.15 is
    # python3.8 because xcode won't compile python c libs
    # against it, but downloading a new tarball works
    ./pyenv.sh 3.8.7
    PYTHON_PATH=.deps/pyenv/versions/3.8.7/bin/python3 ./build_pex.sh
fi
