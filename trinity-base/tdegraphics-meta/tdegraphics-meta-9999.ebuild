# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="tdegraphics metapackage - merge this to pull in all tdegraphics-derived packages"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

RDEPEND="
	=trinity-base/kamera-${PV}
	=trinity-base/kcoloredit-${PV}
	=trinity-base/kdvi-${PV}
	=trinity-base/kfax-${PV}
	=trinity-base/tdegraphics-tdefile-plugins-${PV}
	=trinity-base/tdegraphics-doc-${PV}
	=trinity-base/kgamma-${PV}
	=trinity-base/kghostview-${PV}
	=trinity-base/tdeiconedit-${PV}
	=trinity-base/kmrml-${PV}
	=trinity-base/kolourpaint-${PV}
	=trinity-base/kooka-${PV}
	=trinity-base/kpdf-${PV}
	=trinity-base/kpovmodeler-${PV}
	=trinity-base/kruler-${PV}
	=trinity-base/ksnapshot-${PV}
	=trinity-base/ksvg-${PV}
	=trinity-base/kuickshow-${PV}
	=trinity-base/kview-${PV}
	=trinity-base/kviewshell-${PV}
	=trinity-base/libkscan-${PV}"
