# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdegraphics"
TRINITY_MODULE_TYPE="core"
TRINITY_HANDBOOK="optional"
TSM_EXTRACT_ALSO="libkscan"
inherit trinity-meta-2

DESCRIPTION="Kooka is a Trinity application which provides access to scanner hardware"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

DEPEND="
	media-libs/tiff:=
	~trinity-base/libkscan-${PV}
"
RDEPEND="${DEPEND}"
