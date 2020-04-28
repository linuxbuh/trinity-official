# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeaccessibility"

inherit trinity-meta-2

DESCRIPTION="TDE panel applet that displays the keyboard status"

DEPEND="=trinity-base/kcontrol-${PV}"
RDEPEND="${DEPEND}"
