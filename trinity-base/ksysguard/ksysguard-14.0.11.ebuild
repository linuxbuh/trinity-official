# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdebase"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations/"
inherit trinity-meta-2

DESCRIPTION="A network enabled task manager/system monitor"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="dell-laptop lm-sensors"

DEPEND="lm-sensors? ( sys-apps/lm-sensors )"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_I8K="$(usex dell-laptop)"
		-DWITH_SENSORS="$(usex lm-sensors)"
	)

	trinity-meta-2_src_configure
}
