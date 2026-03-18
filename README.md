# dotfiles

A modern developer environment for macOS and Linux, managed with [chezmoi](https://chezmoi.io).

## Installation

### Quick install

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sean-j --source ~/.dotfiles
```

### If you already have chezmoi

```sh
chezmoi init --apply sean-j --source ~/.dotfiles
```

chezmoi will automatically:
1. Install Homebrew and packages
2. Install zinit, mise runtimes, fzf, and fonts
3. Apply all dotfiles
4. Install Neovim plugins

## What's Included

### Shell

- **zsh** with [zinit](https://github.com/zdharma-continuum/zinit) plugin manager
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- **[Starship](https://starship.rs)** prompt (cross-shell, Rust-based)
- **[atuin](https://github.com/atuinsh/atuin)** shell history (SQLite-backed, searchable)

### Terminal

- **[Ghostty](https://ghostty.org)** (macOS) — GPU-accelerated terminal emulator
- **[tmux](https://github.com/tmux/tmux)** — terminal multiplexer (prefix: `C-a`, vim-style keybindings)

### Editor

- **[Neovim](https://neovim.io)** with Lua configuration
  - [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) — LSP (Python, TypeScript, Kotlin, Swift, SQL, Lua)
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — completion
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finder
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax highlighting
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) + [vim-fugitive](https://github.com/tpope/vim-fugitive) — git integration
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua) + [codeium.nvim](https://github.com/Exafunction/codeium.nvim) — AI completion
  - [catppuccin](https://github.com/catppuccin/nvim) colorscheme

### CLI Tools

| Tool | Description |
|------|-------------|
| [mise](https://mise.jdx.dev) | Polyglot runtime manager (node, python, ruby, etc.) + env vars |
| [fd](https://github.com/sharkdp/fd) | Fast `find` alternative |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast `grep` alternative |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` |
| [eza](https://github.com/eza-community/eza) | Modern `ls` replacement |
| [bat](https://github.com/sharkdp/bat) | `cat` with syntax highlighting |
| [delta](https://github.com/dandavber/delta) | Better git diff |
| [difftastic](https://github.com/Wilfred/difftastic) | Structural diff |
| [lazygit](https://github.com/jesseduffield/lazygit) | TUI git client |
| [yazi](https://github.com/sxyazi/yazi) | Terminal file manager |
| [tldr](https://github.com/tldr-pages/tldr) | Simplified man pages |
| [jq](https://github.com/jqlang/jq) | JSON processor |

## File Structure

```
~/.dotfiles/                    # chezmoi source directory
├── .chezmoi.toml.tmpl          # chezmoi config (OS detection)
├── .chezmoiignore              # files not applied to $HOME
├── install.sh                  # one-line installer
│
├── run_once_before_01-*.sh.tmpl  # install Homebrew
├── run_once_before_02-*.sh.tmpl  # install brew packages
├── run_once_before_03-*.sh.tmpl  # install zinit, mise, fzf, fonts
├── run_once_after_*.sh.tmpl      # install Neovim plugins
│
├── dot_zshrc                   # → ~/.zshrc
├── dot_bashrc                  # → ~/.bashrc
├── dot__shrc                   # → ~/._shrc (shared bash/zsh)
├── dot_profile                 # → ~/.profile
├── dot_inputrc                 # → ~/.inputrc
├── dot_gitconfig               # → ~/.gitconfig
├── dot_tmux.conf               # → ~/.tmux.conf
├── dot_os.Darwin._shrc         # → ~/.os.Darwin._shrc
├── dot_os.Linux._shrc          # → ~/.os.Linux._shrc
│
├── dot_config/
│   ├── nvim/                   # → ~/.config/nvim/
│   │   ├── init.lua
│   │   └── lua/{config,plugins}/
│   ├── ghostty/config          # → ~/.config/ghostty/config
│   └── starship.toml           # → ~/.config/starship.toml
│
├── Brewfile                    # core packages
├── Brewfile.Darwin             # macOS packages
├── Brewfile.Linux              # Linux packages
└── Brewfile.extra              # optional packages
```

## Managing Dotfiles

```sh
chezmoi edit ~/.zshrc       # edit source, then apply
chezmoi diff                # preview changes
chezmoi apply               # apply all changes
chezmoi add ~/.some_file    # start tracking a new file
chezmoi cd                  # cd into source directory
chezmoi update              # pull latest from git and apply
```

## Customization

Shell rc files are loaded in layers:

1. `.os.$(uname -s)._shrc` — OS-specific (e.g., `.os.Darwin._shrc`)
2. `.host.$(uname -n)._shrc` — Host-specific
3. `.local._shrc` — Local overrides (not tracked in git)

The same pattern works for `.zshrc` and `.bashrc` (e.g., `.local.zshrc`).

## Key Bindings

### tmux (prefix: `C-a`)

| Key | Action |
|-----|--------|
| `c` / `C-c` | New window |
| `C-a` | Last window |
| `C-n` / `C-p` | Next / previous window |
| `S` / `V` | Split horizontal / vertical |
| `h` `j` `k` `l` | Select pane |
| `M-h` `M-j` `M-k` `M-l` | Resize pane |
| `_` / `Enter` | Zoom pane |
| `Tab` / `BTab` | Next / previous pane |

### Neovim (leader: `,`)

| Key | Action |
|-----|--------|
| `,ff` / `C-p` | Find files |
| `,fg` | Live grep |
| `,fb` | Buffers |
| `,t.` | Toggle file tree |
| `,tU` | Toggle undotree |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `,rn` | Rename |
| `,ca` | Code action |

## License

[MIT](LICENSE)
