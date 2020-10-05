# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="KOffice presentation program for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE="arts"

DEPEND="=trinity-base/tdelibs-${PV}
	=trinity-apps/koffice-libs-${PV}
"

RDEPEND="$DEPEND"

need-arts optional

KMCOPYLIB="
	libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store"

TSM_EXTRACT_ALSO="lib filters/liboofilter"
TRINITY_SUBMODULE="filters/libdialogfilter kpresenter filters/kpresenter"

need-trinity

CXXFLAGS+=" -std=c++11 "

src_unpack() {
	trinity-meta-2_src_unpack
	echo "SUBDIRS = liboofilter libdialogfilter kpresenter" > ${S}/filters/Makefile.am
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
				dirlist="${dirlist} ${dirname/lib\/}"
			fi
			popd
			libname=""
		fi
	done

	echo "SUBDIRS=$dirlist" > ${S}/lib/Makefile.am

	if ! use arts ; then
	   sed -i "s/-lsoundserver_idl -lmcop//" ${S}/kpresenter/Makefile.am
	fi

	trinity-meta-2_src_prepare

	echo 'all:' > ${S}/Makefile.am
        echo 'install:' >> ${S}/Makefile.am
        echo '.PHONY: all' >> ${S}/Makefile.am
}

src_compile() {
	trinity-meta-2_src_compile
	pushd ${S}/filters/liboofilter
		emake
	popd
}
