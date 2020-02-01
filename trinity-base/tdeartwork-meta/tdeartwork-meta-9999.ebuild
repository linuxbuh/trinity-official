# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="tdeartwork meta package - merge this to pull in all tdeartwork-derived packages"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

RDEPEND="
	=trinity-base/tdeartwork-emoticons-${PV}
	=trinity-base/tdeartwork-icon-themes-${PV}
	=trinity-base/tdeartwork-icewm-themes-${PV}
	=trinity-base/tdeartwork-tdescreensaver-${PV}
	=trinity-base/tdeartwork-twin-styles-${PV}
	=trinity-base/tdeartwork-kworldclock-${PV}
	=trinity-base/tdeartwork-sounds-${PV}
	=trinity-base/tdeartwork-styles-${PV}
	=trinity-base/tdeartwork-wallpapers-${PV}"
