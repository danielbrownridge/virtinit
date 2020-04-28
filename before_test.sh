#! /bin/sh
# file: before_test.sh

testNotFoundPackagePip3() {
    pkg=python3-pip
    output=$(apt-cache search --names-only $pkg)
    assertNotContains "$output" "$output" "$pkg"
}

testNotInstalledPkg() {
    while read -r desc pkg; do
        echo "$desc: $pkg"
        output=$(dpkg --status "$pkg" 2>&1)
        assertContains "Found $desc:" "$output" "package '$pkg' is not installed"
    done <<EOF
pip3 python3-pip
setuptools python3-setuptools
wheel python3-wheel
EOF
}

testNotFoundCommandPip3() {
    cmd="pip3"
    output=$(command -v ${cmd})
    rtrn=$?
    assertFalse "${cmd} found: ${output}" ${rtrn}
}

testNotFoundCommandAnsiblePlaybook() {
    cmd="ansible-playbook"
    output=$(dpkg --status "$pkg" 2>&1)
    output=$(command -v ${cmd})
    rtrn=$?
    assertFalse "${cmd} missing: ${output}" ${rtrn}
}

# shellcheck disable=SC1091
. ./shunit2
