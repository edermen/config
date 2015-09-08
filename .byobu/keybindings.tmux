unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix
bind b run-shell "tmux show-buffer | parcellite > /dev/null >&1"
