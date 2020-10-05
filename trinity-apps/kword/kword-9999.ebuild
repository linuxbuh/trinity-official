# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="=trinity-base/tdelibs-${PV}
	=trinity-apps/koffice-libs-${PV}
	=trinity-apps/kspread-${PV}
	app-text/wv2
	media-gfx/imagemagick
	app-text/libwpd
"

RDEPEND="$DEPEND"

KMCOPYLIB="libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store
	libkspreadcommon kspread"

TSM_EXTRACT_ALSO="lib kspread filters/liboofilter"
TRINITY_SUBMODULE="kword filters/kword"

need-trinity

CXXFLAGS+=" -std=c++11 -I/usr/include/libxml2"

src_unpack() {
	trinity-meta-2_src_unpack
	echo "SUBDIRS = liboofilter kword" > ${S}/filters/Makefile.am

	for i in $(find ${S}/lib -iname "*\.ui"); do
		uic-tqt ${i} > ${i%.ui}.h
	done
}

src_prepare() {
	local search_path="${TDEDIR}/${get_libdir}"
	local libname dirname dirlist x
	libname=""
	for x in $KMCOPYLIB; do
		if [ "${libname}" == "" ] ; then
			libname="${x}"
		else
			dirname=$x
			mkdir -p ${dirname}
			pushd ${dirname}
			if [ ! "$(find ${search_path} -maxdepth 1 -name ${libname}*) 2>/dev/null" == "" ]; then
				ln -s ${TDEDIR}/$(get_libdir)/${libname}* .
				if [[ ${dirname} =~ "lib/"* ]] ; then
					dirlist="${dirlist} ${dirname/lib\/}"
				fi
			fi
			popd
			libname=""
		fi
	done

	echo "SUBDIRS=$dirlist" > ${S}/lib/Makefile.am

	trinity-meta-2_src_prepare

	echo 'all:' > ${S}/Makefile.am
        echo 'install:' >> ${S}/Makefile.am
        echo '.PHONY: all' >> ${S}/Makefile.am
}

src_compile() {
	pushd ${S}/filters/liboofilter
		emake
	popd
	trinity-meta-2_src_compile
}
