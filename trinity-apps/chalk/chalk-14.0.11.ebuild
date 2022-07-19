# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"
TRINITY_SUBMODULE="chalk filters/chalk"
TSM_EXTRACT_ALSO="lib interfaces"

inherit trinity-meta-2

DESCRIPTION="KOffice image manipulation program for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""

DEPEND="~dev-tqt/tqt-${PV}[opengl]
	media-libs/lcms:0=
	media-libs/libexif
	media-libs/libpng
	media-libs/openexr
	media-libs/tiff
	~trinity-apps/koffice-libs-${PV}
	~trinity-base/tdelibs-${PV}
	virtual/jpeg
	virtual/imagemagick-tools[tiff]
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
	libkstore lib/store
	libkrossapi lib/kross/api
	libkrossmain lib/kross/main"

src_prepare() {
	# FIXME - disable broken tests for now
	sed -i -e "s:TESTSDIR =.*:TESTSDIR=:" "${S}"/chalk/core/Makefile.am \
		`ls "${S}"/chalk/colorspaces/*/Makefile.am`

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
	echo "SUBDIRS= chalk" >${S}/filters/Makefile.am

	trinity-meta-2_src_prepare

	echo 'all:' > ${S}/Makefile.am
	echo 'install:' >> ${S}/Makefile.am
	echo '.PHONY: all' >> ${S}/Makefile.am
}

src_configure() {
	append-cxxflags "-std=c++11"
	myconf=(--enable-scripting=no)
	trinity-econf ${myconf}
}

src_compile() {
	for i in $(find "${S}"/lib -iname "*\.ui"); do
		uic-tqt ${i} > ${i%.ui}.h
	done
	trinity-meta-2_src_compile
}
