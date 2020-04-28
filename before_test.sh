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
CPU-Checker cpu-checker
virtualbox virtualbox-6.0
Vagrant vagrant
EOF
}

testNotFoundCommand() {
    while read -r cmd; do
        output=$(command -v "$cmd")
        rtrn=$?
        assertFalse "Found $cmd: $output" $rtrn
    done <<EOF
pip3
ansible-playbook
kvm-ok
vboxmanage
virtualbox
EOF
}

# shellcheck disable=SC1091
. ./shunit2
