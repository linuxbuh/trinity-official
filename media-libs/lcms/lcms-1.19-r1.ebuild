# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools eutils

DESCRIPTION="Lightweight, speed optimized color management engine"
HOMEPAGE="https://www.littlecms.com/"
SRC_URI="mirror://sourceforge/lcms/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 m68k ~mips ppc ppc64 s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="jpeg static-libs tiff zlib"

# Don't use Gentoo mirrors
RESTRICT="mirror"

RDEPEND="
	jpeg? ( virtual/jpeg:0 )
	tiff? ( media-libs/tiff:0 )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-disable_static_modules.patch"
	"${FILESDIR}/${P}-implicit.patch"
)

src_prepare() {

	default

	eautoreconf
}

src_configure() {
	econf \
		--libdir="${EPREFIX}"/usr/$(get_libdir) \
		--bindir="${EPREFIX}"/usr/bin \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		$(use_with jpeg) \
		$(use_with tiff) \
		$(use_with zlib)
}

src_install() {
	DOCS=(AUTHORS README* INSTALL NEWS doc/*)

	default

	insinto /usr/share/lcms/profiles
	doins testbed/*.icm

	find "${ED}" -name '*.la' -delete || die
}
