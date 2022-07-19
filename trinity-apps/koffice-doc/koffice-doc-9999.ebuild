# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
TRINITY_MODULE_NAME="koffice"
TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"

inherit trinity-meta-2

DESCRIPTION="Documentaion for koffice-derived packages"
HOMEPAGE="https://trinitydesktop.org"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE=""

RDEPEND="
	~trinity-base/khelpcenter-${PV}"
