# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeadmin"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations"
inherit trinity-meta-2

DESCRIPTION="The Trinity crontab editor"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
