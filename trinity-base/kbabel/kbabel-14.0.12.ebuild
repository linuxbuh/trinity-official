# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdesdk"
TRINITY_MODULE_TYPE="core"

inherit trinity-meta-2

DESCRIPTION="PO-file editing suite for Trinity"
HOMEPAGE="https://trinitydesktop.org/"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="berkdb"

DEPEND+="
	berkdb? ( sys-libs/db:5.3 )
"

RDEPEND="${DEPEND}"

src_prepare() {
	trinity-meta-2_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_DBSEARCHENGINE=$(usex berkdb ON OFF)
	)
	trinity-meta-2_src_configure
}
