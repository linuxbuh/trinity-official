# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeutils"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Trinity Archiving tool"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

pkg_postinst(){
	elog "You may want to install app-arch/lha, app-arch/p7zip, app-arch/rar,"
	elog "app-arch/zip or app-arch/zoo for support of these archive types."
}
