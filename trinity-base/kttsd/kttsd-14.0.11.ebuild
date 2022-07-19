# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_NAME="tdeaccessibility"
TRINITY_MODULE_TYPE="core"
TSM_EXTRACT_ALSO="kspeechsink translations"
inherit trinity-meta-2

DESCRIPTION="TDE text-to-speech subsystem"
if [[ ${PV} != *9999* ]] ; then
    KEYWORDS="~amd64 ~arm64 ~x86"
fi

IUSE="akode alsa arts epos festival flite +freetts kate"
REQUIRED_USE="!arts? ( akode )"

DEPEND=" akode? ( ~media-libs/akode-${PV} )
	alsa? ( media-libs/alsa-lib )
	~trinity-base/kcontrol-${PV}"
RDEPEND=" ${DEPEND}
	arts? ( trinity-base/arts )
	festival? ( app-accessibility/festival )
	epos? ( app-accessibility/epos )
	flite? ( app-accessibility/flite )
	freetts? ( app-accessibility/freetts )
	kate? ( trinity-base/kate )"

src_configure() {
	local mycmakeargs=(
		-DWITH_ARTS="$(usex arts)"
		-DWITH_AKODE="$(usex akode)"
		-DBUILD_KTTSD_FESTIVAL="$(usex festival)"
		-DBUILD_KTTSD_EPOS="$(usex epos)"
		-DBUILD_KTTSD_FLITE="$(usex flite)"
		-DBUILD_KTTSD_FREETTS="$(usex freetts)"
		-DBUILD_KTTSD_KATE="$(usex kate)"
		-DBUILD_KTTSD_COMMAND=ON
		-DBUILD_KTTSD_HADIFIX=ON
	)

	trinity-meta-2_src_configure
}
