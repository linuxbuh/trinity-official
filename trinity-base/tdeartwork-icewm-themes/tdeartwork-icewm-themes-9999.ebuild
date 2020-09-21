# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeartwork"

inherit trinity-meta-2

DESCRIPTION="Themes for IceWM from the tdeartwork package."

RDEPEND="
	~trinity-base/tdeartwork-twin-styles-${PV}"

pkg_postinst() {
	elog "More IceWM themes are available installing x11-themes/icewm-themes"
}
