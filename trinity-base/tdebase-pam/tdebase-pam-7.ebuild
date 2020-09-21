# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

inherit pam

DESCRIPTION="pam.d files used by several Trinity components"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 hppa ~ia64 ~mips ppc ppc64 sparc x86"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}"

src_install() {
	newpamd "${FILESDIR}/tde.pam-${PV}" tde
	newpamd "${FILESDIR}/tde-np.pam-6" tde-np
}
