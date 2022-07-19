# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="tqscintilla"

inherit trinity-base-2

DESCRIPTION="TQt source code editing component based on Scintilla"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="LGPL-2.1"
SLOT="0"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

DEPEND="~dev-tqt/tqtinterface-${PV}"
RDEPEND="${DEPEND}"

TQBASE="/usr/tqt3"

src_prepare() {
	sed -i -e "s|include/tqt|include/tqt ${TQBASE}/include|" "${S}/qt/qscintilla.pro" || die
	eapply_user
}

src_configure() {
	echo 'QMAKE_CXXFLAGS += -std=c++98' >>"designer/designer.pro"
	echo 'QMAKE_LIBS += -L${S}/lib' >>"designer/designer.pro"
	pushd  qt || die
		tqmake "DESTDIR=${S}/lib" || die
	popd
	pushd  designer || die
                tqmake || die
	popd
}

src_compile() {
	emake -C qt
	emake -C designer
}

src_install() {
	emake install INSTALL_ROOT="${D}" -C qt install
	insinto "${TQBASE}/$(get_libdir)"
	insopts "-m 0755"
	doins  lib/*
	insinto "${TQBASE}/plugins/designer"
	doins designer/*.so
	insopts "-m 0644"
	insinto "${TQBASE}/include/private"
	doins include/*.h
	insinto "${TDEDIR}/share/doc/tde/HTML/en/tqscintilla"
	doins doc/html/*
}
