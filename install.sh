#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
main_script="$script_dir/arepo.sh"

if [ ! -f "$main_script" ]; then
    echo "Error: $main_script not found!"
    exit 1
fi

chmod +x "$main_script"

# Detect the current shell
current_shell="$(basename "$SHELL")"
case "$current_shell" in
    zsh)
        shell_rc="$HOME/.zshrc"
        ;;
    bash)
        shell_rc="$HOME/.bashrc"
        ;;
    *)
        shell_rc="$HOME/.bashrc"
        echo "Warning: unrecognized shell '$current_shell', defaulting to .bashrc"
        ;;
esac

alias_line="alias arepo='$main_script'"

if grep -Fxq "$alias_line" "$shell_rc"; then
    echo "Alias already exists in $shell_rc"
else
    echo "$alias_line" >> "$shell_rc"
    echo "Added alias 'arepo' to $shell_rc"
fi

echo "To activate the alias, run:"
echo "  source $shell_rc"
