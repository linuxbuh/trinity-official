# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeutils"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="kded module that supports some hardware input devices, such as special keys"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="asus-laptop dell-laptop lm-sensors powerbook-laptop thinkpad-laptop vaio-laptop"

DEPEND="powerbook-laptop? ( app-laptop/pbbuttonsd )"
RDEPEND="${DEPEND}
	lm-sensors? ( sys-apps/lm-sensors )"

src_configure() {
	local mycmakeargs=(
		-DWITH_ASUS="$(usex asus-laptop)"
		-DWITH_I8K="$(usex dell-laptop)"
		-DWITH_POWERBOOK2="$(usex powerbook-laptop)"
		-DWITH_THINKPAD="$(usex thinkpad-laptop)"
		-DWITH_VAIO="$(usex vaio-laptop)"
		-DWITH_SENSORS="$(usex lm-sensors)"
	)

	trinity-meta-2_src_configure
}
