# Copyright 1999-2013 Gentoo Foundation
# Copyright 2020 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: fat-zer
# Ported to git-r3 eclass and EAPI7 by E. Liddell
# Purpose: support ebuilds for the trinity project (a kde3 fork).
#

inherit trinity-functions-2 cmake-utils

addwrite "/usr/tqt3/etc/settings"
addpredict "/usr/tqt3/etc/settings"

# ban EAPI 0-6
case $EAPI in
	0|1|2|3|4|5|6) die "EAPI=${EAPI} is not supported" ;;
	7) ;;
	*) die "Unknown EAPI=${EAPI}"
esac

# @ECLASS-VARIABLE: BUILD_TYPE
# @DESCRIPTION:
# Determines the build type: live or release
if [[ ${PV} = *9999* ]]; then
	BUILD_TYPE="live"
else
	BUILD_TYPE="release"
fi
export BUILD_TYPE

# @ECLASS-VARIABLE: TRINITY_MODULE_NAME
# @DESCRIPTION:
# The name of trinity module; It's used for multiple purposes. First of all it
# determines the tarball name (git repository for live packages)
echo "${TRINITY_MODULE_NAME:=${PN}}" >/dev/null

# @ECLASS-VARIABLE: TRINITY_SCM
# @DESCRIPTION:
# Determines which version control system code is checking out live ebuilds from.

# @ECLASS-VARIABLE: TMP_DOCDIR
# @DESCRIPTION: 
# A temporary directory used to copy common documentation before installing it
# 
# @ECLASS-VARIABLE: TRINTY_BASE_NO_INSTALL_DOC
# @DESCRIPTION: 
# if set to anything except "no" this variable prevents
# trinity-base_src_install() from installing documentation
# 

# @ECLASS-VARIABLE: TRINTY_LANGS
# @DESCRIPTION: 
# This is a whitespace-separated list of translations this ebuild supports.
# These translations are automatically added to IUSE. Therefore ebuilds must set
# this variable before inheriting any eclasses. To enable only selected
# translations, ebuilds must call enable_selected_linguas().

# @ECLASS-VARIABLE: TRINTY_DOC_LANGS
# @DESCRIPTION: 
# This is a whitespace-separated list of translations this ebuild supports.
# These translations are automatically added to IUSE. Therefore ebuilds must set
# this variable before inheriting any eclasses. To enable only selected
# translations, ebuilds must call enable_selected_linguas().

# @ECLASS-VARIABLE: TRINITY_HANDBOOK
# @DESCRIPTION:
# Set to enable handbook in application. Possible values are 'always', 'optional'
# (handbook USE flag) and 'never'.
# This variable must be set before inheriting any eclasses. Defaults to 'never'.
# Also ensures buildtime and runtime dependencies are met.
TRINITY_HANDBOOK="${TRINITY_HANDBOOK:-never}"

# @ECLASS-VARIABLE: TRINITY_EXTRAGEAR_PACKAGING
# @DESCRIPTION:
# Set TRINITY_EXTRAGEAR_PACKAGING=yes before inheriting if the package use extragear-like
# packaging and then supports ${TRINITY_LANGS}, ${TRINITY_DOC_LANGS} and
# ${TRINITY_HANDBOOK} variables. The translations are found in the directory
# pointed by the TEG_PO_DIR variable.

# @ECLASS-VARIABLE: TRINITY_GIT_MIRROR
# @DESCRIPTION:
# User (or ebuild) can select another git mirror if it's needed;
# Defaults to https://mirror.git.trinitydesktop.org/gitea/TDE/

# @ECLASS-VARIABLE: TRINITY_GIT_BRANCH
# @DESCRIPTION:
# Specify git branch for live ebuilds. Default: master

# @ECLASS-VARIABLE: TRINITY_COMMON_DOCS
# @DESCRIPTION:
# Common doc names that were found in trinity project's dirs.
TRINITY_COMMON_DOCS="AUTHORS BUGS CHANGELOG CHANGES COMMENTS COMPLIANCE COMPILING
	CONFIG_FORMAT CONFIGURING COPYING COPYRIGHT CREDITS DEBUG DESIGN FAQ 
	HACKING HISTORY HOWTO IDEAS INSTALL LICENSE MAINTAINERS NAMING NEWS
	NOTES PLUGINS PORTING README SECURITY-HOLES TASKGROUPS TEMPLATE 
	TESTCASES THANKS THOUGHTS TODO VERSION"

# @ECLASS-VARIABLE: TRINITY_TARBALL
# @DESCRIPTION: 
# This variable holds the name of the tarboll with current module's source code.

# @ECLASS-VARIABLE: TRINITY_BASE_SRC_URI
# @DESCRIPTION:
# The top SRC_URI for all trinity packages
TRINITY_BASE_SRC_URI="http://www.mirrorservice.org/sites/trinitydesktop.org/trinity/releases"

#reset TRINITY_SCM and inherit proper eclass
if [[ ${BUILD_TYPE} = live ]]; then
	# set default TRINITY_SCM if not set
	[[ -z "$TRINITY_SCM" ]] && TRINITY_SCM=git

	case ${TRINITY_SCM} in
		git) inherit git-r3 ;;
		*) die "Unsupported TRINITY_SCM=${TRINITY_SCM}" ;;
	esac

	#set some variables
	EGIT_REPO_URI="${TRINITY_GIT_MIRROR:=https://mirror.git.trinitydesktop.org/gitea/TDE/${TRINITY_MODULE_NAME}}"
	EGIT_BRANCH="${TRINITY_GIT_BRANCH:=master}"

#	S="${WORKDIR}/${TRINITY_MODULE_NAME}"
elif [[ "${BUILD_TYPE}" == release ]]; then
	mod_name="${TRINITY_MODULE_NAME}"
	mod_ver="${TRINITY_MODULE_VER:=${PV}}"

	#Note:  Only releases in the 14.0 series are presently supported.
	full_mod_name="${mod_name}-trinity-${mod_ver}"
	TRINITY_TARBALL="${full_mod_name}.tar.xz"
	
	if [[ -n "${TRINITY_MODULE_TYPE}" ]] ; then
		SRC_URI="${TRINITY_BASE_SRC_URI}/R${mod_ver}/main/${TRINITY_MODULE_TYPE}/$TRINITY_TARBALL"
	else
		SRC_URI="${TRINITY_BASE_SRC_URI}/R${mod_ver}/main/$TRINITY_TARBALL"
	fi

	S="${WORKDIR}/${full_mod_name}"
else
	die "Unknown BUILD_TYPE=${BUILD_TYPE}"
fi


if [[ -n "${TRINITY_EXTRAGEAR_PACKAGING}" ]]; then 
# @ECLASS-VARIABLE: TEG_PO_DIR
# @DESCRIPTION:
# Change the translation directory for extragear packages. The default is ${S}/po
	TEG_PO_DIR="${TEG_PO_DIR:-${S}/po}"

# @ECLASS-VARIABLE: TEG_DOC_DIR
# @DESCRIPTION:
# Change the documentation directory for extragear packages. The default is
# ${S}/doc
	TEG_DOC_DIR="${TEG_DOC_DIR:-${S}/doc}"

	if [[ -n "${TRINITY_LANGS}" || -n "${TRINITY_DOC_LANGS}" ]]; then
		for lang in ${TRINITY_LANGS} ${TRINITY_DOC_LANGS}; do
			IUSE="${IUSE} linguas_${lang}"
		done

		trinityhandbookdepend="
			app-text/docbook-xml-dtd:4.2
			app-text/docbook-xsl-stylesheets
		"
		case ${TRINITY_HANDBOOK} in
			yes | always)
				DEPEDND+=" ${trinityhandbookdepend}"
				;;
			optional)
				IUSE+=" +handbook"
				DEPEND+=" handbook? ( ${trinityhandbookdepend} )"
				;;
			*) ;;
		esac
	fi
fi

# @FUNCTION: trinity-base-2_src_unpack
# @DESCRIPTION:
# A default src unpack function to either call
# git-r3_src_unpack or base_src_unpack.
trinity-base-2_src_unpack() {
	if [[ ${BUILD_TYPE} = live ]]; then
		git-r3_src_unpack
	else
		base_src_unpack
	fi
}


# @FUNCTION: trinity-base-2_src_prepare
# @DESCRIPTION:
# General pre-configure and pre-compile function for Trinity applications.
trinity-base-2_src_prepare() {
	debug-print-function ${FUNCNAME} "$@"

	local dir lang

	# SCM bootstrap--removed on the grounds that if you got this far,
	# you have to be using git

	# Apply patches
	eapply_user
	
	# Handle documentation and translations for extragear packages
	if [[ -n "$TRINITY_EXTRAGEAR_PACKAGING" ]]; then
		# remove languages that have not been selected
		if [[ -n $TRINITY_LANGS ]]; then
			einfo "Removing unselected translations from ${TEG_PO_DIR}"
			for dir in $(find ${TEG_PO_DIR} -mindepth 1 -maxdepth 1 -type d ); do
				lang="$(basename "$dir")"
				if ! has "$lang" ${TRINITY_LANGS}; then
					eerror "Translation $lang seems to present in the package but is not supported by the ebuild"
				elif ! has $lang ${LINGUAS}; then
					rm -rf $dir
				fi
			done
		fi

		# if we removed all translations we should point it
		if [[ -z $(find ${TEG_PO_DIR} -mindepth 1 -maxdepth 1 -type d) ]]; then
			TRINITY_NO_TRANSLATIONS=yes
		fi
		
		# remove not selected documentation
		if [[ -n $TRINITY_DOC_LANGS ]]; then
			einfo "Removing unselected documentation from ${TEG_DOC_DIR}"
			for dir in $(find ${TEG_DOC_DIR} -mindepth 1 -maxdepth 1 -type d ); do
				lang="$(basename "$dir")"
				if [[	"$lang" == "${PN}" || \
						"$lang" == "${TRINITY_MODULE_NAME}"  ]] ; then
					echo -n; # do nothing it's main documentation
				elif ! has "$lang" ${TRINITY_LANGS}; then
					eerror "Documentation translated to language $lang seems to present in the package but is not supported by the ebuild"
				elif ! has $lang ${LINGUAS}; then
					rm -rf $dir
				fi
			done
		fi
	fi

    cmake-utils_src_prepare
}


# @FUNCTION: trinity-base-2_src_configure
# @DESCRIPTION:
# Call standard cmake-utils_src_onfigure and add some common arguments.
trinity-base-2_src_configure() {
	debug-print-function ${FUNCNAME} "$@"
	local eg_cmakeargs	
	
	[[ -n "${PREFIX}" ]] && export PREFIX="${TDEDIR}"

	if [[ -n "$TRINITY_EXTRAGEAR_PACKAGING" ]]; then
		eg_cmakeargs=( -DBUILD_ALL=ON )
		if [[ "$TRINITY_NO_TRANSLATIONS" == "yes" ]]; then
			eg_cmakeargs=( -DBUILD_TRANSLATIONS=OFF "${eg_cmakeargs[@]}" )
		else
			eg_cmakeargs=( -DBUILD_TRANSLATIONS=ON "${eg_cmakeargs[@]}" )
		fi
		if [[ "${TRINITY_HANDBOOK}" == optional ]]; then
			eg_cmakeargs=( 
					-DWITH_DOC="$(usex handbook)"
					"${eg_cmakeargs[@]}" )
		fi
	fi

	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}${TDEDIR}"
		-DCMAKE_INSTALL_RPATH="${EPREFIX}${TDEDIR}"
		"${eg_cmakeargs[@]}"
		"${mycmakeargs[@]}"
	)

#       $([[ "${TRINITY_NEED_ARTS}" == "optional" ]] && (-DWITH_ARTS="$(usex arts)"))

	cmake-utils_src_configure
}

# @FUNCTION: trinity-base-2_src_compile
# @DESCRIPTION:
# Just call cmake-utils_src_compile.
trinity-base-2_src_compile() {
	debug-print-function ${FUNCNAME} "$@"
	
	cmake-utils_src_compile
}

# @FUNCTION: trinity-base-2_src_install
# @DESCRIPTION:
# Call standard cmake-utils_src_install and installs common documentation. 
trinity-base-2_src_install() {
	debug-print-function ${FUNCNAME} "$@"
	cmake-utils_src_install

	if [[ -z "$TRINITY_BASE_NO_INSTALL_DOC" ||
			"$TRINITY_BASE_NO_INSTALL_DOC" == "no" ]]; then
		trinity-base-2_create_tmp_docfiles
		trinity-base-2_install_docfiles
	fi
}

# @FUNCTION: trinity-base-2_create_tmp_docfiles
# @DESCRIPTION:
# Create docfiles in the form ${TMP_DOCDIR}/path.to.docfile.COMMON_NAME
# Also see the description for TRINITY_COMMON_DOCS and TMP_DOCDIR.
trinity-base-2_create_tmp_docfiles() {
	debug-print-function ${FUNCNAME} "$@"
	local srcdirs dir docfile targetdoc

	if [[ -z "$TMP_DOCDIR" || ! -d "$TMP_DOCDIR" ]] ; then
		TMP_DOCDIR="$T/docs"
		mkdir -p ${TMP_DOCDIR}
	fi

	if [[ -z "$@" ]] ; then
		srcdirs="./"
	else
		srcdirs="$@"
	fi

	einfo "Generating documentation list..."
	for dir in $srcdirs; do
		for doc in ${TRINITY_COMMON_DOCS}; do
			for docfile in $(find $dir -type f -name "*${doc}*"); do
				targetdoc="${docfile//\//.}"
				targetdoc="${targetdoc#..}"
				cp "${docfile}" "$TMP_DOCDIR/${targetdoc}"
			done
		done
	done

}

# @FUNCTION: trinity-base-2_install_docfiles
# @DESCRIPTION:
# Install documentation from ${TMP_DOCDIR} or from first argument.
trinity-base-2_install_docfiles() {
	debug-print-function ${FUNCNAME} "$@"
	local doc docdir
	[[ -n "$TMP_DOCDIR" ]] && docdir="$TMP_DOCDIR"
	[[ -n "$1" ]] && docdir="$1"
	[[ -z "$docdir" ]] && die "docdir is not set in ${FUNCNAME}."

	pushd "${docdir}" >/dev/null
	find . -maxdepth 1 -type f | while read doc; do
		einfo "Installing documentation: ${doc##*/}"
		dodoc "${doc}"
	done
	popd >/dev/null
}

EXPORT_FUNCTIONS src_configure src_compile src_install src_prepare
