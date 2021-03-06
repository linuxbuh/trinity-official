# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdepim"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libemailfunctions/ libtdepim/ libkmime/ ktnef/ translations/"
inherit trinity-meta-2

DESCRIPTION="Trinity kcal library for KOrganizer etc"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="
	dev-libs/libical
	~trinity-base/ktnef-${PV}
	~trinity-base/libkmime-${PV}"
RDEPEND="${DEPEND}"
