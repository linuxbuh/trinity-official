# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdegraphics"

inherit trinity-meta-2

DESCRIPTION="A fast and versatile image viewer for Trinity"

DEPEND="x11-libs/libXext
	media-libs/imlib"
RDEPEND="${DEPEND}"
