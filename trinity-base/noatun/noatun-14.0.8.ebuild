# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdemultimedia"

inherit trinity-meta-2

DESCRIPTION="A modular media player for KDE, featuring audio effects, graphic equalizer and network transparency."
KEYWORDS="~amd64 ~x86"
HOMEPAGE="http://www.trinitydesktop.org/"

RDEPEND="~trinity-base/tdemultimedia-arts-${PV}"
DEPEND="${RDEPEND}
	x11-libs/libXext"

TSM_EXTRACT_ALSO="arts mpeglib"

src_configure() {
	mycmakeargs=(
		-DBUILD_ARTS=ON
		-DBUILD_MPEGLIB=ON
	)

	trinity-meta-2_src_configure
}

src_install() {
	trinity-meta-2_src_install

	#Junk all the files that overlap with tdemultimedia-arts.
	#It would be cleaner not to let them install at all, but I wasn't
	#able to pull that off.
	rm -r ${D}/usr/trinity/14/share/apps/artscontrol/
	rm -r ${D}/usr/trinity/14/share/apps/artsbuilder/
	rm -r ${D}/usr/trinity/14/include/arts/
	rm -r ${D}/usr/trinity/14/include/mpeglib/
	rm -r ${D}/usr/trinity/14/lib64/libarts*
	rm -r ${D}/usr/trinity/14/lib64/mcop/arts*
	rm -r ${D}/usr/trinity/14/lib64/mcop/Arts/
	rm -r ${D}/usr/trinity/14/lib64/libmpeg*
	rm -r ${D}/usr/trinity/14/lib64/libyaf*
	rm -r ${D}/usr/trinity/14/share/icons/*/*/apps/artscontrol.png
	rm -r ${D}/usr/trinity/14/share/icons/*/*/apps/artsbuilder.png
	rm -r ${D}/usr/trinity/14/share/icons/hicolor/scalable/
	rm -r ${D}/usr/trinity/14/share/icons/crystalsvg/*/actions/arts*
	rm -r ${D}/usr/trinity/14/share/applications/tde/artscontrol.desktop
	rm -r ${D}/usr/trinity/14/share/applications/tde/artsbuilder.desktop
	rm -r ${D}/usr/trinity/14/bin/artscontrol
	rm -r ${D}/usr/trinity/14/bin/artsbuilder
	rm -r ${D}/usr/trinity/14/bin/yaf*
	rm -r ${D}/usr/trinity/14/bin/midisend
	rm -r ${D}/usr/trinity/14/share/mimelnk/application/x-artsbuilder.desktop
	rm -r ${D}/usr/trinity/14/share/apps/kicker/
}


#KMCOMPILEONLY="arts"

#src_compile() {
#	# fix bug 128884
#	filter-flags -fomit-frame-pointer
#	kde-meta_src_compile
#} 
