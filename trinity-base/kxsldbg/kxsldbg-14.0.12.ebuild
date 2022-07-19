# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdewebdev"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="translations"

inherit trinity-meta-2 flag-o-matic

DESCRIPTION="Graphical XSLT debugger for TDE [Trinity]"
HOMEPAGE="https://trinitydesktop.org/"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""

DEPEND="
	dev-libs/libxslt
	dev-libs/libxml2
"

RDEPEND="${DEPEND}"

src_configure() {
	append-cxxflags "-std=c++11"
	trinity-meta-2_src_configure
}
