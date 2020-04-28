#! /bin/sh
# file: after.sh

testInstalledPkg() {
    while read -r pkg desc; do
    output=$(apt-cache search --names-only "$pkg")
    assertContains "Not found $desc" "$output" "$pkg"
    output=$(dpkg --status "$pkg" 2>&1)
    assertContains "$desc: $output" "$output" "Status: install ok installed"
    done <<EOF
cpu-checker CPU-Checker
python3-pip pip3
python3-apt the python apt bindings
python3-setuptools setuptools
python3-wheel wheel
virtualbox-6.0 virtualbox
vagrant Vagrant
EOF
}

testNotInstalledPkg() {
    while read -r desc pkg; do
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
vagrant
vboxmanage
virtualbox
EOF
}

# shellcheck disable=SC1091
. ./shunit2
