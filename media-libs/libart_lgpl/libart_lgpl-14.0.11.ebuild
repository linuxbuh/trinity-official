# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="libart-lgpl"
inherit trinity-base-2 multilib-minimal

DESCRIPTION="LGPL version of libart maintained by TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="LGPL-2.1"
SLOT="0"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

src_prepare() {
	sed '/ART_SIZEOF_LONG/d' -i src/art_config.h.cmake || die
	cmake_src_prepare
}

multilib_src_configure() {
	cmake_src_configure
}

multilib_src_compile() {
	cmake_src_compile
}

multilib_src_install() {
	cmake_src_install
}
