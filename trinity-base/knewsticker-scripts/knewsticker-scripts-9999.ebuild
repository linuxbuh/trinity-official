# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdeaddons"

inherit trinity-meta-2

DESCRIPTION="Kicker applet - RSS news ticker"

DEPEND="~trinity-base/knewsticker-${PV}"
RDEPEND="${DEPEND}"
