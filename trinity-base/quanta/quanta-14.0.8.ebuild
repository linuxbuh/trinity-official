# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdewebdev"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="web development environment for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

	SRC_URI+="
	http://download.sourceforge.net/quanta/html.tar.bz2
	http://download.sourceforge.net/quanta/css.tar.bz2
	http://download.sourceforge.net/quanta/javascript.tar.bz2
	http://download.sourceforge.net/quanta/php_manual_en_20030401.tar.bz2"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="
	=trinity-base/tdelibs-${PV}
	=trinity-base/tdefilereplace-${PV}
	=trinity-base/klinkstatus-${PV}
	=trinity-base/kommander-${PV}
	=trinity-base/cervisia-${PV}
	=trinity-base/kompare-${PV}
	dev-libs/libxslt
	dev-libs/libgcrypt
	dev-libs/libxml2
	app-text/htmltidy
"

RDEPEND="$DEPEND"

TRINITY_SUBMODULE="quanta lib"

need-trinity

CXXFLAGS+=" -std=c++11 "

src_unpack() {
	trinity-meta-2_src_unpack
	unpack php_manual_en_20030401.tar.bz2
	cd ${S}
	unpack css.tar.bz2
	unpack javascript.tar.bz2
	unpack html.tar.bz2
}

src_prepare() {
	source ${FILESDIR}/conv-func
	conv_f
	trinity-gen-configure
	eapply_user
}

src_install() {
	dodir ${TDEDIR}/share/apps/quanta/doc

	for i in css html javascript ; do
	pushd $i
	./install.sh <<EOF
${D}/${TDEDIR}/share/apps/quanta/doc
EOF
	popd
	rm -rf $i
	done
	cp -rf ${WORKDIR}/php ${WORKDIR}/php.docrc ${D}/${TDEDIR}/share/apps/quanta/doc

	trinity-meta-2_src_install
}
