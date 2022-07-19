# Copyright 2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Jukebox and music manager for TDE"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="gstreamer musicbrainz taglib"

RDEPEND="media-libs/akode
	gstreamer? ( media-libs/gst-plugins-base )
	musicbrainz? ( media-libs/musicbrainz )
	taglib? ( media-libs/taglib )"
DEPEND="${RDEPEND}"

PDEPEND="gstreamer? ( media-plugins/gst-plugins-meta )"

src_configure() {
	local mycmakeargs=(
		-DWITH_GSTREAMER="$(usex gstreamer)"
		-DWITH_MUSICBRAINZ="$(usex musicbrainz)"
		-DWITH_TAGLIB="$(usex taglib)"
	)

	trinity-meta-2_src_configure
}
