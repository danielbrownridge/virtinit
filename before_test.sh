#! /bin/sh
# file: before_test.sh

testNotFoundPackagePip3() {
    pkg=python3-pip
    output=$(apt-cache search --names-only $pkg)
    assertNotContains "$output" "$output" "$pkg"
}

testNotInstalledPkgPip3() {
    pkg=python3-pip
    output=$(dpkg --status $pkg 2>&1)
    assertContains "$output" "package '$pkg' is not installed"
}

testNotInstalledPkgSetuptools() {
    pkg=python3-setuptools
    output=$(dpkg --status $pkg 2>&1)
    assertContains "$output" "package '$pkg' is not installed"
}

testNotFoundCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertFalse "${cmd} found: ${output}" ${rtrn}
}

testNotFoundCommandAnsiblePlaybook() {
    cmd="ansible-playbook"
    output=$(dpkg --status $pkg 2>&1)
    output=$(command -v ${cmd})
    rtrn=$?
    assertFalse "${cmd} missing: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2
