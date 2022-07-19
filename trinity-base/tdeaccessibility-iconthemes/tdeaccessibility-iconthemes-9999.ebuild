# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_NAME="tdeaccessibility"
TRINITY_MODULE_TYPE="core"
TRINITY_SUBMODULE="IconThemes"
TSM_EXTRACT_ALSO="translations"

inherit trinity-meta-2

DESCRIPTION="TDE accessibility icon themes"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~x86"
fi

src_configure() {
	local mycmakeargs=(
		-DWITH_ARTS=OFF
	)

	trinity-meta-2_src_configure
}
