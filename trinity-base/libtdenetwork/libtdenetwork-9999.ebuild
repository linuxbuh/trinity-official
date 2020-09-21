# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="library common to many tdepim apps interacting to network"

COMMON_DEPEND="app-crypt/gpgme"
DEPEND+=" ${COMMON_DEPEND}"
RDEPEND+=" ${COMMON_DEPEND}"

TSM_EXTRACT_ALSO="libtdepim/"
