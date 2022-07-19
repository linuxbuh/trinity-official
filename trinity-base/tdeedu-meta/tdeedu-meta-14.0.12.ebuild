# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Metapackage Trinity Software Educations"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="metapackage"
SLOT="14"

if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="~trinity-base/blinken-${PV}
	~trinity-base/kalzium-${PV}
	~trinity-base/kanagram-${PV}
	~trinity-base/kbruch-${PV}
	~trinity-base/keduca-${PV}
	~trinity-base/kgeography-${PV}
	~trinity-base/khangman-${PV}
	~trinity-base/kig-${PV}
	~trinity-base/kiten-${PV}
	~trinity-base/klatin-${PV}
	~trinity-base/klettres-${PV}
	~trinity-base/kmplot-${PV}
	~trinity-base/kpercentage-${PV}
	~trinity-base/kstars-${PV}
	~trinity-base/ktouch-${PV}
	~trinity-base/kturtle-${PV}
	~trinity-base/kverbos-${PV}
	~trinity-base/kvoctrain-${PV}
	~trinity-base/kwordquiz-${PV}
	~trinity-base/tdeedu-doc-${PV}
"
