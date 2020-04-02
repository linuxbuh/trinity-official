# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
TRINITY_MODULE_TYPE="applications"

TRINITY_EXTRAGEAR_PACKAGING="yes"
TRINITY_HANDBOOK="optional"

TRINITY_LANGS="ar bg br bs ca ca@valencia cs cy da de el en_GB eo
	es et fi fr ga gl hr hu is it ja ka km lt lv ms nb nds nl nn
	pa pl pt pt_BR ro ru rw sk sv ta tr ug uk zh_CN zh_TW"

inherit trinity-base-2

DESCRIPTION="TDEIO slave for gopher protocol"
HOMEPAGE="http://trinitydesktop.org/"
LICENSE="|| ( GPL-2 GPL-3 )"

need-trinity

SLOT="${TRINITY_VER}"
