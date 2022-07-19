# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
TRINITY_MODULE_NAME="tdewebdev"
TRINITY_MODULE_TYPE="core"

inherit trinity-meta-2

DESCRIPTION="Documentaion for tdewebdev-derived packages"
HOMEPAGE="https://trinitydesktop.org/"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi

RDEPEND="
	~trinity-base/khelpcenter-${PV}"

src_prepare() {
	echo 'tde_auto_add_subdirectories( )' >"${S}/doc/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}
