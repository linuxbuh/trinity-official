# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="A simple password checker, used by any software in need of user authentication."
IUSE="pam"

RDEPEND="
	pam? ( sys-libs/pam )"
DEPEND="${RDEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_PAM="$(usex pam)"
	)

	trinity-meta-2_src_configure
}
