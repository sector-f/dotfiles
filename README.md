#Dotfiles

##Basics
* Window Manager - BSPWM (Binary Space Partition Window Manager)
* Panel - lemonbar (patched for xft support)
* Launcher - dmenu2 + dzen2 application menu
* Partially borrowed from [neeasade's scripts](https://github.com/neeasade/dotfiles).

![Menu screenshot](http://i.imgur.com/U7FFsww.jpg)

##Requirements
Listed packages are for Arch, but should be available on most distributions.
* bspwm-git (AUR) or bspwm
* sxhkd
* dmenu2 (AUR)
* dzen2
* [xtitle-git](https://github.com/baskerville/xtitle) (AUR)
* xdotool
* adobe-source-code-pro-fonts
* ttf-font-awesome (AUR)

##Installation
This repository is organized to be used with [GNU Stow](https://www.gnu.org/software/stow/). Clone the repository with `git clone https://github.com/sector-f/dotfiles.git`, `cd` into the newly-created `dotfiles` directory, and create the symlinks with the `stow` command. For example, `stow bspwm` will symlink `~/dotfiles/bspwm/.config/bspwm/` to `~/.config/bspwm/` (assuming this repository was cloned to `~/dotfiles`).
