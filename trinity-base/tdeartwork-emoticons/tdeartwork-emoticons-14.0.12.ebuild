# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeartwork"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations"
inherit trinity-meta-2

DESCRIPTION="EmotIcons (icons for things like smilies :-) for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
