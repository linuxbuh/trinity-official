# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity personal information manager"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="=trinity-base/libtdepim-${PV}
	=trinity-base/libkpimidentities-${PV}
	=trinity-base/libkholidays-${PV}
	=trinity-base/knotes-${PV}
	=trinity-base/korganizer-${PV}"

DEPEND+=" $COMMON_DEPEND"
RDEPEND+=" $COMMON_DEPEND"

need-trinity

SLOT="${TRINITY_VER}"

TSM_EXTRACT_ALSO="libtdepim/ libtdenetwork/ plugins/ korganizer/ kaddressbook/ \
	kmail/ knotes/ knode/ akregator/ karm/ libemailfunctions/ libkpimidentities/"

src_prepare() {
	sed -i '/kmail/d' kontact/plugins/CMakeLists.txt || die
	sed -i '/specialdates/d' kontact/plugins/CMakeLists.txt || die
	trinity-meta-2_src_prepare
}
