# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="de es et hu id nl sv tr"

inherit trinity-base-2

DESCRIPTION="A Kicker monitoring applet"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity 14.1.0

SLOT="${TRINITY_VER}"

# NVControl support needs the nvidia-settings package,
# which isn't in the portage tree anymore. So if there
# is interest, it could be imported to the overlay maybe.

src_configure() {
	mycmakeargs=(
		-DWITH_NVCONTROL=OFF
	)

	trinity-base-2_src_configure
}