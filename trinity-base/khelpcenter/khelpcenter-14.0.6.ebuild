# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2
TRINITY_SUBMODULE="khelpcenter doc"

DESCRIPTION="The Trinity help center."
KEYWORDS="~amd64 ~x86"

RDEPEND="
	=trinity-base/tdebase-tdeioslaves-${PV}
	www-misc/htdig"
IUSE=""

