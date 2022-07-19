# Copyright 1999-2020 Gentoo Authors
# Copyright 2020-2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeartwork"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Extra sound themes for Trinity"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
