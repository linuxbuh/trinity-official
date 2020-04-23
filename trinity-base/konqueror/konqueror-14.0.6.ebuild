# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="Trinity: Web browser, file manager, ..."
KEYWORDS="~amd64 ~x86"

IUSE="java"
# FIXME: support branding USE flag

DEPEND="
	=trinity-base/libkonq-${PV}"

RDEPEND="${DEPEND}
	=trinity-base/kcontrol-${PV}
	=trinity-base/tdebase-tdeioslaves-${PV}
	=trinity-base/kfind-${PV}
	java? ( virtual/jre )"

TSM_EXTRACT_ALSO="kdesktop"
