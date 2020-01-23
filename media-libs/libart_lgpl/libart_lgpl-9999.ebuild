# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="libart-lgpl"

inherit trinity-base-2

DESCRIPTION="A LGPL version of libart maintained by TDE"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="LGPL-2.1"
SLOT="0"

src_configure() {
	cmake-utils_src_configure
}