# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdeutils"

inherit trinity-meta-2

DESCRIPTION="Trinity system monitoring applets."

IUSE="snmp lm_sensors dell-laptop"

DEPEND="lm_sensors? ( x11-libs/libXext )
	snmp? ( net-analyzer/net-snmp )"
RDEPEND="${DEPEND}
	lm_sensors? ( sys-apps/lm-sensors )"

src_configure() {
	mycmakeargs=(
		-DWITH_I8K="$(usex dell-laptop)"
		-DWITH_SNMP="$(usex snmp)"
		-DWITH_SENSORS="$(usex lm_sensors)"
	)

	trinity-meta-2_src_configure
}
