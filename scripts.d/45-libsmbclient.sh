#!/usr/bin/env bash
# shellcheck disable=SC2034

SCRIPT_REPO="https://github.com/samba-team/samba.git"
SCRIPT_COMMIT="samba-4.19.4"

ffbuild_enabled() {
    [[ $TARGET == linux* ]] || return 1
}

ffbuild_dockerbuild() {
    ./configure \
      --prefix="$FFBUILD_PREFIX" \
      --enable-shared \
      --disable-static \
      --enable-libsmbclient
    make -j$(nproc)
    make install DESTDIR="$FFBUILD_DESTDIR"
}

ffbuild_configure() {
    echo --enable-libsmbclient
}

ffbuild_unconfigure() {
    echo --disable-libsmbclient
}