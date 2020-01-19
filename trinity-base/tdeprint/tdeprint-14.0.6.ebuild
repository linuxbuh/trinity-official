# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="Trinity printer queue/device manager"
KEYWORDS="~amd64 ~x86"
IUSE="cups"

DEPEND="cups? ( net-print/cups )"
RDEPEND="${DEPEND}
	app-text/enscript
	app-text/psutils"
