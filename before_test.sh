#! /bin/sh
# file: before_test.sh

testNotFoundPackagePip3() {
    pkg=python3-pip
    output=$(apt-cache search --names-only $pkg)
    assertNotContains "$output" "$output" "$pkg"
}

testInstalledPkg() {
    while read -r pkg desc; do
    output=$(apt-cache search --names-only "$pkg")
    assertContains "Not found $desc" "$output" "$pkg"
    output=$(dpkg --status "$pkg" 2>&1)
    assertContains "$desc: $output" "$output" "Status: install ok installed"
    done <<EOF
python3-apt the python apt bindings
EOF
}

testNotInstalledPkg() {
    while read -r pkg desc; do
        output=$(dpkg --status "$pkg" 2>&1)
        assertContains "Found $desc:" "$output" "package '$pkg' is not installed"
    done <<EOF
cpu-checker CPU-Checker
python3-pip pip3
python3-setuptools setuptools
python3-wheel wheel
virtualbox-6.0 virtualbox
vagrant Vagrant
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
