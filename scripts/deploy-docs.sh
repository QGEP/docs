#!/bin/bash

# Exit on error
set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..

pushd ${DIR}
mkdir publish
cd publish
git clone git@github.com:QGEP/docs.git --branch gh-pages
cd docs
git rm . -r
cp ../../build/html/* . -r
touch .nojekyll
git add -A
git commit -m "Automatic update from https://github.com/qgep/docs/commit/${TRAVIS_COMMIT}"
git push
popd
