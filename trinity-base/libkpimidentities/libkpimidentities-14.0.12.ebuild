# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdepim"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdepim/ libemailfunctions/ libkmime/"
inherit trinity-meta-2

DESCRIPTION="Trinity PIM identities library"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="
	~trinity-base/certmanager-${PV}
	~trinity-base/libkmime-${PV}
	~trinity-base/libtdepim-${PV}
"
RDEPEND="${DEPEND}"
