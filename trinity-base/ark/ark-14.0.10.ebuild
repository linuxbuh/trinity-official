# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeutils"

inherit trinity-meta-2

DESCRIPTION="Trinity Archiving tool"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://www.mirrorservice.org/sites/trinitydesktop.org/trinity/releases/R${PV}/main/core/tdeutils-trinity-${PV}.tar.xz"

pkg_postinst(){
	elog "You may want to install app-arch/lha, app-arch/p7zip, app-arch/rar,"
	elog "app-arch/zip or app-arch/zoo for support of these archive types."
}
