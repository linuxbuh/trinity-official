# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Manage /usr/bin/pinentry symlink"
HOMEPAGE="https://www.gentoo.org/proj/en/eselect/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 ~riscv s390 ~sh sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

RDEPEND=">=app-eselect/eselect-lib-bin-symlink-0.1.1"

S="${FILESDIR}"

src_install() {
	default
	insinto /usr/share/eselect/modules
	newins pinentry.eselect-${PV} pinentry.eselect
}