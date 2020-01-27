# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

TSM_EXTRACT="tdeioslave"

DESCRIPTION="Generic Trinity TDEIOslaves"
IUSE="samba ldap sasl openexr +hwlib"

DEPEND="x11-libs/libXcursor
	net-libs/rpcsvc-proto
	openexr? ( media-libs/openexr )
	samba? ( net-fs/samba )
	ldap? ( net-nds/openldap )
	sasl? ( dev-libs/cyrus-sasl )"

RDEPEND="${DEPEND}
	virtual/ssh
	=trinity-base/tdeeject-${PV}"

src_configure() {
	mycmakeargs=(
		-DWITH_XCURSOR=ON
		-DWITH_SAMBA="$(usex samba)"
		-DWITH_LDAP="$(usex ldap)"
		-DWITH_SASL="$(usex sasl)"
		-DWITH_OPENEXR="$(usex openexr)"
		-DWITH_TDEHWLIB="$(usex hwlib)"
	)

	trinity-meta-2_src_configure
}
