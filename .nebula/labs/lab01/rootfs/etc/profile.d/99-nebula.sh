# Nebula cadet workstation banner (interactive login shells only)
case "$-" in *i*) ;; *) return 0 2>/dev/null || exit 0 ;; esac
printf '\033[1;35m'
cat <<'ART'
    _   ____________  __  ____    ___
   / | / / ____/ __ )/ / / / /   /   |
  /  |/ / __/ / __  / / / / /   / /| |
 / /|  / /___/ /_/ / /_/ / /___/ ___ |
/_/ |_/_____/_____/\____/_____/_/  |_|
ART
printf '\033[0m\033[1;36m   Station VEGA-7 :: Deck 3 :: Workstation WS-042\033[0m\n'
printf '\033[2m   ----------------------------------------------\033[0m\n'
printf '   Logged in as \033[1;33m%s\033[0m. Mission briefing: missions/lab01-linux-1.md (in your Codespace)\n' "$(whoami)"
printf '   Look around with \033[1mls\033[0m. Type \033[1mexit\033[0m to return to your Codespace.\n\n'
