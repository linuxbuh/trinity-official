# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_TYPE="common"
TRINITY_MODULE_NAME="cmake"
inherit trinity-base-2

DESCRIPTION="Common cmake modules for Trinity Desktop Environment"
HOMEPAGE="https://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
