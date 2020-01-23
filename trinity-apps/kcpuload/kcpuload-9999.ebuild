# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

inherit trinity-base-2

DESCRIPTION="A small CPU meter for Kicker"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity 14.1.0

SLOT="${TRINITY_VER}"