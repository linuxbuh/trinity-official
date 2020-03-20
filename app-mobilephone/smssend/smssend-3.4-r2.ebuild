# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

DESCRIPTION="Universal SMS sender"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 sparc x86"

# Without SSL support in skyutils, some providers fail.
DEPEND="dev-libs/skyutils[ssl]"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-verizon.patch" )

src_prepare() {
	default

	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.in \
		|| die 'failed to rename AM_CONFIG_HEADER macro'

	eautoreconf
}
