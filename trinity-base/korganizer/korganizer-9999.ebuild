# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="A Personal Organizer for Trinity"

IUSE+=" exchange"

COMMON_DEPEND="
	=trinity-base/kgantt-${PV}
	=trinity-base/libtdepim-${PV}
	=trinity-base/libtdenetwork-${PV}
	=trinity-base/libkcal-${PV}
	=trinity-base/ktnef-${PV}
	=trinity-base/libkmime-${PV}
	=trinity-base/libkholidays-${PV}
	=trinity-base/certmanager-${PV}
	=trinity-base/libkpimidentities-${PV}
	=trinity-base/kaddressbook-${PV}
	exchange? ( =trinity-base/libkpimexchange-${PV} )"
#	>=trinity-base/tdepim-tderesources-${PV}:${SLOT}

DEPEND+=" ${COMMON_DEPEND}"
RDEPEND+=" ${COMMON_DEPEND}"

TSM_EXTRACT_ALSO="certmanager/lib/
	libemailfunctions/
	libkcal/
	libkholidays/
	libkpimidentities/
	libtdepim/
	libkmime/
	kdgantt/
	kmail/"

TSM_EXTRACT_ALSO+=" libkpimexchange/core/" # required for USE=exchange

src_configure () {
	mycmakeargs=(
		-DWITH_EXCHANGE="$(usex exchange)"
	)
	trinity-meta-2_src_configure
}
