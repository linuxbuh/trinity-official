# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"

inherit trinity-base-2

set-trinityver


DESCRIPTION="Gwenview is an image viewer for TDE"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"

TRINITY_LANGS="ca cs da de en_GB es_AR es fi fr gl it
		lt nl pl pt_BR pt ro ru sk sv tr zh_CN"


DEPEND="
	=trinity-base/tdelibs-${PV}
	dev-libs/libofx
	app-text/openjade
	app-text/opensp
	app-text/recode
"
RDEPEND="$DEPEND"

for X in ${TRINITY_LANGS} ; do
        IUSE="${IUSE} l10n_${X}"
done

need-trinity

TQTBASE="/usr/tqt3"

src_prepare() {
	pushd ${S}/po

	for x in ${TRINITY_LANGS}
	do
		if ! has ${x} ${L10N} ; then
			rm ${x}.po
		fi
	done
	popd
	trinity-base-2_src_prepare
}

src_configure() {
	myconf=(--disable-sqlite3
		--disable-pdf-docs
		--enable-ofxplugin
		--enable-ofxbanking
		--enable-qtdesigner)
	trinity-econf ${myconf[@]}
}
