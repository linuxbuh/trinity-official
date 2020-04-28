# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeaccessibility"

inherit trinity-meta-2

need-arts optional

DESCRIPTION="TDE text-to-speech subsystem"

IUSE+=" akode alsa"

DEPEND+=" akode? ( =trinity-base/akode-${PV} )
	alsa? ( media-libs/alsa-lib )
	=trinity-base/kcontrol-${PV}"
RDEPEND+=" ${DEPEND}
	|| ( app-accessibility/festival
		app-accessibility/epos
		app-accessibility/flite
		app-accessibility/freetts )"

pkg_setup() {
	if ! use arts && ! use alsa && ! use akode; then
		ewarn "No audio backend chosen. Defaulting to trinity-base/arts."
	fi
	
	trinity-meta-2_pkg_setup
}

src_configure() {
	if ! use alsa && ! use akode; then
		need-arts yes
	else

	mycmakeargs=(
		-DWITH_ARTS="$(usex arts)"
		-DWITH_AKODE="$(usex akode)"
		-DWITH_GSTREAMER=OFF
	)

	trinity-meta-2_src_configure
}
