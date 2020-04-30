# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

DESCRIPTION="A modular media player for TDE, featuring audio effects, graphic equalizer and network transparency"

RDEPEND="=trinity-base/tdemultimedia-arts-${PV}"
DEPEND="${RDEPEND}
	x11-libs/libXext"
