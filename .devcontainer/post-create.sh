#!/usr/bin/env bash
# Runs once when the Codespace is created.
set -e
chmod +x .nebula/bin/ctf .nebula/bin/nebula-agent
mkdir -p .nebula/progress && touch .nebula/progress/log.jsonl

if ! grep -q "NEBULA_WELCOME" ~/.bashrc; then
cat >> ~/.bashrc <<'RC'
# NEBULA_WELCOME
if [ -n "$PS1" ] && command -v ctf >/dev/null 2>&1; then
  printf '\n\033[1;35m  NEBULA\033[0m :: cadet console ready.  '
  if [ -f "${CODESPACE_VSCODE_FOLDER:-$PWD}/.nebula/profile.json" ]; then
    printf 'Type \033[1mctf list\033[0m to see your missions.\n\n'
  else
    printf 'First time here? Type \033[1mctf register\033[0m\n\n'
  fi
fi
RC
fi
echo "Nebula cadet terminal ready."
