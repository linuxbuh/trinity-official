# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="kdesktop translations/"
inherit trinity-meta-2

DESCRIPTION="Trinity: Web browser, file manager, ..."
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="java"
# FIXME: support branding USE flag

DEPEND="
	~trinity-base/libkonq-${PV}
"
RDEPEND="${DEPEND}
	~trinity-base/kcontrol-${PV}
	~trinity-base/kfind-${PV}
	~trinity-base/tdebase-tdeioslaves-${PV}
	java? ( virtual/jre )
"