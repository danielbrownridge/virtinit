#! /bin/sh
# file: after.sh

testFoundCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertTrue "${cmd} missing: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2

