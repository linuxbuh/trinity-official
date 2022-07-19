# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="koffice"
TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"
TRINITY_SUBMODULE="filters/libdialogfilter kpresenter filters/kpresenter"
TSM_EXTRACT_ALSO="lib filters/liboofilter filters/generic_wrapper"

inherit flag-o-matic trinity-meta-2

DESCRIPTION="KOffice presentation program for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="arts"

DEPEND="~trinity-apps/koffice-libs-${PV}"

RDEPEND="$DEPEND"

KMCOPYLIB="
	libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store"

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
	echo "SUBDIRS = liboofilter libdialogfilter kpresenter" > ${S}/filters/Makefile.am

	if ! use arts ; then
	   sed -i "s/-lsoundserver_idl -lmcop//" "${S}/kpresenter/Makefile.am"
	fi

	for i in $(find "${S}"/lib -iname "*\.ui"); do
		uic-tqt ${i} > ${i%.ui}.h
	done

	trinity-meta-2_src_prepare

	echo 'all:' > "${S}"/Makefile.am
	echo 'install:' >> "${S}"/Makefile.am
	echo '.PHONY: all' >> "${S}"/Makefile.am
}

src_configure() {
	append-cxxflags "-std=c++11"
	trinity-meta-2_src_configure
}

src_compile() {
	trinity-meta-2_src_compile
	pushd "${S}/filters/liboofilter"
		emake
	popd
}
