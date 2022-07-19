# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdepim"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libtdepim/"
inherit trinity-meta-2

DESCRIPTION="Library common to many tdepim apps interacting to network"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="app-crypt/gpgme"
RDEPEND="${DEPEND}"
