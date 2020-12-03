# Copyright 2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdepim"
TSM_EXTRACT_ALSO="libtdepim/ libemailfunctions/ libkpgp/ libkmime/"
inherit trinity-meta-2

DESCRIPTION="A newsreader for TDE"

DEPEND="
	~trinity-base/ktnef-${PV}
	~trinity-base/libkcal-${PV}
	~trinity-base/libkmime-${PV}
	~trinity-base/libtdepim-${PV}
"
RDEPEND="${DEPEND}"
