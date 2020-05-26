# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

TRINITY_SUBMODULE="tdeioslave"

DESCRIPTION="PIM Trinity TDEIOslaves"
LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~x86"

IUSE="sasl sieve"

# The Sieve TDEIOslave won't build without SASL and 
# the IMAP4 TDEIOslave will lose the ability of SASL
# authentification. To fulfill any expectation of users,
# we offer two USE flags, which depend on each other.

REQUIRED_USE="
	sasl? ( sieve )
	sieve? ( sasl )
"

DEPEND="
	net-libs/libtirpc
	=trinity-base/libkmime-${PV}
	sasl? ( dev-libs/cyrus-sasl )"
RDEPEND="${DEPEND}"

TSM_EXTRACT_ALSO="tdeioslave libemailfunctions libtdepim libkmime"

CXXFLAGS+=" -I${TDEDIR}/include/libtdepim"

src_configure() {
	mycmakeargs=(
		-DWITH_SASL=$(usex sieve)
	)

	trinity-meta-2_src_configure
}
