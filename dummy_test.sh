#! /bin/sh
# file: tests/dummy.sh

testEquality() {
    assertEquals 1 1
}

# shellcheck disable=SC1091
. ./shunit2
