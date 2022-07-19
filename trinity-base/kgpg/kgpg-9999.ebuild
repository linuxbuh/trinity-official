# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeutils"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Trinity gpg keyring manager"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

RDEPEND="app-crypt/gnupg
	|| (
		app-crypt/pinentry[ncurses]
		app-crypt/pinentry[qt5]
		app-crypt/pinentry[gtk]
		app-crypt/pinentry[tqt(-)]
	)"
