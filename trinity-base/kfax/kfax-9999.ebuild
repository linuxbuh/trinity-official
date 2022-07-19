# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdegraphics"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="kfax kfaxview"
TRINITY_HANDBOOK="optional"
TSM_EXTRACT_ALSO="kviewshell"
inherit trinity-meta-2

DESCRIPTION="Trinity G3/G4 fax viewer"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

DEPEND="~trinity-base/kviewshell-${PV}"
RDEPEND="${DEPEND}"

src_prepare(){
	sed -i "s/BUILD_KVIEWSHELL OR BUILD_KDVI OR BUILD_KFAX/BUILD_KVIEWSHELL/" "${S}/doc/man/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}
