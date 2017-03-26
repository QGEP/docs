#!/bin/bash
if test "$TRAVIS_SECURE_ENV_VARS" = "true" -a "$TRAVIS_BRANCH" = "master";
then
  echo -e "[https://www.transifex.com]\nhostname = https://www.transifex.com\nusername = $TRANSIFEX_USERNAME\npassword = $TRANSIFEX_PASSWORD\ntoken =\n" > ~/.transifexrc
  make gettext
  tx push -s
else
  echo "  Not on master branch. Will not push to transifex."
fi
