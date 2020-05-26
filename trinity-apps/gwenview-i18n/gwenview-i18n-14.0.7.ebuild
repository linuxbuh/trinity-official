# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"
TRINITY_EXTRAGEAR_PACKAGING="yes"

inherit trinity-base-2

set-trinityver

DESCRIPTION="nternationalization support for Gwenview [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="${TRINITY_VER}"

need-trinity

TRINITY_LANGS="ar br cy el et fo he is ka ms nl pl ro sk sv th ve zh_CN
	az ca da en_GB fa fr hi it ko nb nso pt ru sr ta tr vi zh_TW
	bg cs de es fi gl hu ja lt nds pa pt_BR rw sr@Latn uk xh zu"

for X in ${TRINITY_LANGS} ; do
	IUSE="${IUSE} l10n_${X}"
done

DEPEND="
	>=trinity-base/tdelibs-${PV}
"
RDEPEND="$DEPEND"

TEG_PO_DIR=${S}

src_configure() {
	mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
	)
	trinity-base-2_src_configure
}
