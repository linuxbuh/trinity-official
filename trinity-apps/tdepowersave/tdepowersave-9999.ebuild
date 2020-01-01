# Copyright 2019 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="5"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"
TRINITY_LANGS="ar bg cs da de en el es fi fr hi hu it ja km lt nb nl pa pl pt pt_BR ru sl_SI sv tr uk zh_CN zh_TW"
TRINITY_DOC_LANGS="cs de en fi hu nb"

inherit trinity-base

DESCRIPTION="A TDE frontend for power management"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="GPL-2 LGPL-2"

DEPEND="x11-libs/libXScrnSaver 
	x11-libs/libXext
	x11-libs/libXtst 
	>=dev-libs/dbus-tqt-${PV}
	>=dev-libs/dbus-1-tqt-${PV}"
RDEPEND="${DEPEND}"

need-trinity 14.0.0

SLOT="${TRINITY_VER}"

src_configure() {
	trinity-base_src_configure
}
