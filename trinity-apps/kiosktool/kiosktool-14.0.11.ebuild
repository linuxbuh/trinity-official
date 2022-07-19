# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="bg br ca cs cy da de en_GB es et fr ga is
	it lt mt nl pt pt_BR ro ru sr sr@Latn sv ta tr"
TRINITY_MODULE_TYPE="applications/settings"
inherit trinity-base-2

DESCRIPTION="Tool to configure the TDE kiosk framework "
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="kcmautostart"

src_configure() {
	local mycmakeargs=(
		-DBUILD_KCM_AUTOSTART="$(usex kcmautostart)"
	)

	trinity-base-2_src_configure
}
