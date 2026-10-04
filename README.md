                    ,,,
                  .'    `/\_/\
                .'       <@I@>
    <((((((((((  )____(  \./
                \( \(   \(\(
                 `-"`-"  " "

    Your new coding pet ^^

# Racoon.Vim — Minimal Vim Starter for WebDev

A minimal, opinionated Vim configuration for web development (but not only). Auto-configures Vim with useful defaults on first launch. Minimal on purpose — it's a starting point. Make your own Racoon pet. It's just Vim.

---

## Install

```bash
# 1. Clone
git clone https://github.com/AndiKod/racoon.vim ~/.vim

# 2. (optional) Bootstrap — installs LSP servers + Prettier via npm
bash ~/.vim/racoon-bootstrap.sh

# 3. Launch Vim
vim
```

VimPlug auto-installs itself and all plugins on first launch.

The bootstrap script is just a convenience. You don't have to use it — if you already have the servers, or prefer `pnpm / bun / yarn`, install them manually (see `## LSP Servers` below). Racoon only needs the binaries in your `$PATH`.

**Requirements:** Vim 9+, Node.js + a package manager (npm / pnpm / bun / yarn), internet connection (one-time).

---

## What's Included

- **LSP** — vim-lsp + asyncomplete (go-to-definition, hover docs, diagnostics)
- **Completion** — asyncomplete (LSP + buffer words + file paths, auto-popup, no account needed)
- **Snippets** — vim-vsnip + friendly-snippets (2k+ VSCode-style snippets, works offline)
- **Linting & Formatting** — ALE with Prettier (fix on save)
- **AI Completion** — GitHub Copilot (installed but OFF by default, opt-in, free tier available)
- **Fuzzy Finding** — fzf.vim (files, git files, history, buffers, lines)
- **File Browsing** — NERDTree
- **Buffer Management** — vim-buftabline + Tab/S-Tab cycling
- **Status Bar** — vim-airline with Catppuccin Mocha
- **Git** — vim-fugitive
- **Commenting** — vim-commentary
- **Surroundings** — vim-surround
- **CSS Color Preview** — vim-css-color
- **Emmet** — HTML/CSS expansion
- **Auto Pairs** — auto-close brackets/quotes
- **Start Screen** — vim-startify with raccoon header
- **Terminal** — built-in `:term` / `:vert ter`

---

## Plugins

| Category | Plugins |
|----------|---------|
| LSP & Completion | vim-lsp, asyncomplete.vim, asyncomplete-lsp.vim, asyncomplete-file.vim, asyncomplete-buffer.vim |
| Snippets | vim-vsnip, vim-vsnip-integ, asyncomplete-vsnip.vim, friendly-snippets |
| Linting & Formatting | dense-analysis/ale |
| AI | github/copilot.vim |
| Editing | vim-surround, vim-commentary, vim-fugitive, auto-pairs, emmet-vim |
| UI | vim-buftabline, fzf, fzf.vim, vim-airline, catppuccin, vim-css-color, vim-transparent, vim-startify, nerdtree |

Managed by [VimPlug](https://github.com/junegunn/vim-plug). Use `:PlugInstall`, `:PlugUpdate`, `:PlugClean` to manage. All plugins are installed by default (opt-out: comment the `Plug` line in `vimrc`, then `:PlugClean`).

---

## LSP Servers

Racoon expects these binaries in your `$PATH`:

| Language | Package(s) | Provides |
|----------|------------|----------|
| TypeScript/JavaScript | `typescript-language-server` + `typescript` | `typescript-language-server` |
| CSS/HTML/JSON | `vscode-langservers-extracted` | `vscode-css-language-server`, `vscode-html-language-server`, `vscode-json-language-server` |
| Bash | `bash-language-server` | `bash-language-server` |
| Formatting (JS/TS/CSS/HTML/JSON) | `prettier` | `prettier` |

Install with your preferred manager:

**npm:**
```bash
npm i -g typescript-language-server typescript vscode-langservers-extracted bash-language-server prettier
```

**pnpm:**
```bash
pnpm add -g typescript-language-server typescript vscode-langservers-extracted bash-language-server prettier
```

**bun:**
```bash
bun add -g typescript-language-server typescript vscode-langservers-extracted bash-language-server prettier
```

**yarn (classic):**
```bash
yarn global add typescript-language-server typescript vscode-langservers-extracted bash-language-server prettier
```

Check with:
```bash
command -v typescript-language-server prettier bash-language-server; echo ok
```

> Note: `shfmt` (used by ALE for `sh` files) is not on npm. Install via `go install mvdan.cc/sh/v3/cmd/shfmt@latest` or `apt/brew install shfmt`.

To add more servers, install them globally the same way and register in vim-lsp. See [vim-lsp docs](https://github.com/prabirshrestha/vim-lsp#registering-servers).

---

## Completion & Snippets (no Copilot needed)

Works out of the box, offline, no account:

* Start typing → popup appears (LSP + snippets + buffer words + file paths)
* `<Tab>` / `<S-Tab>` → next / previous item in popup
* `<CR>` → confirm selection
* `<C-j>` → expand snippet
* `<C-l>` → jump to next snippet placeholder
* `<C-u>` → expand Emmet (e.g. `div.list>ul>li*3`)

Snippets come from `friendly-snippets` (JS/TS/React/HTML/CSS/JSON/Sh/...). To opt-out, comment the `Snippets` `Plug` lines in `vimrc`, then `:PlugClean`.

---

## Copilot

GitHub Copilot is installed but **OFF by default**. It coexists with the above — it uses ghost text, not the popup, and does not steal `<Tab>`.

To activate:

1. Run `:Copilot setup` and follow the GitHub device auth flow
2. Toggle on/off with `<leader>ct`
3. Accept a suggestion with `<C-y>` (`<Tab>` stays for completion/snippets)

Free tier includes 2,000 completions/month. [Details](https://github.com/github/copilot.vim). To fully opt-out, comment `Plug 'github/copilot.vim'` in `vimrc`, then `:PlugClean`.

---

## Keybindings

`<Leader>` = `Space`

| Binding | Action |
|---------|--------|
| `jj` | Escape (from insert mode) |
| `<C-s>` | Save + format (ALEFix) |
| `<Tab>` / `<S-Tab>` (insert, popup open) | Next/previous completion item |
| `<CR>` (insert, popup open) | Confirm completion |
| `<C-j>` / `<C-l>` | Expand snippet / jump to next placeholder |
| `<C-u>` | Expand Emmet abbreviation |
| `<C-y>` | Accept Copilot suggestion |
| `<leader>ff` | Find files (fzf) |
| `<leader>fg` | Find git files (fzf) |
| `<leader>fh` | File history (fzf) |
| `<leader>sb` | Search buffers (fzf) |
| `<leader>sc` | Search current buffer (fzf) |
| `<leader>e` | Toggle NERDTree |
| `<Tab>` / `<S-Tab>` (normal) | Next/previous buffer |
| `<leader>b` | List buffers |
| `<leader>x` | Close buffer |
| `<leader>t` / `<leader>tv` | Terminal (horizontal/vertical) |
| `<C-h/j/k/l>` | Navigate splits |
| `<leader>ev` / `<leader>sv` | Edit / source vimrc |
| `<leader>s` | Open Startify |
| `<leader>ct` | Copilot Toggle |
| `gcc` | Toggle comment the line |
| `>` / `<` | Indent keeping selection |
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `[g` / `]g` | Previous/next diagnostic |
| `K` | Show documentation |

---

## Options

General Vim settings organized in sections: indentation, display, backup, navigation, wildmenu, FzF. See the vimrc for details and customize to your needs.

Resources:
- [Vim Options List](https://vimhelp.org/quickref.txt.html#Q_op)
- [Vim Cheat Sheet](https://vim.rtorr.com)
- [Learn Vim](https://learnvim.irian.to)

---

## Transparency

Transparency is enabled by default. Toggle it:

- `<leader>tt` — toggle transparency on/off

To disable permanently, remove or comment out `let g:transparent_enabled = v:true` in the vimrc.

To adjust transparency levels, see `:help transparent`.

---

## Extending

It's just Vim. Add plugins to the `plug#begin()` block, add mappings in the MAPPINGS section, tweak options in the OPTIONS section. The vimrc is organized with folds (`{{{` / `}}}`) — use `<za>` to toggle.

---

Raccoon ASCII art by _ejm_ from [ascii.co.uk](https://ascii.co.uk/art/racoon)
