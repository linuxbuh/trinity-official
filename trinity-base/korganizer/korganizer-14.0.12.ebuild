# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TSM_EXTRACT_ALSO="certmanager/lib/
	libemailfunctions/
	libkcal/
	libkholidays/
	libkpimidentities/
	libtdepim/
	libkmime/
	kdgantt/
	kmail/
	translations/"
TRINITY_MODULE_NAME="tdepim"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="A Personal Organizer for Trinity"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="exchange"

DEPEND="
	~trinity-base/certmanager-${PV}
	~trinity-base/kaddressbook-${PV}
	~trinity-base/kgantt-${PV}
	~trinity-base/ktnef-${PV}
	~trinity-base/libkcal-${PV}
	~trinity-base/libkholidays-${PV}
	~trinity-base/libkmime-${PV}
	~trinity-base/libkpimidentities-${PV}
	~trinity-base/libtdenetwork-${PV}
	~trinity-base/libtdepim-${PV}
	exchange? ( ~trinity-base/libkpimexchange-${PV} )
"
#	~trinity-base/tdepim-tderesources-${PV}:${SLOT}
RDEPEND="${DEPEND}"

pkg_setup() {
	trinity-meta-2_pkg_setup
	use exchange && TSM_EXTRACT_ALSO+=" libkpimexchange/core/"
}

src_configure () {
	local mycmakeargs=(
		-DWITH_EXCHANGE="$(usex exchange)"
	)
	trinity-meta-2_src_configure
}
