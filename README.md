# Dev environment files

Configurations for Neovim and Tmux.

## Setup

**Requires**

- True color terminal, like [iTerm2](https://iterm2.com/)
- Neovim (Version 0.8 or Later)
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope Fuzzy Finder
- Tmux plugin manager (TPM)

```
brew install --cask iterm2
```

```
brew install neovim
```

```
brew install ripgrep
```

```
brew intall stow
```

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Create symlinks with `stow`
```
stow --target $HOME <app>
```
