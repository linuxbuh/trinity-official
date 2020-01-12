# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

TSM_EXTRACT="tdeioslave"

DESCRIPTION="Generic Trinity TDEIOslaves"
KEYWORDS="~amd64"
IUSE="samba ldap sasl openexr +tdehw"

DEPEND="x11-libs/libXcursor
	net-libs/rpcsvc-proto
	openexr? ( >=media-libs/openexr-1.2.2-r2 )
	samba? ( net-fs/samba )
	ldap? ( net-nds/openldap )
	sasl? ( dev-libs/cyrus-sasl )"

RDEPEND="${DEPEND}"
# CHECKME: optional dependencies
#DEPEND="
#	>=dev-libs/cyrus-sasl-2
#	x11-apps/xhost
RDEPEND="${DEPEND}
	virtual/ssh
	trinity-base/tdeeject:${SLOT}"

src_configure() {
	mycmakeargs=(
		-DWITH_XCURSOR=ON
		-DWITH_SAMBA="$(usex samba)"
		-DWITH_LDAP="$(usex ldap)"
		-DWITH_SASL="$(usex sasl)"
		-DWITH_OPENEXR="$(usex openexr)"
		-DWITH_TDEHWLIB="$(usex tdehw)"
	)

	trinity-meta-2_src_configure
}
