# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdenetwork"

inherit trinity-meta-2

DESCRIPTION="Trinity RSS server and client for DCOP"

DEPEND="=trinity-base/librss-${PV}"
RDEPEND="${DEPEND}"

TSM_EXTRACT_ALSO="librss/"
