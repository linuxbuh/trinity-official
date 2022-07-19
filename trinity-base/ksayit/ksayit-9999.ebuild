# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeaccessibility"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="kspeechsink translations"
TRINITY_NEED_ARTS="yes"
inherit trinity-meta-2

DESCRIPTION="TDE text-to-speech frontend"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

DEPEND="~trinity-base/kttsd-${PV}"
RDEPEND="${DEPEND}"
