#!/usr/bin/env bash

echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
# https://askubuntu.com/a/691237
# figlet -w 72 -c -k Amce | gzip | base64
base64 -d <<< "\
H4sIAIapuV0AA32PsQ3AMAgEe0/xXdKx0EufQRg+gKOkgbxlY504IwN9NPDIGriBZUqpS/u2weBY
NLKK3HEI1wvA3rF6j44zin/Lc5C1jsnipEjlHEX3swtM//nLugFAxKiZOAEAAA==" | gunzip
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"

echo "▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣"

# https://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "\${SCRIPT_DIR}: ${SCRIPT_DIR}"

# https://stackoverflow.com/a/192337
SCRIPT_FILENAME="$(basename "$(test -h "$0" && readlink "$0" || echo "$0")")"
echo "\${SCRIPT_FILENAME}: ${SCRIPT_FILENAME}"

source "${SCRIPT_DIR}/commons.sh"
source "${SCRIPT_DIR}/colors.sh"

echo "▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣"

echo "------------------------------------------------------------------------"

curl \
    "${CURL_OPTIONS[@]/#/--}" \
    --data "$(cat ${SCRIPT_DIR}/article.json)" \
    --header "Content-Type: application/json" \
    --request POST \
    "${REST_API_ROOT_URL}/article"

echo "------------------------------------------------------------------------"
