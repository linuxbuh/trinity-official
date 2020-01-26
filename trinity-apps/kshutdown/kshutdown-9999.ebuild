# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="ar bg cs de es fr hu it nl
		pl pt_BR ru sk sv tr zh_CN"

TRINITY_DOC_LANGS="de"

inherit trinity-base-2

DESCRIPTION="A graphical shutdown utility for TDE"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity 14.1.0

SLOT="${TRINITY_VER}"

IUSE="extras"

RDEPEND="
	=trinity-base/tdesu-${PV}
	=trinity-base/kcontrol-${PV}
	=trinity-base/kdialog-${PV}"

src_configure() {
	mycmakeargs=(
		-DBUILD_EXTRAS="$(usex extras)"
	)

	trinity-base-2_src_configure
}