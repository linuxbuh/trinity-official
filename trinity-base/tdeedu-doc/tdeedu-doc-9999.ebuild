# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeedu"

inherit trinity-meta-2

DESCRIPTION="Documentaion for tdeedu-derived packages"
HOMEPAGE="http://trinitydesktop.org"
LICENSE="|| ( GPL-2 GPL-3 )"

RDEPEND="
	=trinity-base/khelpcenter-${PV}"

pkg_setup() {
	# Issue some warning if MAKEOPTS -j parameter is higher than 4
	local makeopts_j
	makeopts_j="$(echo "$MAKEOPTS" | sed -n 's/\(^\|.*\s\)\(-j\s*[0-9]\+\)\(\s.*\|$\)/\2/p')"
	if [ -n "$makeopts_j" -a "$makeopts_j" > 4 ]; then

		ewarn "This ebuild needs huge amoumt of memmory to compile in highly parallel"
		ewarn "mode so it can chew it all. Please change your MAKEOPTS if building fails."
	fi

	trinity-meta-2_pkg_setup
}

src_prepare() {
	sed -i -e '/add_subdirectory( applnk    )/d' \
	-e '/add_subdirectory( libtdeedu )/d' "${S}/CMakeLists.txt" || die
	sed '/add_subdirectory/d' -i doc/kig/CMakeLists.txt || die
	echo 'tde_auto_add_subdirectories( )' >doc/CMakeLists.txt || die
	trinity-meta-2_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DBUILD_ALL=OFF
		-DBUILD_DOC=ON
	)
	trinity-base-2_src_configure
}