#! /bin/sh
# file: after.sh

testMissingPackagePip3() {
    pkg=python3-pip
    output=$(apt-cache search --names-only $pkg)
    assertContains "$output" "$pkg"
    echo "the output was: $output"
}

testFoundCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertTrue "${cmd} missing: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2

