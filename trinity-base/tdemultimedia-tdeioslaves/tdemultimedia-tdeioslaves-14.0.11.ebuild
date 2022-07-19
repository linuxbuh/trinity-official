# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdemultimedia"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="kscd libkcddb tdeioslave"
TSM_EXTRACT="kscd libkcddb tdeioslave"
inherit trinity-meta-2

DESCRIPTION="Multimedia Trinity TDEIOslaves"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="flac"

DEPEND="~trinity-base/libkcddb-${PV}
	media-sound/cdparanoia
	flac? ( media-libs/flac )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_FLAC=$(usex flac)
		-DWITH_CDPARANOIA=ON
	)

	trinity-meta-2_src_configure
}

src_install() {
	trinity-meta-2_src_install
	rm -r "${D}"/usr/trinity/14/share/apps/tdeconf_update/kcmcddb-emailsettings.upd
	rm -r "${D}"/usr/trinity/14/share/config.kcfg/libkcddb.kcfg
	rm -r "${D}"/usr/trinity/14/share/applications/tde/libkcddb.desktop
	rm -r "${D}"/usr/trinity/14/include/libkcddb
	rm -r "${D}"/usr/trinity/14/lib64/libkcddb*
	rm -r "${D}"/usr/trinity/14/lib64/trinity/kcm_cddb*
	rm -r "${D}"/usr/share/doc/tdemultimedia-tdeioslaves-${PV}/kscd*
	rm -r "${D}"/usr/trinity/14/bin
	rm -r "${D}"/usr/trinity/14/share/icons/hicolor/*/apps/kscd.png
	rm -r "${D}"/usr/trinity/14/share/config.kcfg/kscd.kcfg
	rm -r "${D}"/usr/trinity/14/share/mimelnk/text/xmcd.desktop
	rm -r "${D}"/usr/trinity/14/share/applications/tde/kscd.desktop
	rm -r "${D}"/usr/trinity/14/share/apps/konqueror/servicemenus/audiocd_play.desktop
	rm -r "${D}"/usr/trinity/14/share/apps/profiles/kscd.profile.xml
	rm -r "${D}"/usr/trinity/14/share/apps/kscd/icons/crystalsvg/22x22/actions/cdsmall.png
}
