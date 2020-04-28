#! /bin/sh
# file: after.sh

testInstalledPkg() {
    while read -r desc pkg; do
    output=$(apt-cache search --names-only "$pkg")
    assertContains "Not found $desc" "$output" "$pkg"
    output=$(dpkg --status "$pkg" 2>&1)
    assertContains "$desc: $output" "$output" "Status: install ok installed"
    done <<EOF
pip3 python3-pip
setuptools python3-setuptools
wheel python3-wheel
CPU-Checker cpu-checker
virtualbox virtualbox-6
EOF
}

testNotInstalledPkg() {
    while read -r desc pkg; do
        echo "$desc: $pkg"
        output=$(dpkg --status "$pkg" 2>&1)
        assertContains "Found $desc:" "$output" "package '$pkg' is not installed"
    done <<EOF
ansible ansible
EOF
}

testFoundCommand() {
    while read -r cmd; do
        output=$(command -v "$cmd")
        rtrn=$?
        assertTrue "${cmd} missing: ${output}" ${rtrn}
    done <<EOF
ansible-playbook
kvm-ok
pip3
virtualbox
vboxmanage
EOF
}

# shellcheck disable=SC1091
. ./shunit2
