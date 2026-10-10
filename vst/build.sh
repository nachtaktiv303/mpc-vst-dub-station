#!/usr/bin/env bash
# Build Dub Station as an MPC OS VST2 effect with mpc-vst-plugins' generic port builder (vst.json).
#   vst/build/dub_station.so          -> the device (installed inside the plugin's Synths folder)
#   vst/build/skin/<folder>/          -> the plugin skin
#   vst/build/pluginlist-entry.xml    the <PLUGIN> line for MPC.settings' pluginList-arm
# Needs an mpc-vst-plugins checkout (MPC_VST) next to mpc-vst-dub-station.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
MPC_VST="${MPC_VST:-$here/../../mpc-vst-plugins}"
[ -x "$MPC_VST/tools/build_port.sh" ] || { echo "need an mpc-vst-plugins checkout (MPC_VST)" >&2; exit 1; }
exec "$MPC_VST/tools/build_port.sh" "$here/vst.json"
