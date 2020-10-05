# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="KOffice spreadsheet application for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="=trinity-base/tdelibs-${PV}
	=trinity-apps/koffice-libs-${PV}
	=trinity-apps/kchart-${PV}
	=trinity-apps/kexi-${PV}
"

RDEPEND="$DEPEND"

KMCOPYLIB="
	libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store
	libkochart interfaces
	libkrossmain lib/kross/main
	libkrossapi lib/kross/api
	libkexidb kexi/kexidb
	libkexidbparser kexi/kexidb/parser"

TSM_EXTRACT_ALSO="lib interfaces filters/kexi kexi filters/liboofilter"
TRINITY_SUBMODULE="kspread filters/kspread"

need-trinity

CXXFLAGS+=" -std=c++11 "

src_unpack() {
	trinity-meta-2_src_unpack
	echo "SUBDIRS = liboofilter kspread" > ${S}/filters/Makefile.am
	echo "SUBDIRS = applixspread csv dbase gnumeric latex opencalc html qpro excel kexi" > ${S}/filters/kspread/Makefile.am
	for i in $(find "${S}"/lib -iname "*\.ui"); do
		uic-tqt ${i} > ${i%.ui}.h
	done
	echo "SUBDIRS = kexidb" > ${S}/kexi/Makefile.am
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
				if  [[ ${dirname} =~ "lib"* ]] && [[ ! ${dirname} =~ "lib/kross"* ]] ; then
					dirlist="${dirlist} ${dirname/lib\/}"
				fi
			fi
			popd
			libname=""
		fi
	done
	echo "SUBDIRS=$dirlist kross" > ${S}/lib/Makefile.am

	sed -i "${S}/kexi/migration/keximigratetest.cpp" \
       -e "/TDEApplication/ s|\");|\", true, true, true);|"

	trinity-meta-2_src_prepare

	echo 'all:' > ${S}/Makefile.am
        echo 'install:' >> ${S}/Makefile.am
        echo '.PHONY: all' >> ${S}/Makefile.am
}

src_compile() {
	sed 's|-std=c++11|-std=c++98|' -i ${S}/filters/kspread/qpro/libqpro/src/Makefile
	trinity-meta-2_src_compile
	pushd ${S}/filters/liboofilter
		emake
	popd
}
