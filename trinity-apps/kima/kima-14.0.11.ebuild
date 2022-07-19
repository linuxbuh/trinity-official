# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de es et hu id nl sv tr"
TRINITY_MODULE_TYPE="applications/settings"
inherit trinity-base-2

DESCRIPTION="A Kicker monitoring applet"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

# NVControl support needs the nvidia-settings package,
# which isn't in the Portage tree anymore. So if there
# is interest, it could be imported to the overlay maybe.

src_configure() {
	local mycmakeargs=(
		-DBUILD_TRANSLATIONS=ON
		-DWITH_NVCONTROL=OFF
	)

	trinity-base-2_src_configure
}
