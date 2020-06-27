# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver
DESCRIPTION="tdemultimedia - merge this to pull in all tdemultimedia-derived packages"
KEYWORDS="~amd64 ~x86"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"
IUSE="arts"
#USE not currently in use: xine

RDEPEND="arts? ( ~trinity-base/juk-${PV}
		~trinity-base/kaboodle-${PV}
		~trinity-base/tdemultimedia-arts-${PV} )
	~trinity-base/kmix-${PV}
	~trinity-base/libkcddb-${PV}
	~trinity-base/tdemid-${PV}
	~trinity-base/tdemultimedia-kappfinder-data-${PV}
	~trinity-base/tdemultimedia-tdefile-plugins-${PV}"

#Needs kscd, which we don't yet have an ebuild for, to do anything useful
#	~trinity-base/tdemultimedia-tdeioslaves-${PV}

#.kcfgc -> .h problem
#	~trinity-base/kscd-${PV}

#"krec can not be built without building arts"
#		~trinity-base/krec-${PV}

#Needs equivalent of KMCOMPILEONLY
#		~trinity-base/kaudiocreator-${PV}

#These were in KDE3, but TDE has no ebuilds for them as of Jun 2020
#		~trinity-base/noatun-${PV} )
