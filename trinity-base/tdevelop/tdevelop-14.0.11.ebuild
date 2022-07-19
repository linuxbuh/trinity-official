# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_HANDBOOK="optional"

TRINITY_MODULE_TYPE="core"
inherit trinity-base-2

DESCRIPTION="The TDevelop Integrated Development Environment"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="dev-lang/perl
	net-dns/libidn
	virtual/acl"

RDEPEND="$DEPEND"

src_prepare() {
	pushd "${S}/parts/appwizard/common/" || die
	trinity-admin-prepare
	popd
	trinity-base-2_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_LANGUAGE_ALL=ON
		-DWITH_BUILDTOOL_ALL=ON
		-DBUILD_ALL=ON
	)

	trinity-base-2_src_configure
}
