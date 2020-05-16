# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdepim"

inherit trinity-meta-2

DESCRIPTION="Trinity kmime library for Message Handling"

TSM_EXTRACT_ALSO="libtdepim/"

src_install() {
	trinity-meta-2_src_install
	pushd ${S}/libkmime
	insinto ${TDEDIR}/include
	doins *.h
	popd
}
