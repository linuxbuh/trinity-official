# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="5"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta

TSM_EXTRACT="tdeioslave"

DESCRIPTION="Generic Trinity TDEIOslaves"
KEYWORDS=
IUSE="samba ldap sasl openexr +tdehw"

DEPEND="x11-libs/libXcursor
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
		$(cmake-utils_use_with samba SAMBA)
		$(cmake-utils_use_with ldap LDAP)
		$(cmake-utils_use_with sasl SASL)
		$(cmake-utils_use_with openexr OPENEXR)
		$(cmake-utils_use_with tdehw TDEHWLIB)
	)

	trinity-meta_src_configure
}
