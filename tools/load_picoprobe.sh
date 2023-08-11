#!/bin/bash

PICOTOOL="${PICO_BASE_PATH}/picotool/build/picotool"

${PICOTOOL} load ${PICO_BASE_PATH}/picoprobe/build/picoprobe.uf2
${PICOTOOL} reboot