# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdepim"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="libemailfunctions/
	pixmaps/
	libkmime/kmime_util.h
	libkcal/
	translations/"
inherit trinity-meta-2

DESCRIPTION="Common library for Trinity PIM applications"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="
	~trinity-base/ktnef-${PV}
	~trinity-base/libkcal-${PV}
	~trinity-base/libkmime-${PV}
"
RDEPEND="${DEPEND}"

src_prepare() {
	trinity-meta-2_src_prepare
	# Call TQt designer
	sed -e "s:\"designer\":\"${TQTDIR}/bin/designer\":g" \
		-i "libtdepim/kcmdesignerfields.cpp" || die
}
