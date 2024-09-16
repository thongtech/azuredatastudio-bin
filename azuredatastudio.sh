#!/bin/bash

# Substitute XDG_CONFIG_HOME by ~/.config if the env var is unset or empty
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
FLAG_FILE="electron-flags.conf"

# Allow users to override command-line options
if [[ -f "${XDG_CONFIG_HOME}/${FLAG_FILE}" ]]; then
    mapfile -t USER_FLAGS <<< "$(grep -v '^#' "${XDG_CONFIG_HOME}/${FLAG_FILE}")"
    echo "User flags:" "${USER_FLAGS[@]}"
fi

# Launch app with the given flags
exec /opt/azuredatastudio/bin/azuredatastudio "${USER_FLAGS[@]}" "$@"
