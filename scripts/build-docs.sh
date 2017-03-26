#!/bin/bash

# Exit on error
set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..
pushd ${DIR}
make clean
make transifex_pull
make html
# make all-pdf
popd
