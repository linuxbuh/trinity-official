# Copyright 1999-2020 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TRINITY_MODULE_TYPE="applications"

inherit trinity-base-2

set-trinityver

DESCRIPTION="TDE internationalization package for Koffice [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"
CHECK_ADMIN="yes"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
SLOT="${TRINITY_VER}"

need-trinity

TRINITY_LANGS="bg ca cs cy da de el en_GB es et eu fa fi
		fr ga gl hu it ja km lv ms nb nds ne nl pl pt pt_BR
		ru sk sl sr sr@Latn sv tr uk zh_CN zh_TW"

for X in ${TRINITY_LANGS} ; do
	IUSE="${IUSE} l10n_${X}"
done

DEPEND="
	>=trinity-base/tdelibs-${PV}
"
RDEPEND="$DEPEND"

run_phase() {
	local lang dir phase;
	phase=${1}
	lang=${2}

	dir="koffice-i18n-${lang}"
	pushd "${S}/${dir}" || die "No such dir: ${dir}"
	trinity-base-2_${phase}
	popd
}

src_prepare() {
	trinity_l10n_for_each_locale_do run_phase src_prepare
	eapply_user
}

src_configure() {
	trinity_l10n_for_each_locale_do run_phase src_configure
}

src_compile() {
	trinity_l10n_for_each_locale_do run_phase src_compile
}

src_install() {
	trinity_l10n_for_each_locale_do run_phase src_install
}
