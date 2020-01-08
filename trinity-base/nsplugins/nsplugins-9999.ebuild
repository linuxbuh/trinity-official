# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2

DESCRIPTION="Netscape plugins support for Konqueror."

DEPEND="x11-libs/libXt
	dev-libs/glib"
RDEPEND="${DEPEND}"
