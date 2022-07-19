# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="arts mpeglib"
inherit trinity-meta-2

DESCRIPTION="Media player featuring audio effects, graphic equalizer and network transparency"
HOMEPAGE="https://trinitydesktop.org/"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="~trinity-base/tdemultimedia-arts-${PV}[mpeg]"
DEPEND="${RDEPEND}
	x11-libs/libXext
"

src_prepare() {
	sed -i 's/mpeg-shared/mpeg/' "${S}/${PN}/CMakeLists.txt" || die
	sed -i 's/mpeg-shared/mpeg Xext/' "${S}/${PN}/library/noatunarts/CMakeLists.txt"
	trinity-meta-2_src_prepare
}

#KMCOMPILEONLY="arts"

#src_compile() {
#	# fix bug 128884
#	filter-flags -fomit-frame-pointer
#	kde-meta_src_compile
#}
