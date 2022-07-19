# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeedu"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Documentaion for tdeedu-derived packages"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-base/khelpcenter-${PV}
	app-doc/doxygen"

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	echo 'tde_auto_add_subdirectories( )' >"${S}/doc/CMakeLists.txt" || die

	# Fixing the build error of the scripting-api submodule
	sed -i 's/BUILD_DOC AND BUILD_KIG/BUILD_DOC/' "${S}/ConfigureChecks.cmake" || die

	trinity-meta-2_src_prepare
}
