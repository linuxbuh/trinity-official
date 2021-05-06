# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="KMail Import Filters"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
