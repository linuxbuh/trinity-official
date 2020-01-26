# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"

TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="arts"

inherit trinity-base-2

set-trinityver

DESCRIPTION="aRts, the Trinity sound (and all-around multimedia) server/output manager"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

IUSE="alsa -artswrappersuid jack mp3 nas vorbis"
SLOT="$TRINITY_VER"

DEPEND="=dev-tqt/tqtinterface-${PV}
	dev-libs/glib
	media-libs/audiofile
	mp3? ( media-libs/libmad )
	nas? ( media-libs/nas )
	alsa? ( media-libs/alsa-lib )
	vorbis? ( media-libs/libogg media-libs/libvorbis )
	jack? ( media-sound/jack-audio-connection-kit )"
RDEPEND="${RDEPEND}"

src_configure() {
	mycmakeargs=(
		-DAUDIOFILE=ON
		-DWITH_MAD="$(usex mp3)"
		-DWITH_NAS="$(usex nas)"
		-DWITH_ALSA="$(usex alsa)"
		-DWITH_VORBIS="$(usex vorbis)"
		-DWITH_JACK="$(usex jack)"
		# NOTE: WITH_ESD dropped due to remove of esound long ago
	)

	trinity-base-2_src_configure
}

src_install() {
	trinity-base-2_src_install

	# used for realtime priority, but off by default as it is a security hazard
	use artswrappersuid && chmod u+s "${D}/${PREFIX}/bin/artswrapper"
}

pkg_postinst() {
	if ! use artswrappersuid ; then
		elog "Run chmod u+s ${PREFIX}/bin/artswrapper to let artsd use realtime priority"
		elog "and so avoid possible skips in sound. However, on untrusted systems this"
		elog "creates the possibility of a DoS attack that'll use 100% cpu at realtime"
		elog "priority, and so is off by default. See Gentoo bug #7883."
		elog "Or, you can set the local artswrappersuid USE flag to make the ebuild do this."
	fi
}
