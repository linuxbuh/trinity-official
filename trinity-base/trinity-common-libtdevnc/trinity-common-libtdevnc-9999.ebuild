# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit eutils

DESCRIPTION="Common libtdevnc modules for Trinity Desktop Environment "
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="GPL-2"
RESTRICT="nomirror"
MY_PN="libtdevnc"

if [[ ${PV} = 14.0.999 ]]; then
	inherit git-r3
        EGIT_REPO_URI="https://mirror.git.trinitydesktop.org/gitea/TDE/${MY_PN}"
        EGIT_BRANCH="r14.0.x"
elif [[ ${PV} = 9999 ]]; then
	inherit git-r3
        EGIT_REPO_URI="https://mirror.git.trinitydesktop.org/gitea/TDE/${MY_PN}"
else
	SRC_URI="https://mirror.git.trinitydesktop.org/cgit/${MY_PN}/snapshot/${MY_PN}-r${PV}.tar.gz"
fi

SLOT="0"

RDEPEND=""

if [[ ${PV} = 14.0.999 ]] || [[ ${PV} = 9999 ]]; then
	S="${WORKDIR}/${P}"
else
	S="${WORKDIR}/${MY_PN}-r${PV}"
fi

MODDIR="/usr/trinity/modules"

src_install() {
	dodir "${MODDIR}/${MY_PN}"
	cp -ax ${S}/* "${D}/${MODDIR}/${MY_PN}" || die

}
