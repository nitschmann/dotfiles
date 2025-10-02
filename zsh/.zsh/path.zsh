#
# Custom paths (Apple Silicon safe)
#

# --- rbenv (only if installed) ---
if [ -d "$HOME/.rbenv/bin" ]; then
  path=($HOME/.rbenv/bin $path)
  eval "$(rbenv init - zsh)"
fi

# --- MySQL (optional, only if installed at /usr/local/mysql) ---
if [ -d "/usr/local/mysql/bin" ]; then
  path=($path /usr/local/mysql/bin)
  export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
fi

# Ensure Apple Silicon Homebrew comes first
if [ -d /opt/homebrew/bin ]; then
  path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
fi

export PATH
