# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdenetwork"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="librss"
inherit trinity-meta-2

DESCRIPTION="kicker plugin: rss news ticker"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="~trinity-base/librss-${PV}"
RDEPEND="${DEPEND}"
