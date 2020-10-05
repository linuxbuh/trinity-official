# Copyright 1999-20120 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
CHECK_ADMIN="yes"

inherit trinity-meta-2

set-trinityver

DESCRIPTION="KOffice integrated graph and chart drawing tool for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
SLOT="${TRINITY_VER}"
IUSE=""

DEPEND="=trinity-base/tdelibs-${PV}
	=trinity-apps/koffice-libs-${PV}
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
	libkochart interfaces"

TSM_EXTRACT_ALSO="lib interfaces filters/libdialogfilter"
TRINITY_SUBMODULE="kchart filters/kchart"

need-trinity

CXXFLAGS+=" -std=c++11 "

src_unpack() {
	trinity-meta-2_src_unpack
	echo "SUBDIRS = kchart" > ${S}/filters/Makefile.am
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
				if [[ ! ${dirname} =~ "interfaces" ]] ; then
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
	pushd filters/libdialogfilter
		emake
	popd
	trinity-meta-2_src_compile
}
