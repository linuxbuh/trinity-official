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

REQUIRED_USE="|| ( arts akode alsa )"

src_configure() {

	mycmakeargs=(
		-DWITH_ARTS="$(usex arts)"
		-DWITH_AKODE="$(usex akode)"
		-DWITH_GSTREAMER=OFF
	)

	trinity-meta-2_src_configure
}
