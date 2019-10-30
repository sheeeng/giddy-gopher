#!/usr/bin/env bash

if [[ -n "${DEBUG_ENABLED}" ]]; then
    echo "\${COLORS_ENABLED}: ${COLORS_ENABLED}."
fi

defaultForegroundForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[39m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

redForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[31m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

greenForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[32m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

yellowForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[33m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

blueForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[34m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

magentaForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[35m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

cyanForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[36m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightGrayForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[37m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

darkGrayForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[90m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightRedForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[91m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightGreenForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[92m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightYellowForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[93m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightBlueForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[94m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightMagentaForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[95m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightCyanForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[96m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}

lightWhiteForeground() {
    if [ -n "${COLORS_ENABLED}" ]; then printf '\E[97m'; else printf '\E[0m'; fi
    echo "$@"
    printf '\E[0m'
}
