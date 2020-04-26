#! /bin/sh
# file: before_test.sh

testMissingCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertFalse "${cmd} found: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2
