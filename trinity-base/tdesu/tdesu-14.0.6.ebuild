# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="Trinity gui for su(1) or sudo"
IUSE="sudo"
KEYWORDS="~amd64"

DEPEND="sudo? ( app-admin/sudo )"
RDEPEND="${DEPEND}"

src_configure () {
	mycmakeargs=(
		-DWITH_SUDO_TDESU_BACKEND="$(usex sudo)"
	)

	trinity-meta-2_src_configure
}

pkg_postinst () {
	if use sudo; then
		einfo "Remember that the sudo use flag sets only the default superuser command."
		einfo "It can be overriden on a user-level by adding:"
		einfo "  [super-user-command]"
		einfo "    super-user-command=su"
		einfo "to the kdeglobal config file which is should be usually"
		einfo "located in the ~/.trinity/share/config/ directory."

	fi
}
