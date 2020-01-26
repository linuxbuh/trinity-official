# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de el es et fr hu it
		ja nl pl pt pt_BR ru sv tr"

inherit trinity-base-2

DESCRIPTION="A Quake-style terminal emulator for TDE"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity 14.1.0

SLOT="${TRINITY_VER}"

DEPEND="=trinity-base/konsole-${PV}"
RDEPEND="${DEPEND}"