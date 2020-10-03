# Copyright 1999-20120 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="KOffice image manipulation program for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
	media-libs/lcms:0=
	media-libs/openexr
	media-libs/tiff
	virtual/jpeg
	media-libs/libpng
	media-libs/libexif
	=dev-tqt/tqt-${PV}[opengl]
"

RDEPEND="$DEPEND"

TSM_EXTRACT_ALSO="lib filters"
TRINITY_SUBMODULE="chalk filters/chalk"

need-trinity

CXXFLAGS+=" -std=c++11 "

src_prepare() {
	trinity-meta-2_src_prepare
}
