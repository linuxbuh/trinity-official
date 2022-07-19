# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="koffice"
TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"
TRINITY_SUBMODULE="karbon filters/karbon"
TSM_EXTRACT_ALSO="lib filters/liboofilter interfaces"

inherit flag-o-matic trinity-meta-2

DESCRIPTION="KOffice vector drawing application for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE=""

DEPEND="~dev-tqt/tqt-${PV}[opengl]
	~trinity-apps/koffice-libs-${PV}
	virtual/imagemagick-tools
	media-libs/libart_lgpl
"

RDEPEND="$DEPEND"

KMCOPYLIB="
	libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkopalette lib/kopalette
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store"

src_unpack() {
	trinity-meta-2_src_unpack
	echo "SUBDIRS = liboofilter karbon" > ${S}/filters/Makefile.am
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
	trinity-meta-2_src_prepare
	echo 'all:' > ${S}/Makefile.am
	echo 'install:' >> ${S}/Makefile.am
	echo '.PHONY: all' >> ${S}/Makefile.am
}

src_configure() {
	append-cxxflags "-std=c++11"
	trinity-meta-2_src_configure
}

src_compile() {
	pushd filters/liboofilter
		emake
		cp .libs/liboofilter.a .
	popd
	trinity-meta-2_src_compile
}
