#!/usr/bin/env bash

ffbuild_enabled() {
    return 0
}

ffbuild_configure() {
    echo --enable-libsmbclient
}

ffbuild_dockerbuild() {
    apt-get install -y libsmbclient-dev
}
