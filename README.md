
# myVIMRC for WebDev & more

Long story short. Tried some starter setups for NeoVim like [NVChad](https://nvchad.com), and it felt both great and unnecessary bloatted. Spending more time on configuration than coding, or ending up with a heavy setup ..."just in case".

So I grabbed [Vim9 from here](https://www.vim.org/download.php), threw at it a little vimrc, few plugins and bindings. At first wanted to see what can be done, but went well. It's an ongoing experiment now that covers the basics so far, almost on default settings.

---/---

What was I looking for as a minimal viable editor, mostly WebDev:

- Ease of installation
- Handful of logical keybinds
- Simple plugins management
- Browse/Manage local files
- Jump to specific files & more
- Visualise opened buffers & cycle
- Highlight webDev files + bonus
- Format on save with Prettier
- Live lint/hint ts, css, ...
- Autocompletion and Snippets
- Tabnine AI suggestions
- Easy to run parallel shell
- Decent looking theme
- Extendable to fit new needs

-- ~ --

## Ease of installation

One simple `.vimrc` file. Open Vim, hit `:PlugInstall` and it's mostly done.

Existing .vimrc file and things inside .vim folder should be saved aside, as the plugins will install themselves inside `~/.vim` folder.

## Handful of logical keybinds

Everything is documented in the vimrc, <br/>
**" --- &:MAPPINGS ---** section.

My muscle memory makes me hit "CtrS" to save a file, so I kept it that way.`<c-s>` will save the current buffer from either Normal or Insert mode, and end up in Normal mode anyway all while formatting the file with Prettier if needed.

With the `<leader>` key set as `<space>`, there are some convenient keybinds for the basic actions like toggling the files explorer or the fuzzy finder, closing the current buffer, opening the vimrc to change some setups, etc.

## Simple plugins management

Went for the simplest and well documented [VimPlug](https://vimplug.com).<br/>
If not installed, it will install itself.

```vim
" --- &:PLUGINS ---

call plug#begin()

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ap/vim-buftabline'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'sainnhe/vim-color-forest-night'
  Plug 'ap/vim-css-color'

call plug#end()
```

From here, `:Plug` commands will help managing plugings, with things like _:PlugInstall_, _:PlugUpdate_, _:PlugClean_, etc.

For things specific to a language like LSP's, Snippets, etc, I let [Conquer of Completion](https://github.com/neoclide/coq.nvim) doing the heavy lifting, while keeping the config simple and clean. Commands starting with `:Coc` will do a lot, with installing functionalities, listing others and acessing the `:CocConfig` file.

Basic webDev setup would look like `:CocInstall coc-html coc-emmet coc-css coc-tsserver coc-snippets coc-prettier coc-eslint coc-tabnine` plus others like tailwind, unocss, astro, svelte, etc, or things for php, python or more. See [the documentation](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions).

## Browse/Manage local files

`<leader>e` Toggles the Files[E]xplorer by [NerdTree](https://github.com/preservim/nerdtree) to open or manage files.

Once in the menu, hitting `m` will open a second menu assisting with Create / Rename / Move / Delete files. Yet, for opening files, FzF is a better tool.

## Jump to specific files & more

- `<leader>ff` [F]ind[F]iles with [FzF](https://github.com/junegunn/fzf.vim) FuzzyFinder inside the current project folder. FzF does a lot of other intersting things, not yet assigned to a keybind.

- `<leader>sc` Will act as a super CtrF and [s]earch inside the [c]urrent buffer.
- `<leader>ev` This will let you [e]dit the [v]imrc.

With `<leader>sc` search then for the `&:` pattern for direct links to main sections, `::` for topic sections like `" ::NerdTree ---`, or whatever keyword like `colorscheme`. Scrolling or using Vim's search way works too, of course :) Once done, `<c-s>` to save and `:so` to source and applly the changes.

## Visualise opened buffers & cycle

The [vim-buftabline](https://github.com/ap/vim-buftabline) pluging does just that. Opened buffers will be visually listed at the top of the screen as tabs-like things. The `<tab>` key will display the next one _(shift+tab the previous)_ and the custom bind `<leader>x` will close the buffer.

## Highlight webDev files + bonus

Syntax highlight will come from whatever is installed via specific coc-extensions or regular plugins. Most of time out of the box.

## Format on save with Prettier

The html, css, js/ts, formating is bound to `CtrS`. It will format and save the file. At any other moment, the `:Prettier` command is available. See [coc-prettier](https://github.com/neoclide/coc-prettier)

## Live lint/hint ts, css, ...

Just try some weird things, save, and TSServer or other might complain, with hints on what's wrong. In other contexts, hovering elements will give infos, plus the classic "gd for GoToDefinition" etc.

## Autocompletion and Snippets

Comming from [coc-snippets](https://github.com/neoclide/coc-snippets), other coc-extensions and plugins, quite some snippets are actives and `<tab>` will expand them, while `<c-p>` or `<c-n>` will move on the previous or next suggestion.

It's also easy to add our own snippets, or use some of those written for VSCode.Actually looking into that part, to bring it in next.

## Tabnine AI suggestions

Once `:CocInstall coc-tabnine` it simply works, and bring in [the good stuff](https://www.tabnine.com/best-in-class-ai-code-generation/). I bet Vim is also "supported" now :)

## Easy to run parallel shell

After some tests, even if your emulator have tabs, [Tmux](https://www.youtube.com/watch?v=U41BTVZLKB0) is a way better, and simple option. Saving running setups of terminal sessions with running dev servers without having to restart them is priceless ...and actually free.

## Decent looking theme

Nobody needs 85 random colorschemes "out of the box". This setup comes with a clean theme—[ForestNight](https://github.com/termlimit/vim-color-forest-night)—in dark or light variants, yet [VimAwesome](https://vimawesome.com/?q=tag:color-scheme) is full of others. Easy enough to just add a colorscheme pluging and change the name in .vimrc

## Extendable to fit new needs

At the end of the day, it's just Vim. [It can do anything](https://learnvim.irian.to) but the coffee.

