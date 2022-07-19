# Copyright 1999-2022 Gentoo Authors
# Copyright 2022 The Trinity Desktop Project
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TRINITY_MODULE_TYPE="dependencies"
TRINITY_MODULE_NAME="akode"
inherit trinity-base-2

DESCRIPTION="Simple framework to decode the most common audio formats"
HOMEPAGE="https://trinitydesktop.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
if [[ ${PV} != *9999* ]] ; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi
IUSE="alsa flac ffmpeg jack +libsamplerate mp3 mpc oss pulseaudio sndfile vorbis"

DEPEND="
	alsa? ( media-libs/alsa-lib )
	flac? ( media-libs/flac )
	ffmpeg? ( media-video/ffmpeg )
	jack? ( virtual/jack )
	libsamplerate? ( media-libs/libsamplerate )
	mp3? ( media-libs/libmad )
	mpc? ( dev-libs/mpc )
	pulseaudio? ( media-sound/pulseaudio )
	sndfile? ( media-libs/libsndfile )
	vorbis? ( media-libs/libvorbis
		media-libs/speex )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_FFMPEG_DECODER=$(usex ffmpeg)
		-DWITH_SUN_SINK=OFF
		-DWITH_LIBLTDL=OFF
		-DWITH_ALSA_SINK=$(usex alsa)
		-DWITH_OSS_SINK=$(usex oss)
		-DWITH_PULSE_SINK=$(usex pulseaudio)
		-DWITH_JACK_SINK=$(usex jack)
		-DWITH_MPEG_DECODER=$(usex mp3)
		-DWITH_XIPH_DECODER=$(usex vorbis)
		-DWITH_MPC_DECODER=$(usex mpc)
		-DWITH_SRC_RESAMPLER=$(usex libsamplerate)
	)

	cmake_src_configure
}
