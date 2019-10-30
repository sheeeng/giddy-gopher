#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit  # Exit  immediately  if  a  pipeline  (which may consist of a single simple command), a list, or a compound command (see SHELL GRAMMAR above), exits with a non-zero status.
set -o nounset  # Treat  unset  variables  and  parameters  other than the special parameters "@" and "*" as an error when performing parameter expansion.  If expansion is attempted on an unset variable or parameter, the shell prints an error message, and, if not interactive, exits with a  non-zero status.
set -o pipefail  #  If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero  if  all commands in the pipeline exit successfully.  This option is disabled by default.
IFS=$'\n\t'

# https://stackoverflow.com/a/5972982
# set -x  # After  expanding  each  simple  command, for command, case command, select command, or arithmetic for command, display the expanded value of PS4, followed by the command and its expanded arguments or associated word list.
# set -v  # Print shell input lines as they are read.

# echo "------------------------------------------------------------------------"

REST_API_ROOT_URL="http://localhost:65535"
echo "\${REST_API_ROOT_URL}: ${REST_API_ROOT_URL}"

# https://stackoverflow.com/a/7832158
COLORS_ENABLED=${COLORS_ENABLED:-}
DEBUG_ENABLED=${COLORS_ENABLED:-}

# https://stackoverflow.com/a/13359121
for i in "${@}"; do
    case ${i} in
        -c|--color|--colors)
        COLORS_ENABLED=1
        ;;
        -d|--debug)
        DEBUG_ENABLED=1
        ;;
        -c=*|--colors=*)
        COLORS_ENABLED="${i#*=}"
        ;;
        -d=*|--debug=*)
        DEBUG_ENABLED="${i#*=}"
        ;;
        *)
        ;;
    esac
done

echo "\${COLORS_ENABLED}: ${COLORS_ENABLED}"
echo "\${DEBUG_ENABLED}: ${DEBUG_ENABLED}"

# https://stackoverflow.com/a/5973558
if [ -n "${DEBUG_ENABLED}" ]; then
    set -x  # After  expanding  each  simple  command, for command, case command, select command, or arithmetic for command, display the expanded value of PS4, followed by the command and its expanded arguments or associated word list.
    set -v  # Print shell input lines as they are read.
    CURL_OPTIONS=(
        "location"
    )
else
    CURL_OPTIONS=(
        "fail"
        "silent"
        "show-error"
        "location"
    )
fi
echo "\${CURL_OPTIONS[@]/#/--}: ${CURL_OPTIONS[@]/#/--}"

# echo "------------------------------------------------------------------------"
