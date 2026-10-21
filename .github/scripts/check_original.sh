#!/usr/bin/env bash
# Compare the latest ANOVA-kun source on the original site with the copy in
# inst/original/. Prints the result as KEY=VALUE lines (for GitHub Actions) and
# exits 0 whether or not a new version was found; exits 1 only on a fetch
# failure.
#
# Usage: .github/scripts/check_original.sh [download-dir]
#   When download-dir is given, the latest source is saved there as well.
set -euo pipefail

PAGE_URL='https://riseki.cloudfree.jp/?ANOVA%E5%90%9B'
FILE_URL='https://riseki.cloudfree.jp/?plugin=attach&pcmd=open&file=%s&refer=ANOVA%%E5%%90%%9B'
ORIG_DIR="$(cd "$(dirname "$0")/../.." && pwd)/inst/original"
DL_DIR="${1:-$(mktemp -d)}"
mkdir -p "$DL_DIR"

# The copy in the package.
local_file="$(ls "$ORIG_DIR"/anovakun_[0-9]*.txt | head -n 1)"
local_name="$(basename "$local_file")"
local_sha="$(shasum -a 256 "$local_file" | cut -d' ' -f1)"

# The newest file linked from the page (largest version number).
page="$DL_DIR/page.html"
curl -fsSL --retry 3 "$PAGE_URL" -o "$page"
remote_name="$(grep -oE 'anovakun_[0-9]+\.txt' "$page" | sort -t_ -k2 -n | uniq | tail -n 1)"
if [ -z "$remote_name" ]; then
  echo "No anovakun_NNN.txt link found on the page" >&2
  exit 1
fi

# shellcheck disable=SC2059
remote_url="$(printf "$FILE_URL" "$remote_name")"
remote_file="$DL_DIR/$remote_name"
curl -fsSL --retry 3 "$remote_url" -o "$remote_file"
remote_sha="$(shasum -a 256 "$remote_file" | cut -d' ' -f1)"

if [ "$remote_name" != "$local_name" ]; then
  status="new_version"
elif [ "$remote_sha" != "$local_sha" ]; then
  status="same_name_changed"
else
  status="up_to_date"
fi

echo "status=$status"
echo "local_name=$local_name"
echo "local_sha=$local_sha"
echo "remote_name=$remote_name"
echo "remote_sha=$remote_sha"
echo "remote_url=$remote_url"
echo "remote_file=$remote_file"
