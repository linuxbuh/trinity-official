# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
TRINITY_BUILD_ADMIN="yes"
TRINITY_SUBMODULE="kexi"
TSM_EXTRACT_ALSO="lib interfaces"

inherit flag-o-matic trinity-meta-2

DESCRIPTION="KOffice integrated environment for database management for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

SLOT="${TRINITY_VER}"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE="mysql postgres"

DEPEND="~trinity-base/tdelibs-${PV}
	~trinity-apps/koffice-libs-${PV}
	sys-libs/readline
	mysql? ( virtual/mysql )
	postgres? ( dev-libs/libpqxx )"

RDEPEND="$DEPEND"

KMCOPYLIB="
	libkformula lib/kformula
	libkofficecore lib/kofficecore
	libkofficeui lib/kofficeui
	libkopainter lib/kopainter
	libkoproperty lib/koproperty
	libkotext lib/kotext
	libkwmf lib/kwmf
	libkowmf lib/kwmf
	libkstore lib/store
	libkrossmain lib/kross/main/
	libkrossapi lib/kross/api/"

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
				if [[ ! ${dirname} =~ "kross"* ]]
				then
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

src_configure() {
	append-cxxflags "-std=c++11"
	local myconf=(
			$(use_enable mysql)
			$(use_enable postgres pgsql)
	)
	trinity-econf ${myconf[@]}
}
