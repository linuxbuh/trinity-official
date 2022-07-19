# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdesdk"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="scripts"

inherit trinity-meta-2

DESCRIPTION="Tdesdk Scripts - Some useful scripts for the development of applications"
HOMEPAGE="https://trinitydesktop.org/"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""
