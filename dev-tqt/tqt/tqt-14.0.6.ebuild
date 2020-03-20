# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic toolchain-funcs

SRCTYPE="free"
DESCRIPTION="Trinity's Qt toolkit fork."
HOMEPAGE="http://trinitydesktop.org/"

SRC_URI="http://www.mirrorservice.org/sites/trinitydesktop.org/trinity/releases/R${PV}/main/dependencies/tqt3-trinity-${PV}.tar.xz"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="3.5"
KEYWORDS="~amd64 ~x86"
IUSE="cups debug doc examples firebird ipv6 mysql nas nis opengl postgres sqlite xinerama"
# no odbc, immtqt or immtqt-bc support anymore.
# TODO: optional support for xrender and xrandr

RDEPEND="
	virtual/jpeg:=
	>=media-libs/freetype-2
	>=media-libs/libmng-1.0.9
	media-libs/libpng:=
	sys-libs/zlib
	x11-libs/libXft
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libSM
	cups? ( net-print/cups )
	firebird? ( dev-db/firebird )
	mysql? ( virtual/mysql )
	nas? ( >=media-libs/nas-1.5 )
	opengl? ( virtual/opengl virtual/glu )
	postgres? ( dev-db/postgresql:= )
	xinerama? ( x11-libs/libXinerama )
	!dev-qt/qt:3
	!dev-qt/qt-meta:3"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

TQTBASE="/usr/tqt3"

S="${WORKDIR}/tqt3-trinity-${PV}"

pkg_setup() {
	export QTDIR="${S}"

	CXX=$(tc-getCXX)
	if [[ ${CXX/g++/} != ${CXX} ]]; then
		PLATCXX="g++"
	elif [[ ${CXX/icpc/} != ${CXX} ]]; then
		PLATCXX="icc"
	else
		die "Unknown compiler ${CXX}."
	fi

	case ${CHOST} in
		*-freebsd*|*-dragonfly*)
			PLATNAME="freebsd" ;;
		*-openbsd*)
			PLATNAME="openbsd" ;;
		*-netbsd*)
			PLATNAME="netbsd" ;;
		*-darwin*)
			PLATNAME="darwin" ;;
		*-linux-*|*-linux)
			PLATNAME="linux" ;;
		*)
			die "Unknown CHOST, no platform chosen."
	esac

	if [[ "$CHOST" == *64* && "$PLATCXX" == "g++" ]]; then
		export PLATFORM="${PLATNAME}-${PLATCXX}-64"
	else
		export PLATFORM="${PLATNAME}-${PLATCXX}"
	fi
}

src_prepare() {
	# Apply user-provided patches
	eapply_user

	# Do not link with -rpath. See bug #75181.
	find "${S}"/mkspecs -name qmake.conf | xargs \
		sed -i -e 's:QMAKE_RPATH.*:QMAKE_RPATH =:'

	# set c/xxflags and ldflags
	strip-flags

	sed -i -e "s:QMAKE_CFLAGS_RELEASE.*=.*:QMAKE_CFLAGS_RELEASE=${CFLAGS}:" \
		   -e "s:QMAKE_CXXFLAGS_RELEASE.*=.*:QMAKE_CXXFLAGS_RELEASE=${CXXFLAGS}:" \
		   -e "s:QMAKE_LFLAGS_RELEASE.*=.*:QMAKE_LFLAGS_RELEASE=${LDFLAGS}:" \
		   -e "s:\<QMAKE_CC\>.*=.*:QMAKE_CC=$(tc-getCC):" \
		   -e "s:\<QMAKE_CXX\>.*=.*:QMAKE_CXX=$(tc-getCXX):" \
		   -e "s:\<QMAKE_LINK\>.*=.*:QMAKE_LINK=$(tc-getCXX):" \
		   -e "s:\<QMAKE_LINK_SHLIB\>.*=.*:QMAKE_LINK_SHLIB=$(tc-getCXX):" \
		   -e "s:\<QMAKE_STRIP\>.*=.*:QMAKE_STRIP=:" \
		"${S}/mkspecs/${PLATFORM}/qmake.conf" || die

	if [ $(get_libdir) != "lib" ] ; then
		sed -i -e "s:/lib$:/$(get_libdir):" \
			"${S}/mkspecs/${PLATFORM}/qmake.conf" || die
	fi

	sed -i -e "s:CXXFLAGS.*=:CXXFLAGS=${CXXFLAGS} :" \
		   -e "s:LFLAGS.*=:LFLAGS=${LDFLAGS} :" \
		"${S}/qmake/Makefile.unix" || die

	# remove docs from install if we don't need it
	use doc || sed -i -e '/INSTALLS.*=.*htmldocs/d' \
		"${S}/src/qt_install.pri"
}

src_configure() {
	export SYSCONF="${D}${TQTBASE}"/etc/settings

	# Let's just allow writing to these directories during Qt emerge
	# as it makes TQt much happier.
	addwrite "${TQTBASE}/etc/settings"
	addwrite "${HOME}/.qt"
	addwrite "${HOME}/.tqt"

	# common opts
	myconf=" -sm -thread -stl -no-verbose -largefile -tablet -no-exceptions"
	myconf+=" $(echo -{qt-imgfmt-,system-lib}{jpeg,mng,png})"
	myconf+=" -platform ${PLATFORM} -xplatform ${PLATFORM}"
	myconf+=" -xft -xrender -prefix ${TQTBASE}"
	myconf+=" -libdir ${TQTBASE}/$(get_libdir) -fast -no-sql-odbc"

	[ "$(get_libdir)" != "lib" ] && myconf+="${myconf} -L/usr/$(get_libdir)"

	use nas		&& myconf+=" -system-nas-sound"
	use nis		&& myconf+=" -nis" || myconf+=" -no-nis"
	use mysql	&& myconf+=" -plugin-sql-mysql -I/usr/include/mysql -L/usr/$(get_libdir)/mysql" || myconf+=" -no-sql-mysql"
	use postgres	&& myconf+=" -plugin-sql-psql -I/usr/include/postgresql/server -I/usr/include/postgresql/pgsql -I/usr/include/postgresql/pgsql/server" || myconf+=" -no-sql-psql"
	use firebird    && myconf+=" -plugin-sql-ibase -I/opt/firebird/include" || myconf+=" -no-sql-ibase"
	use sqlite	&& myconf+=" -plugin-sql-sqlite" || myconf+=" -no-sql-sqlite"
	use cups	&& myconf+=" -cups" || myconf+=" -no-cups"
	use opengl	&& myconf+=" -enable-module=opengl" || myconf+=" -disable-opengl"
	use debug	&& myconf+=" -debug" || myconf+=" -release -no-g++-exceptions"
	use xinerama    && myconf+=" -xinerama" || myconf+=" -no-xinerama"

	myconf+=" -system-zlib -qt-gif"

	use ipv6        && myconf+=" -ipv6" || myconf+=" -no-ipv6"

	myconf+=" -dlopen-opengl"

	export YACC='byacc -d'
	tc-export CC CXX
	export LINK="$(tc-getCXX)"

	einfo ./configure ${myconf}
	./configure ${myconf} || die
}

src_compile() {
	emake src-qmake src-moc sub-src

	export DYLD_LIBRARY_PATH="${S}/lib:/usr/X11R6/lib:${DYLD_LIBRARY_PATH}"
	export LD_LIBRARY_PATH="${S}/lib:${LD_LIBRARY_PATH}"

	emake sub-tools

	if use examples; then
		emake sub-tutorial sub-examples
	fi

	# Make the msg2qm utility (not made by default)
#	cd "${S}"/tools/msg2tqm
#	../../bin/tqmake || die
#	emake

	# Make the qembed utility (not made by default)
#	cd "${S}"/tools/qembed
#	../../bin/tqmake || die
#	emake

}

src_install() {
	emake INSTALL_ROOT="${D}" install
	# Next executables are missing to be installed:
	#	/usr/qt/3/bin/findtr
	#	/usr/qt/3/bin/conv2ui
	#	/usr/qt/3/bin/qt20fix
	#	/usr/qt/3/bin/qtrename140
	# I'm not sure if they are really needed

	# fix pkgconfig location
	dodir /usr/$(get_libdir)
	mv "${D}${TQTBASE}/$(get_libdir)/pkgconfig" "${D}/usr/$(get_libdir)/"

	# cleanup a bad symlink created by crappy install scrypt
	rm -r "${D}${TQTBASE}/mkspec/${PLATFORM}/${PLATFORM}"

	# List all the multilib libdirs
	local libdirs
	for alibdir in $(get_all_libdirs); do
		libdirs="${libdirs}:${TQTBASE}/${alibdir}"
	done

	# environment variables
	cat <<EOF > "${T}"/44tqt3
PATH=${TQTBASE}/bin
ROOTPATH=${TQTBASE}/bin
LDPATH=${libdirs:1}
MANPATH=${TQTBASE}/doc/man
EOF

	cat <<EOF > "${T}"/44-tqt3-revdep
SEARCH_DIRS="${TQTBASE}"
EOF

	insinto /etc/revdep-rebuild
	doins "${T}"/44-tqt3-revdep
	doenvd "${T}"/44tqt3

	if [ "${SYMLINK_LIB}" = "yes" ]; then
		dosym $(get_abi_LIBDIR ${DEFAULT_ABI}) ${TQTBASE}/lib
	fi

	keepdir ${TQTBASE}/etc/settings

	if use doc; then
		insinto ${TQTBASE}
		doins -r "${S}"/doc
	fi

	if use examples; then
		find "${S}"/examples "${S}"/tutorial -name Makefile | \
			xargs sed -i -e "s:${S}:${TQTBASE}:g"

		cp -r "${S}"/examples "${D}"${TQTBASE}/
		cp -r "${S}"/tutorial "${D}"${TQTBASE}/
	fi

	# misc build reqs

	sed -e "s:${S}:${TQTBASE}:g" \
		"${S}"/.qmake.cache > "${D}"${TQTBASE}/.qmake.cache

	dodoc FAQ README README-QT.TXT changes*
}

pkg_postinst() {
	echo
	elog "After a rebuild of TQt, it can happen that TQt plugins (such as TQt/TDE styles,"
	elog "or widgets for the TQt designer) are no longer recognized.  If this situation"
	elog "occurs you should recompile the packages providing these plugins,"
	elog "and you should also make sure that TQt and its plugins were compiled with the"
	elog "same version of GCC.  Packages that may need to be rebuilt are, for instance,"
	elog "tde-base/tdelibs, tde-base/tdeartwork and tde-base/tdeartwork-styles."
	echo
}
