#!/usr/bin/env bash

ffbuild_enabled() {
    [[ $TARGET == linux* ]] || return 1
    return 0
}

ffbuild_dockerbuild() {
    apt-get update
    apt-get install -y libsmbclient-dev
}

ffbuild_configure() {
    echo "--enable-libsmbclient"
}

# 不需要下载源码
ffbuild_clone() {
    return 0
}

# 不需要编译
ffbuild_build() {
    return 0
}