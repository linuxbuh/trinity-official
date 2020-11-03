# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdegames"

inherit trinity-meta-2

DESCRIPTION="Base library common to many Trinity games"

src_prepare() {
	sed 's/${INCLUDE_INSTALL_DIR}/${INCLUDE_INSTALL_DIR}\/highscore/' -i ${S}/libtdegames/highscore/CMakeLists.txt
	trinity-meta-2_src_prepare
}
