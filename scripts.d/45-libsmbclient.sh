#!/usr/bin/env bash

ffbuild_enabled() {
    [[ $TARGET == linux* ]] || return 1
    return 0
}

ffbuild_configure() {
    echo "--enable-libsmbclient"
}

ffbuild_dockerbuild() {
    apt-get update
    apt-get install -y libsmbclient-dev
}