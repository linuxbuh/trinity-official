# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeadmin"
TRINITY_MODULE_TYPE="core"
inherit trinity-meta-2

DESCRIPTION="Documentaion for tdeadmin-derived packages"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-base/khelpcenter-${PV}"

src_prepare() {
	# Removing unused packages
	sed -i -e '/lilo-config/d' -e '/ksysv/d' -e '/kpackage/d' \
	-e '/kdat/d' "${S}/doc/CMakeLists.txt" || die

	trinity-meta-2_src_prepare
}
