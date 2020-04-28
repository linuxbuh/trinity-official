# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeaccessibility"

inherit trinity-meta-2

DESCRIPTION="TDE text-to-speech frontend"

DEPEND="=trinity-base/kttsd-${PV}
	=trinity-base/tdemultimedia-arts-${PV}"
RDEPEND="${DEPEND}"
