# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeedu"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdeedu translations"
inherit trinity-meta-2

DESCRIPTION="Touch typing tutor for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	sed -i 's/tdeeduplot-shared/tdeeduplot/' "${S}/${PN}/src/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}
