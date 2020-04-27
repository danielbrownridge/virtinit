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

testNotInstalledAptAnsible() {
    pkg=ansible
    output=$(dpkg --status $pkg 2>&1)
    assertContains "$output" "package '$pkg' is not installed"
}

testCommandFoundAnsiblePlaybook() {
    cmd="ansible-playbook"
    output=$(dpkg --status $pkg 2>&1)
    output=$(command -v ${cmd})
    rtrn=$?
    assertTrue "${cmd} missing: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2

