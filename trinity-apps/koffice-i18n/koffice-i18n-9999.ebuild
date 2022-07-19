# Copyright 1999-2021 Gentoo Authors
# Copyright 2021 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_TYPE="applications/office"
TRINITY_BUILD_ADMIN="yes"

inherit trinity-base-2

DESCRIPTION="TDE internationalization package for Koffice [Trinity]"
HOMEPAGE="http://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="14"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~x86"
fi
IUSE=""

TRINITY_LANGS="bg ca cs cy da de el en_GB es et eu fa fi
		fr ga gl hu it ja km lv ms nb nds ne nl pl pt pt_BR
		ru sk sl sr sr@Latn sv tr uk zh_CN zh_TW"

for X in ${TRINITY_LANGS} ; do
	IUSE="${IUSE} l10n_${X}"
done

DEPEND="
	~trinity-base/tdelibs-${PV}
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
