# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="Metapackage Trinity Software Development Kit (SDK)"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

KEYWORDS="~amd64 ~x86"

RDEPEND="
	=trinity-base/blinken-${PV}
	=trinity-base/kalzium-${PV}
	=trinity-base/kanagram-${PV}
	=trinity-base/kbruch-${PV}
	=trinity-base/keduca-${PV}
	=trinity-base/kgeography-${PV}
	=trinity-base/khangman-${PV}
	=trinity-base/kig-${PV}
	=trinity-base/kiten-${PV}
	=trinity-base/klatin-${PV}
	=trinity-base/klettres-${PV}
	=trinity-base/kmplot-${PV}
	=trinity-base/kpercentage-${PV}
	=trinity-base/kstars-${PV}
	=trinity-base/ktouch-${PV}
	=trinity-base/kturtle-${PV}
	=trinity-base/kverbos-${PV}
	=trinity-base/kvoctrain-${PV}
	=trinity-base/kwordquiz-${PV}
	=trinity-base/tdeedu-doc-${PV}"
