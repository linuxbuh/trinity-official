# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdegraphics"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="kfax kfaxview"
TSM_EXTRACT_ALSO="kviewshell"
inherit trinity-meta-2

DESCRIPTION="Trinity G3/G4 fax viewer"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="~trinity-base/kviewshell-${PV}"
RDEPEND="${DEPEND}"
