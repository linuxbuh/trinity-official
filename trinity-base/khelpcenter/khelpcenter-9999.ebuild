# Copyright 1999-2017 Gentoo Foundatio
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdebase"

inherit trinity-meta-2
TRINITY_SUBMODULE="khelpcenter doc"

DESCRIPTION="The Trinity help center."

RDEPEND="
	~trinity-base/tdebase-tdeioslaves-${PV}
	|| ( www-misc/htdig www-misc/hldig )"

TSM_EXTRACT_ALSO="translations/"

