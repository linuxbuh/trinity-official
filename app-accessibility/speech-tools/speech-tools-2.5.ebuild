# Copyright 1999-2017 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit flag-o-matic toolchain-funcs

# Don't use Gentoo mirrors
RESTRICT="mirror"

MY_P="${P/speech-/speech_}"
MY_P="${MY_P}.0"

DESCRIPTION="Speech tools for Festival Text to Speech engine"
HOMEPAGE="http://www.festvox.org"
SRC_URI="http://www.festvox.org/packed/festival/${PV}/${MY_P}-release.tar.gz"

LICENSE="FESTIVAL HPND BSD rc regexp-UofT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nas X"

RDEPEND="
	nas? ( media-libs/nas )
	X? ( x11-libs/libX11
		x11-libs/libXt )
	media-libs/alsa-lib
	sys-libs/ncurses:0=
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

S="${WORKDIR}/speech_tools"

src_prepare() {
	# Old patchset, unrolled.
	eapply	"${FILESDIR}/${P}-all-gcc42.patch"
	eapply	"${FILESDIR}/${P}-all-GentooLinux.patch"
	eapply	"${FILESDIR}/${P}-all-sharedlib.patch"
	eapply	"${FILESDIR}/${P}-all-gcc43-include.patch"
	eapply	"${FILESDIR}/${P}-all-remove-shared-refs.patch"
	eapply	"${FILESDIR}/${P}-all-base_class.patch"
	eapply	"${FILESDIR}/${P}-all-etcpath.patch"
	eapply	"${FILESDIR}/${P}-all-gentoo-config.patch"
	eapply	"${FILESDIR}/${P}-all-ldflags-fix.patch"
	eapply	"${FILESDIR}/${P}-all-mixed-cxxflag-cflag-fix.patch"
	eapply	"${FILESDIR}/${P}-all-ncurses-tinfo.patch"

	sed -i -e 's,{{HORRIBLELIBARCHKLUDGE}},"/usr/$(get_libdir)",' \
		main/siod_main.cc || die

	# WRT Gentoo bug #309983
	sed -i -e "s:\(GCC_SYSTEM_OPTIONS =\).*:\1:" \
		"${S}"/config/systems/sparc_SunOS5.mak || die

	# Fix underlinking, Gentoo bug #493204
	eapply	"${FILESDIR}/${PN}-2.1-underlinking.patch"

	eapply_user
}

src_configure() {
	local CONFIG=config/config.in
	sed -i -e 's/@COMPILERTYPE@/gcc42/' ${CONFIG} || die
	if use nas; then
		sed -i -e "s/#.*\(INCLUDE_MODULES += NAS_AUDIO\)/\1/" \
			${CONFIG} || die
	fi
	if ! use X; then
		sed -i -e "s/-lX11 -lXt//" config/modules/esd_audio.mak || die
	fi
	econf
}

src_compile() {
	emake -j1 CC="$(tc-getCC)" CXX="$(tc-getCXX)" CXX_OTHER_FLAGS="${CXXFLAGS}" CC_OTHER_FLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}"
}

src_install() {
	dolib.so lib/libest*.so*

	dodoc "${S}"/README.md
	dodoc "${S}"/lib/cstrutt.dtd

	insinto /usr/share/doc/${PF}
	doins -r lib/example_data

	insinto /usr/share/speech-tools
	doins -r config base_class

	insinto /usr/share/speech-tools/lib
	doins -r lib/siod

	cd include || die
	insinto /usr/include/speech-tools
	doins -r *
	dosym ../../include/speech-tools /usr/share/speech-tools/include

	cd ../bin || die
	for file in *; do
		[ "${file}" = "Makefile" ] && continue
		dobin ${file}
		dstfile="${D}/usr/bin/${file}"
		sed -i -e "s:${S}/testsuite/data:/usr/share/speech-tools/testsuite:g" \
			${dstfile} || die
		sed -i -e "s:${S}/bin:/usr/$(get_libdir)/speech-tools:g" \
			${dstfile} || die
		sed -i -e "s:${S}/main:/usr/$(get_libdir)/speech-tools:g" \
			${dstfile} || die

		# This just changes LD_LIBRARY_PATH
		sed -i -e "s:${S}/lib:/usr/$(get_libdir):g" ${dstfile} || die
	done

	cd "${S}" || die
	exeinto /usr/$(get_libdir)/speech-tools
	for file in `find main -perm /111 -type f`; do
		doexe ${file}
	done

	#Remove /usr/bin/resynth as it is broken. See Gentoo bug #253556
	rm "${D}/usr/bin/resynth" || die

	# Remove bcat (only useful for testing on windows, see Gentoo bug #418301).
	rm "${D}/usr/bin/bcat" || die
	rm "${D}/usr/$(get_libdir)/speech-tools/bcat" || die
}
