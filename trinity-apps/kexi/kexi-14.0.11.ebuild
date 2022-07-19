# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="koffice"
TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"
TRINITY_SUBMODULE="kexi"
TSM_EXTRACT_ALSO="lib interfaces"

inherit flag-o-matic trinity-meta-2

DESCRIPTION="KOffice integrated environment for database management for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="mariadb mysql postgres"

REQUIRED_USE="mysql? ( !mariadb )"

DEPEND="~trinity-base/tdelibs-${PV}
	~trinity-apps/koffice-libs-${PV}
	sys-libs/readline
	mysql? ( dev-db/mysql-connector-c:= )
	mariadb? ( dev-db/mariadb-connector-c:= )
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

	if use mariadb ; then
		sed -i 's/-lmysqlclient/-lmariadb/' "${S}/kexi/migration/mysql/Makefile.am" || die
		sed -i 's/-lmysqlclient/-lmariadb/' "${S}/kexi/kexidb/drivers/mySQL/Makefile.am" || die
		sed -i 's/mysql_version.h/mariadb_version.h/' "${S}/kexi/migration/mysql/mysqlmigrate.cpp" || die
		sed -i 's/mysql_version.h/mariadb_version.h/' "${S}/kexi/kexidb/drivers/mySQL/mysqlconnection_p.h" || die
		sed -i 's/mysql_version.h/mariadb_version.h/' "${S}/kexi/kexidb/drivers/mySQL/mysqldriver.cpp" || die
		sed -i 's/mysql_config/mariadb_config/' "${S}/kexi/kexidb/drivers/configure.in.in" || die
	fi

	trinity-meta-2_src_prepare

	echo 'all:' > ${S}/Makefile.am
	echo 'install:' >> ${S}/Makefile.am
	echo '.PHONY: all' >> ${S}/Makefile.am
}

src_configure() {
	append-cxxflags "-std=c++11"
	local myconf=(
			$(use_enable postgres pgsql)
	)
	if use mysql ; then
		myconf+=' --enable-mysql '
	elif use mariadb ; then
		myconf+=' --enable-mysql '
	else
		myconf+=' --disable-mysql '
	fi
	trinity-econf ${myconf[@]}
}
