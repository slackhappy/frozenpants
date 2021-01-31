#! /bin/bash

# best explanation so far of tags
# https://snarky.ca/the-challenges-in-designing-a-library-for-pep-425/

./bootstrap.sh

PANTS_VERSION=1.26.0
PANTS_PEX_DEPS="
pantsbuild.pants==${PANTS_VERSION}
pantsbuild.pants.contrib.avro==${PANTS_VERSION}
pantsbuild.pants.contrib.awslambda_python==${PANTS_VERSION}
pantsbuild.pants.contrib.buildgen==${PANTS_VERSION}
pantsbuild.pants.contrib.codeanalysis==${PANTS_VERSION}
pantsbuild.pants.contrib.confluence==${PANTS_VERSION}
pantsbuild.pants.contrib.cpp==${PANTS_VERSION}
pantsbuild.pants.contrib.errorprone==${PANTS_VERSION}
pantsbuild.pants.contrib.findbugs==${PANTS_VERSION}
pantsbuild.pants.contrib.go==${PANTS_VERSION}
pantsbuild.pants.contrib.googlejavaformat==${PANTS_VERSION}
pantsbuild.pants.contrib.jax_ws==${PANTS_VERSION}
pantsbuild.pants.contrib.mypy==${PANTS_VERSION}
pantsbuild.pants.contrib.node==${PANTS_VERSION}
pantsbuild.pants.contrib.python.checks==${PANTS_VERSION}
pantsbuild.pants.contrib.python.checks.checker==${PANTS_VERSION}
pantsbuild.pants.contrib.scalajs==${PANTS_VERSION}
pantsbuild.pants.contrib.scrooge==${PANTS_VERSION}
pantsbuild.pants.contrib.thrifty==${PANTS_VERSION}
pantsbuild.pants.testutil==${PANTS_VERSION}
"
echo $PANTS_PEX_DEPS

.venv/bin/pex $PANTS_PEX_DEPS  -m pants.bin.pants_loader:main -o pants.pex

#./pantsav.pex --backend-packages="+['pants.contrib.avro']"  targets
