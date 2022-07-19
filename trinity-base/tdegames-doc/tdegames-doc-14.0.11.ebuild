# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdegames"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Documentaion for tdegames-derived packages"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-base/khelpcenter-${PV}"

src_prepare() {
	echo "tde_auto_add_subdirectories()" >"${S}/doc/CMakeLists.txt"
	trinity-meta-2_src_prepare
}
