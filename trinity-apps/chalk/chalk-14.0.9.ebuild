# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="KOffice image manipulation program for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="=dev-tqt/tqt-${PV}[opengl]
	=trinity-base/tdelibs-${PV}
	=trinity-apps/koffice-libs-${PV}
	media-libs/lcms:0=
	media-libs/openexr
	media-libs/tiff
	virtual/jpeg
	media-libs/libpng
	media-libs/libexif
"

RDEPEND="$DEPEND"

TSM_EXTRACT_ALSO="lib"
TRINITY_SUBMODULE="chalk filters/chalk"

need-trinity

CXXFLAGS+=" -std=c++11 "

KMCOPYLIB="libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkopalette lib/kopalette
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store
	libkrossapi lib/kross/api
	libkrossmain lib/kross/main"

src_unpack() {
	trinity-meta-2_src_unpack
	# FIXME - disable broken tests for now
        sed -i -e "s:TESTSDIR =.*:TESTSDIR=:" ${S}/chalk/core/Makefile.am \
                `ls ${S}/chalk/colorspaces/*/Makefile.am`
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
			fi
			if [[ ! ${dirname} =~ "kross"* ]]
			then
				dirlist="${dirlist} ${dirname/lib\/}"
			fi
			popd
			libname=""
		fi
	done
	echo "SUBDIRS=$dirlist kross" > ${S}/lib/Makefile.am
	echo "SUBDIRS= api main" > ${S}/lib/kross/Makefile.am
	echo "chalk" >${S}/filters/Makefile.am

	trinity-meta-2_src_prepare

	echo 'all:' > ${S}/Makefile.am
        echo 'install:' >> ${S}/Makefile.am
        echo '.PHONY: all' >> ${S}/Makefile.am
}

src_configure() {
	trinity-meta-2_src_configure
}

src_compile() {
	for i in $(find ${S}/lib -iname "*\.ui"); do
		uic-tqt ${i} > ${i%.ui}.h
	done
	trinity-meta-2_src_compile
}
