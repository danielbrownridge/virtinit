#! /bin/sh
# file: after.sh

testFoundPackagePip3() {
    pkg=python3-pip
    output=$(apt-cache search --names-only $pkg)
    assertContains "package" "$output" "$pkg"
}

testFoundCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertTrue "${cmd} missing: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2

