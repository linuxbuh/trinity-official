# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="cs de es fr hu it ru sv"

inherit trinity-base-2

DESCRIPTION="Show mails on a POP3 server "
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"

DEPEND+=" =trinity-base/mimelib-${PV}"
RDEPEND+=" ${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)

	trinity-base-2_src_configure
}