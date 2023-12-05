# My Neovim, Tmux and Zellij configs!

<br></br>

## Vim

The plugins I use in my neovim config
| Plugin | Description |
|------------------------------------------|---------------------------------------------------|
| [`rose-pine/neovim`](https://github.com/rose-pine/neovim) | Rose Pine colorscheme for Neovim |
| [`wbthomason/packer.nvim`](https://github.com/wbthomason/packer.nvim) | Plugin manager for Neovim |
| [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for Neovim |
| [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax tree sitter for Neovim |
| [`nvim-lua/plenary.nvim`](https://github.com/nvim-lua/plenary.nvim) | Plenary library (required for some plugins) |
| [`ThePrimeagen/harpoon`](https://github.com/ThePrimeagen/harpoon) | Project navigation for Neovim |
| [`mbbill/undotree`](https://github.com/mbbill/undotree) | Visualize undo history in a tree format |
| [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive) | Git integration for Neovim |
| [`williamboman/mason.nvim`](https://github.com/williamboman/mason.nvim) | File templates and snippets for Neovim |
| [`windwp/nvim-autopairs`](https://github.com/windwp/nvim-autopairs) | Autopairs for Neovim |
| [`numToStr/Comment.nvim`](https://github.com/numToStr/Comment.nvim) | Commenting plugin for Neovim |
| [`vim-airline/vim-airline`](https://github.com/vim-airline/vim-airline) | Statusline for Neovim |
| [`vim-airline/vim-airline-themes`](https://github.com/vim-airline/vim-airline-themes) | Themes for vim-airline |

<br></br>
My custom keybindings for neovim

### Harpoon Keybindings

| Mode | Key Binding | Functionality                                                  |
| ---- | ----------- | -------------------------------------------------------------- |
| n    | `<leader>a` | Append a new entry in Harpoon (a plugin for managing projects) |
| n    | `<C-e>`     | Toggle the quick menu in Harpoon for project navigation        |
| n    | `<C-h>`     | Select the first entry in Harpoon's project list               |
| n    | `<C-t>`     | Select the second entry in Harpoon's project list              |
| n    | `<C-n>`     | Select the third entry in Harpoon's project list               |
| n    | `<C-s>`     | Select the fourth entry in Harpoon's project list              |

### General Vim Commands

| Mode | Key Binding  | Functionality                                                 |
| ---- | ------------ | ------------------------------------------------------------- |
| n    | `<leader>pv` | Execute `vim.cmd.Ex`                                          |
| n    | `<C-d>`      | Scroll half a screen down and reposition cursor to the center |
| n    | `<C-u>`      | Scroll half a screen up and reposition cursor to the center   |
| v    | `J`          | Move selected lines down                                      |
| v    | `K`          | Move selected lines up                                        |

### Git Keybindings

| Mode | Key Binding  | Functionality              |
| ---- | ------------ | -------------------------- |
| n    | `<leader>gs` | Run the Git command in Vim |

### Fuzzy Finder Keybindings

| Mode | Key Binding  | Functionality                                            |
| ---- | ------------ | -------------------------------------------------------- |
| n    | `<leader>pf` | Open a fuzzy finder for files in the project             |
| n    | `<C-p>`      | Open a fuzzy finder for Git-tracked files in the project |
| n    | `<leader>ps` | Grep for a string in the project (user-inputted string)  |

<br></br>

## Zellij

This is a customized Zellij configuration with themes and UI modifications.

- [Tokyo Night Dark theme](https://github.com/zellij-org/zellij/blob/main/zellij-utils/assets/themes/tokyo-night-dark.kdl)
- rounded pane corners

### [Tokyo Night Dark](https://github.com/zellij-org/zellij/blob/main/zellij-utils/assets/themes/tokyo-night-dark.kdl)

```plaintext
themes{
  tokyo-night-dark {
          fg 169 177 214
              bg 26 27 38
              black 56 62 90
              red 249 51 87
              green 158 206 106
              yellow 224 175 104
              blue 122 162 247
              magenta 187 154 247
              cyan 42 195 222
              white 192 202 245
              orange 255 158 100
      }
  }
}
ui {
    pane_frames {
        rounded_corners true
    }
}

theme "tokyo-night-dark"

```

## ZELLIJ example

![ims of my dope ass terminal setup](https://github.com/DrCheeseFace/neovimAndTemux/blob/main/zellij.jpg?raw=true)
<br></br>

# TMUX Configuration

This is a customized TMUX configuration for a productive and aesthetically pleasing terminal experience.

## Configuration Settings

| Setting                                   | Description                                 |
| ----------------------------------------- | ------------------------------------------- |
| `setw -g mouse on`                        | Enable mouse support within TMUX            |
| `set -s default-terminal 'tmux-256color'` | Set the default terminal to 'tmux-256color' |

## Plugins

The configuration includes several plugins managed by [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm). The listed plugins are:
## TPM Installation

[Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm) is used as the plugin manager for tmux


| Plugin                                                                        | Description                      |
| ----------------------------------------------------------------------------- | -------------------------------- |
| [`tmux-plugins/tpm`](https://github.com/tmux-plugins/tpm)                     | Tmux Plugin Manager              |
| [`tmux-plugins/tmux-sensible`](https://github.com/tmux-plugins/tmux-sensible) | Sensible configurations for TMUX |
| [`dracula/tmux`](https://github.com/dracula/tmux)                             | Dracula theme for TMUX           |

## Dracula Theme Customizations

The Dracula theme is customized with additional features. The following configurations are applied:

| Dracula Setting            | Value                  |
| -------------------------- | ---------------------- |
| `@dracula-plugins`         | "battery weather time" |
| `@dracula-show-powerline`  | true                   |
| `@dracula-show-fahrenheit` | false                  |
| `@dracula-military-time`   | true                   |



## TMUX example

![ims of my dope ass terminal setup](https://github.com/DrCheeseFace/neovimAndTemux/blob/main/rice.jpg?raw=true)
