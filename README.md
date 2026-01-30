
<h1 align="center">My Neovim, Tmux and zsh configs!</h1>

<div align="center">
 
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.9.0-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Code Size](https://img.shields.io/github/languages/code-size/drcheeseface/dotfiles)](https://img.shields.io/github/languages/code-size/drcheeseface/dotfiles)
[![kfc](https://img.shields.io/badge/KFC-F40027?style=for-the-badge&logo=kfc&logoColor=white)](https://www.kfc.co.uk/)

</div>

![ims of my dope ass terminal setup](./bruh.png)
<br></br>
## Vim 🦆
### Installation guide
install a C compiler if you dont already have one
```
$ sudo apt install gcc -y
```
There are a few dependencies for everything to work
```
$ cargo install tree-sitter-cli
or 
$ npm install tree-sitter-cli
```
To get markdown preview working
```
npm install --global yarn
```
for grep functionality install ripgrep (you want this)
```
$ sudo apt install ripgrep -y
```
copying neovim config folder (nvim/) to ~/.config
```
$ git clone https://github.com/DrCheeseFace/dotfiles.git ~/.config
```

[make sure neovim is v.10+](https://github.com/neovim/neovim/blob/master/INSTALL.md) <br>
Theres an issue with loading vimdoc sometimes due to nvims default vimscript 
parser and treesitters one. This caused longer boot times.    

```
:TsInstall! vim
```

## TMUX 👾

This is a customized TMUX configuration for a productive and aesthetically pleasing terminal experience.
(this was ai generated text lmao)
<br> 
    Pretty minimal. Just check the tmux.conf file.

### Plugins

The configuration includes several plugins managed by [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm). The listed plugins are:
### TPM Installation

[Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm) is used as the plugin manager for tmux

| Plugin                                                                                  | Description                      |
| -----------------------------------------------------------------------------           | -------------------------------- |
| [`tmux-plugins/tpm`](https://github.com/tmux-plugins/tpm)                               | Tmux Plugin Manager              |
| [`tmux-plugins/tmux-sensible`](https://github.com/tmux-plugins/tmux-sensible)           | Sensible configurations for TMUX |
| [`tmux-plugins/tmux-resurrect`](https://github.com/tmux-plugins/tmux-resurrect)         | save sessions                    |
| [`niksingh710/minimal-tmux-status`](https://github.com/niksingh710/minimal-tmux-status) | minimal status line              |

![ims of my dope ass terminal setup](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExaTdwczUyM3Q3MWsyanVsNnlzYTZjY2FrYzhtNm1iaW11NDR2bjY3OSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3pTtbLJ7Jd0YM/giphy.webp)

### Random stuff for the next time i migrate
getchu some zsh and use tha .zshrc file in the repo
```
sudo apt-get install zsh
chsh -s $(which zsh)
```
install fzf via the repo 
```
and run ./install
```
