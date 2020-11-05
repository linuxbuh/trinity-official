# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="Trinity eject frontend"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND="=trinity-base/kdialog-${PV}"
RDEPEND="${DEPEND}
	virtual/eject"