# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="bg cs de es fr hu id it ja nl pl pt_BR ru sv"

inherit trinity-base-2 git-r3

DESCRIPTION="Minimize applications to the TDE system tray"
HOMEPAGE="http://trinitydesktop.org/"
unset SRC_URI
EGIT_REPO_URI="https://mirror.git.trinitydesktop.org/gitea/TDE/${PN}"
EGIT_BRANCH="r14.0.x"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"

S="${WORKDIR}/${P}"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}
