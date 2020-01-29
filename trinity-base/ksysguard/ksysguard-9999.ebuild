# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="A network enabled task manager/system monitor"

IUSE="dell-laptop lm_sensors"

DEPEND="lm_sensors? ( sys-apps/lm-sensors )"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_I8K="$(usex dell-laptop)"
		-DWITH_SENSORS="$(usex lm_sensors)"
	)

	trinity-meta-2_src_configure
}
