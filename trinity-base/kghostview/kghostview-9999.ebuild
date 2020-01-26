# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_NAME="tdegraphics"

inherit trinity-meta-2

DESCRIPTION="A Trinity Viewer for PostScript (.ps, .eps) and PDF (.pdf) files"

DEPEND="x11-libs/libXft"
RDEPEND="${DEPEND}"
