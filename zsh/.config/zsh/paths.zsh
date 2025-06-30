# Adding some paths to PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes cargo's bin if it exists
if [ -d "$HOME/.cargo/bin" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes ruby's bin if it exists
if [ -d "$HOME/.local/share/gem/ruby/3.3.0/bin" ]; then
  PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
fi
