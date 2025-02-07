#!/bin/sh
file="$1"
file="$1"
width="$2"
height="$3"
x="$4"
y="$5"

IMAGE_CACHE_PATH="$(mktemp "${TMPDIR:-/tmp}/thumb_cache.XXXXX")"

case "$(file -Lb --mime-type -- "$1")" in
	image/*)
		# chafa -f sixel -s "${width}x${height}" --animate off --polite on "${file}"
		chafa -f sixel --polite on "${file}"
		exit 1
		;;
	text/*)
		cat "$1"
		exit 1
		;;
	video/*)
		# Get embedded thumbnail
		# ffmpeg -i "${file}" -map 0:v -map -0:V -c copy "${IMAGE_CACHE_PATH}" && exit 6
		# Get frame 10% into video
		ffmpegthumbnailer -t "5%" -i "${file}" -o "${IMAGE_CACHE_PATH}" -s 0
		chafa -f sixel --polite on "$IMAGE_CACHE_PATH"
		exit 1;;
esac
