# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="A simple password checker, used by any software in need of user authentication."
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi
IUSE="pam"

RDEPEND="pam? ( trinity-base/tdebase-pam )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_SHADOW=ON
		-DWITH_PAM="$(usex pam)"
		-DKCHECKPASS_PAM_SERVICE=tde
	)

	trinity-meta-2_src_configure
}
