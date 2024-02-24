# dotfiles

### Mac settings / setup

- "Spaces" via mission control `Control + Up`
- Settings -> Keyboard -> Keyboard shortcuts -> Mission Control -> Check all options
- Settings -> Accessibility -> Display -> Reduce motion
- Settings -> Desktop & Dock -> Disable "Automatically rearrange Spaces based on most recent use"

### One line setup with [ Chezmoi ](https://www.chezmoi.io/)

```
export GITHUB_USERNAME=tuovinensanttu
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

### Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- For M-series Macs, use the following commtands

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Yabai

```
brew install koekeishiya/formulae/yabai
```

```
yabai --start-service
```

### Skhd

```
brew install koekeishiya/formulae/skhd
```

```
brew services start / restart skhd
```

### Vinium bindings

```
map u scrollUp
map e scrollDown
map n scrollLeft
map i scrollRight

map U nextTab
map E previousTab
map N goBack
map I goForward
```
