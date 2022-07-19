# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeedu"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdeedu translations"
inherit trinity-meta-2

DESCRIPTION="Desktop planetarium for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="usb v4l"

DEPEND="~trinity-base/libtdeedu-${PV}
	usb? ( virtual/libusb:1 )
	v4l? ( media-libs/libv4l )
	"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	sed -i -e 's/tdeeduplot-shared/tdeeduplot/g' \
	-e 's/tdeeduui-shared/tdeeduui/g' -e 's/extdate-shared/extdate/g' \
		"${S}/${PN}/${PN}/CMakeLists.txt" || die
	sed -i 's/tdeeduplot-shared/tdeeduplot/' "${S}/${PN}/${PN}/tools/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_LIBUSB=$(usex usb ON OFF )
		-DWITH_V4L=$(usex v4l ON OFF )
	)
	trinity-meta-2_src_configure
}
