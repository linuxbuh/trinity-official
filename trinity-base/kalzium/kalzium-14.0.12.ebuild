# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeedu"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdeedu translations"
inherit trinity-meta-2

DESCRIPTION="Chemistry teaching tool for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

IUSE="ocaml"

DEPEND="~trinity-base/libtdeedu-${PV}
	ocaml? ( dev-lang/ocaml
		dev-ml/facile )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	sed -i -e 's/tdeeduplot-shared/tdeeduplot/' \
	-e 's/tdeeduui-shared/tdeeduui/' "${S}/kalzium/src/CMakeLists.txt" || die
	sed 's/nums//' -i "${S}/kalzium/src/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_OCAML_SOLVER="$(usex ocaml)"
	)

	trinity-meta-2_src_configure
}

