# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="ar bg bn br ca cs da de el es et fi fr ga gl he
	hu it ja ka km lt mk nb nl nn pa pl pt pt_BR ru se sk sr
	sr@Latn sv tg tr uk uz zh_CN zh_TW"

inherit trinity-base-2

DESCRIPTION="Media player for TDE using Xine and GStreamer backends."
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"

IUSE+=" dvb dpms gstreamer vorbis encode xcb xinerama"

# As of April 2020 Kaffeine can be only build with xinerama support.
# If that is fixed, the build option will be optional again.

DEPEND+=" 
	x11-base/xorg-proto
	media-libs/xine-lib
	dev-libs/libcdio
	x11-libs/libXtst
	gstreamer? (
		media-libs/gstreamer
		media-libs/gst-plugins-base[X]
	)
	encode? ( media-sound/lame  )
	vorbis? ( media-libs/libvorbis )
	xcb? ( x11-libs/libxcb )
	xinerama? ( x11-libs/libXinerama )
	dvb? ( virtual/linuxtv-dvb-headers )"
RDEPEND+=" ${DEPEND}"

src_prepare() {
	trinity-gen-configure
	sed 's/x-mplayer2.desktop//' -i ${S}/kaffeine/mimetypes/application/Makefile.am
	eapply_user
}

src_configure() {
	myconf=($(use_with xinerama )
		$(use_with gstreamer )
		$(use_with encode )
		$(use_with dvb )
		$(use_with xcb )
		$(use_with dpms )
		)

	trinity-econf ${myconf[@]}
}

src_compile() {
	emake
}

src_install() {
	emake install DESTDIR=${D}
}
