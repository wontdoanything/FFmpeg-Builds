#!/usr/bin/env bash
# shellcheck disable=SC2034

SCRIPT_REPO="https://github.com/samba-team/samba.git"
SCRIPT_COMMIT="samba-4.19.4"

ffbuild_enabled() {
    [[ $TARGET == linux* ]] || return 1
}

ffbuild_dockerbuild() {
    apt-get update
    apt-get install -y \
      python3 \
      python3-dev \
      pkg-config \
      libgnutls28-dev \
      libacl1-dev \
      libattr1-dev \
      libpopt-dev

    ./configure \
      --prefix="$FFBUILD_PREFIX" \
      --enable-fhs \
      --disable-python \
      --without-ad-dc

    make -j$(nproc)

    make install
}

ffbuild_configure() {
    echo "--enable-libsmbclient"
}
