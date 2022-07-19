# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeedu"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations"
TRINITY_NEED_ARTS="optional"
inherit trinity-meta-2

DESCRIPTION="Fraction calculation teaching tool for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}
