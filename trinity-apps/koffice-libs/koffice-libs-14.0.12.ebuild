# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="koffice"
TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"
TRINITY_SUBMODULE="lib lib/kwmf lib/store lib/kofficecore
		lib/kofficeui lib/kopainter
		lib/kopalette lib/kotext lib/kformula
		lib/koproperty lib/kross filters/olefilters
		filters/xsltfilter filters/generic_wrapper
		kounavail servicetypes mimetypes pics
		templates autocorrect interfaces plugins tools"
TSM_EXTRACT_ALSO="filters doc kchart"

inherit flag-o-matic trinity-meta-2

DESCRIPTION="Shared KOffice libraries for TDE [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE=""

DEPEND="
	~trinity-base/tdelibs-${PV}
"

RDEPEND="$DEPEND"

src_prepare() {
	trinity-meta-2_src_prepare
}

src_configure() {
	append-cxxflags "-std=c++11"
	export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${TDEDIR}/$(get_libdir)/pkgconfig
	myconf=(--with-extra-libs=${TDEDIR}/$(get_libdir)
		--with-extra-includes=${TDEDIR}/include/arts
		--disable-scripting)

	trinity-econf ${myconf[@]}
}
