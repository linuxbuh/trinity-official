# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity PIM identities library"

COMMON_DEPEND="~trinity-base/certmanager-${PV}
	~trinity-base/libtdepim-${PV}
	~trinity-base/libkmime-${PV}"
DEPEND+=" $COMMON_DEPEND"
RDEPEND+=" $COMMON_DEPEND"

TSM_EXTRACT_ALSO="libtdepim/ libemailfunctions/ libkmime/"
