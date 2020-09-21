# Copyright 1999-2016 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit trinity-functions-2

set-trinityver

DESCRIPTION="tdebase metapackage - merge this to pull in all tdebase-derived packages"
HOMEPAGE="http://www.trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

SLOT="${TRINITY_VER}"

RDEPEND="~trinity-base/tdeinit-${PV}
	~trinity-base/drkonqi-${PV}
	~trinity-base/kappfinder-${PV}
	~trinity-base/kate-${PV}
	~trinity-base/kcheckpass-${PV}
	~trinity-base/kcminit-${PV}
	~trinity-base/kcontrol-${PV}
	~trinity-base/kdcop-${PV}
	~trinity-base/tdedebugdialog-${PV}
	~trinity-base/tdepasswd-${PV}
	~trinity-base/tdeprint-${PV}
	~trinity-base/tdeeject-${PV}
	~trinity-base/kdesktop-${PV}
	~trinity-base/tdesu-${PV}
	~trinity-base/kdialog-${PV}
	~trinity-base/tdm-${PV}
	~trinity-base/kfind-${PV}
	~trinity-base/khelpcenter-${PV}
	~trinity-base/khotkeys-${PV}
	~trinity-base/kicker-${PV}
	~trinity-base/tdebase-tdeioslaves-${PV}
	~trinity-base/klipper-${PV}
	~trinity-base/kmenuedit-${PV}
	~trinity-base/konqueror-${PV}
	~trinity-base/konsole-${PV}
	~trinity-base/kpager-${PV}
	~trinity-base/kpersonalizer-${PV}
	~trinity-base/kreadconfig-${PV}
	~trinity-base/tdescreensaver-${PV}
	~trinity-base/ksmserver-${PV}
	~trinity-base/ksplashml-${PV}
	~trinity-base/kstart-${PV}
	~trinity-base/ksysguard-${PV}
	~trinity-base/ksystraycmd-${PV}
	~trinity-base/ktip-${PV}
	~trinity-base/twin-${PV}
	~trinity-base/kxkb-${PV}
	~trinity-base/libkonq-${PV}
	~trinity-base/nsplugins-${PV}
	~trinity-base/knetattach-${PV}
	~trinity-base/tdebase-data-${PV}
	~trinity-base/tdebase-starttde-${PV}
	~trinity-base/krootbacking-${PV}
	~trinity-base/tqt3integration-${PV}"
