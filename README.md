tmux-mac
========

Search man from your tmux sesseion

# Description

Just do man.

# Requirements

* [tmux](https://tmux.github.io/)
* [tpm](https://github.com/tmux-plugins/tpm)
* bash >= 4.x

# Install

Install tpm and add the following line to your `~/.tmux.conf`.

```bash
set-option -g @plugin 'knakayama/tmux-man'
```

then, press `Prefix + I` in tmux session.

# Usage

Default key binding is `Prefix + m`. If you change this key binding, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @man-key 'x' # or your favorite key binding
```

Default `split-window` length is 10. If you change this length, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @man-len 15 # or your favorite length
```

As `man` runs in non-interactive shell your `.bashrc` or `.zshrc` settings are not loaded.
If you want to load them (for you may have an alias for man set up), set the following line in your `~/.tmux.conf`.

```bash
set-option -g @man-shell-interactive 'on'
```

# License

MIT

# Author

[knakayama](https://github.com/knakayama)
