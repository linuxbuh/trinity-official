# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeedu"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="Desktop planetarium for Trinity"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"
SLOT="${TRINITY_VER}"
IUSE="arts usb v4l"

DEPEND="=trinity-base/libtdeedu-${PV}
	arts? ( =trinity-base/arts-${PV} )
	usb? ( virtual/libusb:1 )
	v4l? ( media-libs/libv4l )
	"
RDEPEND="${DEPEND}"

need-arts optional

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	trinity-meta-2_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DWITH_LIBUSB=$(usex usb ON OFF )
		-DWITH_V4L=$(usex v4l ON OFF )
		-DBUILD_ALL=OFF
		-DBUILD_KSTARS=ON
	)
	trinity-meta-2_src_configure
}
