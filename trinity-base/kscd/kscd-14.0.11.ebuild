# Copyright 1999-2021 Gentoo Foundation
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libkcddb/"

inherit trinity-meta-2

DESCRIPTION="Audio CD player for Trinity"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="x11-libs/libXext
	~trinity-base/libkcddb-${PV}"

src_configure() {
	mycmakeargs=(
		-DBUILD_LIBKCDDB=yes
	)

	trinity-meta-2_src_configure
}

src_install() {
	trinity-meta-2_src_install

	#Junk all the files that overlap with libkcddb.
	#It would be cleaner not to let them install at all, but I wasn't
	#able to pull that off.
	rm -r ${D}/usr/trinity/14/share/apps/tdeconf_update/
	rm -r ${D}/usr/trinity/14/share/config.kcfg/libkcddb.kcfg
	rm -r ${D}/usr/trinity/14/share/applications/tde/libkcddb.desktop
	rm -r ${D}/usr/trinity/14/include/
	rm -r ${D}/usr/trinity/14/lib64/
}
