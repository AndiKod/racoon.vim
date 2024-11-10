                    ,,,
                 .'    `/\_/\
               .'       <@I@>
    <((((((((((  )____(  \./
               \( \(   \(\(
                `-"`-"  " "

    Your new coding pet ^^

# Rac@@n.Vim, playful little VimStarter

![RacoonVim](https://github.com/user-attachments/assets/4d787fd5-c91d-418b-9a15-49dfaf0220e0)


This minimal vimrc file will auto-configure Vim with defaults features we would expect when editing code. Out of the box is intended for WebDev, and it's minimal on purpose as it's just a starting point. Make your own Rac@@n pet.

Some goals for a WebDev kickstart:

- Ease of installation
- Handful of meaningful keybinds
- Simple plugins management
- Browse/Manage local files
- Jump to specific files & more
- Visualise opened buffers & cycle
- Highlight webDev files + bonus
- Format on save with Prettier
- Live lint/hint js, css, ...
- Autocomplete, Snippets, Emmet
- Tabnine AI suggestions
- Easy to run parallel shell
- Nice looking default theme
- Extendable to fit new needs

## One file, hands-free simple Install

1. Backup/Rename existing .vimrc and things inside .vim folder
2. Copy the `vimrc` file inside `~/.vim` folder
3. Open Vim.

VimPlug will install itself inside `.vim/autoload`, then procede to install the main plugins in `.vim/plugged` including coc.nvim, then CoC will install a first round of extensions/tools/lsp:

```vim
" Auto install first extentions
let g:coc_global_extensions = [ 'coc-vimlsp', 'coc-tabnine', 'coc-snippets', 'coc-prettier', 'coc-pairs', 'coc-html', 'coc-eslint', 'coc-emmet', 'coc-tsserver', 'coc-json', 'coc-css', '@yaegassy/coc-tailwindcss3' ]
```

You're ready to roll with snippets, auto completion, auto formating, AI assistant, live checking for errors, ...as a starting point. Play around, make it your own Rac@@n.

The installed plugins and config files are in `~/.vim` and `~/.config/coc/`.

### &:Options

General settings with sub-sections like: ::display, ::indentation, etc. See the ressources, examples and docs so you could tweek your own options if needed.

- [Options List](https://vimhelp.org/quickref.txt.html#Q_op) : From the online :help
- [FreeCodeCamp Article](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/) : Vimrc basics
- Some examples from Github for inspiration:
- [amix/vimrcs](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim) : The basic version explained
- [19 more :)](https://github.com/search?q=vimrc%20options&type=Everything&repo=&langOverride=&start_value=1)

Just in case, for reminder, some general Vim Cheat-Sheet

- [Vim - devhints.io](https://devhints.io/vim)
- [Vim - QuickRef.me](https://quickref.me/vim.html)
- [Vim - Rtorr.com](https://vim.rtorr.com)
- [LearnVim.irian.to](https://learnvim.irian.to) ...an excellent read.

...on devhints and quickref, the other lists around Linux commands are also gems.

### &:Plugins

Managing plugins with [VimPlug](http://vimplug.com) is as simple as that:

```vim
call plug#begin()

" List your plugins here
Plug 'tpope/vim-commentary'

call plug#end()
```

`:Plug` commands will help managing plugings, with commands such as _:PlugInstall_, _:PlugUpdate_, _:PlugClean_, & so on.

Here are the included, self installing plugings:

- _[Catppuccin](https://github.com/catppuccin/vim)_ : delicious colorschemes
- _[BuffTabline](https://github.com/ap/vim-buftabline)_ : visual tabs for opened buffers
- _[Vim-Airline](https://github.com/vim-airline/vim-airline)_ : versatile status bar
- _[FzF](https://github.com/junegunn/fzf.vim)_ : fuzzy finder multi-purpose search
- _[NerdTree](https://github.com/preservim/nerdtree)_ : files explorer
- _[DevIcons](https://github.com/ryanoasis/vim-devicons)_ : Need a NerdFont
- _[Files CRUD](https://github.com/PhilRunninger/nerdtree-visual-selection)_ : Files operations from inside NerdTree
- _[Startify](https://github.com/mhinz/vim-startify/blob/master/doc/startify.txt)_ : custom[isable] starting page
- _[CocNvim](https://github.com/neoclide/coc.nvim)_ : all you need for LSP & co, via [extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)
- _[Comentary](https://github.com/tpope/vim-commentary)_ : easy comments with `<gcc>`
- _[Fugitive](https://github.com/tpope/vim-fugitive)_ : bringing `:Git` commands inside Vim
- _[Surround](https://github.com/tpope/vim-surround)_ : amazing tool to get around things
- _[CSS Colors](https://github.com/ap/vim-css-colors)_ : colors preview inside css files
- _[Vim-Transparent](https://github.com/tribela/vim-transparent)_ : making themes background transparent

For things specific to a language or more, I let [Conquer of Completion](https://github.com/neoclide/coq.nvim) doing the heavy lifting, while keeping the config simple and clean. Commands starting with `:Coc` will do a lot, with installing functionalities, using custom commands and acessing the general `:CocConfig` file.

There are a lot of supported languages and tools, you can add whatever you need from the list. See [the coc-extentions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions). Others can be found directly on NPM.

Most of times, the defaults are good enough out of the box. The eventual customisations are well documented on each extention README, while Rac@@n will expand suggestions with `<tab>` and navigate the lists with `<c-n>`/`<c-p>` for next or previous suggestion.

### &:Mappings

Here are some simple daily commands, among others:

`<Esc>` : Escape
`<C-s>` : Control + `s`
`<Leader>e` : The leader key (space in Rac@@n) + `e`

| Binding      |                    Action                     |
| ------------ | :-------------------------------------------: |
| `jj`         |         The other `<Esc>` or `<C-c>`          |
| `<C-s>`      |       Save the current buffer & Format        |
| `<leader>e`  |     Toggle the files Explorer [NerdTree]      |
| `m`          |    Open the files manager inside NerdTree     |
| `<leader>ff` |      Find files inside the project [FzF]      |
| `<leader>sc` |      Search lines in the Current buffer       |
| `<c-l>`      |    Navigate splits. (or any of h,j,k or l)    |
| `<tab>`      | Go to next opened buffer. Expand/Autocomplete |
| `<leader>x`  |       Close (delete) the current buffer       |
| ---          |                 Some more ...                 |
| `>` or `<`   |    Indent the line, and keep the selection    |
| `gcc`        |        Toggle comments [vim-Comentary]        |
| `<leader>ev` |     Edit .vimrc or .vim/vimrc as $MYVIMRC     |
| `<F12>`      |   Source the $MYVIMRC file to apply changes   |
| `<leader>fh` |       Search within the :History [FzF]        |
| `<Esc>`      |      Will remove the highlighted search       |
| `<leader>cx` |       List the installed coc-extensions       |

To see the rest or add yours, head to the vimrc ;) and plugins/extentions docs.

Obviously there are more of them ^^ and you can add yours.

---

#### :Verbose

You already know the esential parts, yet, here's some more :)

### Manage local files from within NERDTree

Once inside the NerdTree pane, pressing `m` will open a second menu assisting with Create / Rename / Move / Delete files. Follow the menu instructions.

e.g: To create "./src/pages/about.md" place the cursor inside NerdTree, press `m` to "modify" something then `a` to "add" a file or/and folder. At the bottom of the screen you will see the prompt where you can write the full path from where you are. The intermediate folders will be created if non-existant.

#### Autocompletion and Snippets

Comming from [coc-snippets](https://github.com/neoclide/coc-snippets), other coc-extensions and plugins, quite some snippets are actives and `<tab>` will expand them, while `<c-p>` or `<c-n>` will move on the previous or next suggestion.

Say you want to add a custom snippet for .md files. From an actual markdown file, enter the command `:CocCommand snippets.editSnippets`. This will open the file `~/.config/coc/ultisnips/markdown.snippets` with an example inside to get you started.

### Easy to run parallel shell

On a personnal level, [WezTerm](https://wezfurlong.org/wezterm/index.html) is the recomanded terminal, with [this setup](https://github.com/dragonlobster/wezterm-config/blob/main/wezterm.lua) via a simple lua file, making it beautiful and Tmux-like without complications. [Short video demo](https://www.youtube.com/watch?v=V1X4WQTaxrc)

[Tmux](https://www.youtube.com/watch?v=U41BTVZLKB0) can also be an option, witch don't exclude Wez. Both work great together.

#### Great looking theme:

Nobody needs 85 random colorschemes "out of the box", whatever the level of ChadNess. Rac@@n comes with the excellent Catppuccin flavors.

To test out existing colorsschemes, use the `:Colors` command and cycle trough them for a preview. You can for sure install your favorite colorsheme plugin you like.

#### Extendable to fit new needs

At the end of the day, it's just Vim. [It can do anything](https://learnvim.irian.to) but the coffee.

---

Joe is comming from here https://ascii.co.uk/art/racoon signed by _ejm_
