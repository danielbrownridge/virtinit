#! /bin/sh
# file: before_test.sh

testNotFoundPackagePip3() {
    pkg=python3-pip
    output=$(apt-cache search --names-only $pkg)
    assertNotContains "$output" "$output" "$pkg"
}

testNotFoundCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertFalse "${cmd} found: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2
