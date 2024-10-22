# My little .vimrc

Exploring "good ol'Vim" for modern webDev 

*Long story short...*

Coding since the early 90', went trough all the popular and less popular editors for webDev, and obviously tried to get into Vim. Got at some point annoyed by the "vim vs neovim" reddit style disputes and went back to the evil VSCode with Vim keybinds. I know, it's heresy level.

Lastly got tempted, installed NVChad just to see. It felt good to be fully back in the terminal but the whole setup felt also bloated and over-engineered. Sacrificing simplicity for the sake of questionable convenience is not always great.

So :)

For the experiment, I got myself [Vim9.1](https://www.vim.org/download.php) and threw at it a basic .vimrc—less than 140 lines—with just enough tools to get things done as I would with something like NVChad or even TJ's Kickstarter, without complications. 

Far from perfect or finished, saving it here as a reference along the journey.

---

The hole thing is structured in three sections:

## " --- &:OPTIONS ---

In this section we are setting the basic stuff like the spaces per tab, line numbers, etc. Sill some of them to add, but it's already functional.

## " --- &:PLUGINS ---

To stick with the KISS idea, it's [VimPlug](https://junegunn.github.io/vim-plug/) and a few needed packages.

### [BuffTabline](https://github.com/ap/vim-buftabline)

Each opened buffer have it's own visual tab, `<tab>` key cycle through them, and `<leader>x` close the active buffer if the modifications are saved.

### [FzF FuzzyFinder](https://github.com/junegunn/fzf)

The swiss knife when it comes to find/open/searchInside files in the project or more. It finds files, search within the content, history, ++. On my machine I did installed the binary globally. 

Normally it's all you need for files browsing and content exploration. `<leader>ff` will "FindFiles", `<leader>sc` do "Search inside Current" buffer, etc.

### [NerdTree](https://github.com/preservim/nerdtree)

Not really needed as files browser, but have a files manager attached to it, allowing files CRUD operations. `<leader>e` toggle the sidebar, and pressing `m` will open a menu with the options like add/rename/../delete files or folders.

## [ForestNight Colorscheme](https://github.com/termlimit/vim-color-forest-night)

With the possibility to switch between light or dark version from the vimrc, out of the box a nice and pleasant colorscheme. Don't need dozens of colorschemes, and you can easily install a new one from [VimAwesome](https://vimawesome.com/?q=tag:colorscheme) by example.

### [COC-NVim](https://github.com/neoclide/coc.nvim) Toolbox

This will let you install all you need, LSP's, Snippets, TabNine AI completions, Linting, and more from the [hsupported extensions list](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions). Just go :CocInstall coc-tsserver coc-css coc-tailwindcss ...and it's mostly done by default. 

`<C-n>` or `<C-p>` are used to cycle trough the suggestions, and `<tab>` selecting your favourite. This and other options like `k` hovering something that will give information about.

### ...the rest

Didn't even added a fancy AirLine tool for the moment, but VimAutopairs and thinking about other utilities.

## " --- &:MAPPINGS (general, and plugin-specific) ---

The default leader key is here set to the `<space>` bar.

`<leader>rc` will open .vimrc at any moment to access the settings. 
From here if your file gets big, `<leader>sc` will open the FzF window to search for patterns in the current buffer. Searching for `&:` will list all sections, but can be a package name, a setting value like colorscheme, whatever.

`<C-s>` it really does "CtrS" and save the current buffer modifications, before dropping us in normal mode wherever we came from (N or I).

The custom `<Esc>` or `<C-c>` is actually set to `jj` but can of course be modified to whatever else. We won't start the "jj vs jk" debate. Use what you like ;)

For the Emmet tool installed via *:CocInstall coc-emmet* the codes are expanded with `<C-y>` and the navigation is done by the classic `<C-n>` and `<C-p>`.

When it comes to "Embedded or Floating Terminal", I mean, we already are in a Terminal. Just `<C-z>` and you're back in the shell to do whatever, `<fg>` get you back. Eventually open a new terminal tab if available, or simply *:! shell commands* for little things. 

`C + j,k,h ou l` will navigate between splits. Other binds will be added later.

----- Et Voilà -----

It's more or less a starting point and this repo will be updated along the way as I'll try to keep "my little vimrc" up to date.

Feel free to experiment around, and happy Vimming ;)
