# Copyright 2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdepim"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="TDE library for processing messages in MIME format"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
