# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="tdeaddons metapackage - merge this to pull in all tdeaddons-derived packages"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	~trinity-base/atlantikdesigner-${PV}
	~trinity-base/kaddressbook-plugins-${PV}
	~trinity-base/kate-plugins-${PV}
	~trinity-base/kicker-applets-${PV}
	~trinity-base/knewsticker-scripts-${PV}
	~trinity-base/konq-plugins-${PV}
	~trinity-base/ksig-${PV}
	~trinity-base/renamedlg-plugins-${PV}
	~trinity-base/tdeaddons-doc-${PV}
	~trinity-base/tdeaddons-tdefile-plugins-${PV}
"

# trinity-base/noatun-plugins masked due to missing dependency: noatun
# But not long anymore.. :-)
