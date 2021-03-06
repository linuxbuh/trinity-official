# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="af ar az be bg bn br ca cs cy da de el en_GB eo es
	et eu fa fi fr ga gl he hi hu id is it ja ka km ko ku lo lt mk
	ms nb nds ne nl nn pa pl pt pt_BR ro ru rw se sk sl sq sr sr@Latn
	ss sv ta tg th tr uk uz uz@cyrillic zh_CN zh_TW"

TRINITY_DOC_LANGS="da de es et fr it nl pl pt pt_BR ru sv"
TRINITY_MODULE_TYPE="applications/multimedia"
inherit trinity-base-2

DESCRIPTION="Advanced music player for TDE"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi

# Notes about the ebuild:
#
# - This version supports three engines: Xine, Yauap, and Akode.
#   The only ones supported at the moment are Xine and Akode.
#   Yauap isn't in Portage tree, but could be added later.
#
# - Rio Karma support needs nonexistent media-libs/libkarma
#
# - No Support for DAAP because it's not tested if that works with Mongrel2.
#
# - Otherwise the ebuild should offer all what can be done with CMake at the moment.

IUSE="akode amazon ifp inotify ipod konqsidebar mariadb mp4 mtp mysql njb
opengl postgres visualization +xine"

REQUIRED_USE="|| ( xine akode ) mysql? ( !mariadb )"

DEPEND="
	dev-db/sqlite
	dev-lang/ruby:*
	media-libs/taglib
	akode? ( ~media-libs/akode-${PV} )
	ifp? ( media-libs/libifp )
	ipod? ( media-libs/libgpod )
	mp4? ( media-libs/libmp4v2 )
	mtp? ( media-libs/libmtp )
	mysql? ( dev-db/mysql-connector-c )
	mariadb? ( dev-db/mariadb-connector-c )
	njb? ( media-libs/libnjb )
	opengl? ( virtual/opengl )
	postgres? ( dev-db/postgresql:= )
	visualization? (
		media-libs/libsdl
		media-plugins/libvisual-plugins
	)
	xine? ( media-libs/xine-lib )
"
RDEPEND="${DEPEND}"

src_prepare() {
	if use mysql ; then
		sed -i 's/mariadb_config mysql_config/mysql_config/' "${S}/ConfigureChecks.cmake"
	elif use mariadb ; then
		sed -i 's/mariadb_config mysql_config/mariadb_config/' "${S}/ConfigureChecks.cmake"
	fi
	trinity-base-2_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_SYSTEM_SQLITE=ON
		-DWITH_DAAP=OFF
		-DWITH_RIOKARMA=OFF
		-DWITH_YAUAP=OFF
		-DWITH_AKODE="$(usex akode)"
		-DWITH_AMAZON="$(usex amazon)"
		-DWITH_IFP="$(usex ifp)"
		-DWITH_INOTIFY="$(usex inotify)"
		-DWITH_IPOD="$(usex ipod)"
		-DWITH_KONQSIDEBAR="$(usex konqsidebar)"
		-DWITH_MP4V2="$(usex mp4)"
		-DWITH_MTP="$(usex mtp)"
		-DWITH_NJB="$(usex njb)"
		-DWITH_OPENGL="$(usex opengl)"
		-DWITH_POSTGRESQL="$(usex postgres)"
		-DWITH_LIBVISUAL="$(usex visualization)"
		-DWITH_XINE="$(usex xine)"
	)
	if use mysql ; then
		mycmakeargs+=( -DWITH_MYSQL=ON )
	elif use mariadb ; then
		mycmakeargs+=( -DWITH_MYSQL=ON )
	fi

	trinity-base-2_src_configure
}
