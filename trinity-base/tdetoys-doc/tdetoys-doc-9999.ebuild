# Copyright 1999-2020 Gentoo Authors
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_NAME="tdetoys"

inherit trinity-meta-2

DESCRIPTION="Documentaion for tdetoys-derived packages"

RDEPEND="
	~trinity-base/khelpcenter-${PV}"

