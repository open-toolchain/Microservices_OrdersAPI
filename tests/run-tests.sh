#!/bin/bash
GRUNTFILE="./tests/server/Gruntfile.js"
if [ -f $GRUNTFILE ]; then
  export PATH=/opt/IBM/node-v6.7.0/bin:$PATH
  npm install
  npm install -g grunt-cli

  set +e
  grunt dev-test-cov --no-color --gruntfile $GRUNTFILE --base .
  grunt_result=$?
  set -e
  
  FILE_LOCATIONS="./tests/server/mochatest.xml;./tests/server/coverage/reports/coverage-summary.json"
  TEST_TYPES="unittest;code"
  TEST_STATUS=$grunt_result
else
  echo "$GRUNTFILE not found."
fi
