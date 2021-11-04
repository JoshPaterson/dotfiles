call plug#begin("~/.local/share/nvim/plugged")
    " Colors
    Plug 'srcery-colors/srcery-vim'

    " Better Settings
    Plug 'wincent/loupe'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'

    " Commands
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
        " Plug 'preservim/nerdcommenter'
        " Plug 'numToStr/Comment.nvim'
    Plug 'tpope/vim-unimpaired'

    " Text Objects
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-entire'
    Plug 'michaeljsmith/vim-indent-object'
    " Plug 'cim-textobj-python'
    " Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    " Plug 'vim-scripts/argtextobj.vim'
    " Plug 'hgiesel/vim-motion-sickness'
    " Plug 'kana/vim-textobj-fold'
    " Plug 'machakann/vim-textobj-functioncall'
    " Plug 'wellle/targets.vim'
    " Plug 'AndrewRadev/dsf.vim'

    " Features
    Plug 'vimwiki/vimwiki'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'metakirby5/codi.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'mbbill/undotree'
        " Plug 'gundo'
        " Plug 'mundo'
    Plug '907th/vim-auto-save'
    " vim-man for opening man pages in split
    " Plug 'justinmk/vim-sneak' to jump to 2 character pairs
    Plug 'tpope/vim-eunuch'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    " Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'onsails/lspkind-nvim'
    Plug 'ray-x/cmp-treesitter'
    Plug 'quangnguyen30192/cmp-nvim-tags'
    Plug 'lukas-reineke/cmp-under-comparator'
    Plug 'ray-x/lsp_signature.nvim'

    " Git Integration
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
    " Plug 'tommcdo/vim-fugitive-blame-ext'

    Plug 'vim-airline/vim-airline'
        " Plug 'nvim-lualine/lualine.nvim'
    " Plug 'airblade/vim-rooter'
    "
    " Web Development
    " Plug 'mattn/emmet-vim'
    " Plug 'alvan/vim-closetag'
    " Plug 'ap/vim-css-color'
    " Plug 'Glench/Vim-Jinja2-Syntax'
    "
    " Improve searching
    " Plug 'haya14busais.vim'
    " Plug 'haya14busa/vim-asterisk'
    " Plug 'osyo-manga/vim-anzu'
    "
    " Plug 'vim-devicons'
    " Plug 'coveragepy.vim'
    " Plug 'vim-unstack' " opens all levels of stack trace into splits
    " Plug 'vim-accordion' " makes all vertical splits 1 column wide except one
    " Plug 'narrwrgn' " moves part of file to new buffer for editing, then writes to original
    " Plug 'mfussenegger/nvim-lint'
    " Plug 'stefandtw/quickfix-reflector.vim'
    " Plug 'kshenoy/vim-signature' " show marks in gutter
    " Plug 'preservim/tagbar'
    " Plug 'wfxr/minimap.vim'
    " Plug 'szw/vim-maximizer'
    " Plug 'puremourning/vimspector'
    " Plug 'junegunn/vim-easy-align'
    " Plug 'junegunn/vim-peekaboo'
    " Plug 'vim-scripts/vim-auto-save'
    " Plug 'vim-scripts/ReplaceWithRegister'
    " Plug 'christoomey/vim-titlecase'
    " Plug 'christoomey/vim-system-copy'
    " Plug 'christoomey/vim-sort-motion'
    " Plug 'svermeulen/vim-easyclip'
    " Plug 'plasticboy/vim-markdown'
    " Plug 'kana/vim-fakeclip'
    " Plug 'kana/vim-operator-user'
    " Plug 'kana/vim-arpeggio'
    " Plug 'dhruvasagar/vim-table-mode'
    " Plug 'Machakann/vim-highlightedyank'
    " Plug 'wincent/scalpel'
    " Plug 'gyim/vim-boxdraw'
    " Plug 'dstein64/vim-startuptime'
    " Plug 'vim-test/vim-test'
    " Plug 'onsails/diaglist.nvim'
    " Plug 'tpope/vim-speeddating'
    " Plug 'godlygeek/tabular'
    "
    " Toggle booleans
    " Plug 'AndrewRadev/switch.vim' also toggles true/false, others
    " Plug 'sagarrakshe/toggle-bool'
    " Plug 'zef/vim-cycle'
    " vim.org/scripts/script.php?script_id=895
    call plug#end()


" ----------------------------------
" config for nvim-cmp
" ----------------------------------
set completeopt=menu,menuone,noinsert,noselect
lua <<EOF
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-q>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },
    sources = {
      { name = 'ultisnips' },
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 3},
      { name = 'treesitter' },
      { name = 'tags' },
      -- { name = 'nvim_lua' },
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "BUFF",
          nvim_lsp = "LSP",
          nvim_lua = "API",
          path = "PATH",
          ultisnips = "SNIP",
          treesitter = "TREE",
          tags = "TAGS",
        },
      },
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    experimental = {
        native_menu = false,
    },
  })

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig').pyright.setup {
    capabilities = capabilities
  }

  require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "none",
      hint_prefix = "",
    }
  })

EOF

let g:UltiSnipsJumpForwardTrigger = '<C-l>'
let g:UltiSnipsJumpBackwardTrigger = '<C-h>'

" ----------------------------------
" I think this is necessary for ultisnips
" ----------------------------------
let g:python3_host_prog="$HOME/.pyenv/versions/nvim/bin/python"


" ----------------------------------
" fzf configuration
" ----------------------------------
command! -bang ProjectFiles call fzf#vim#files('~/projects', fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)


" ----------------------------------
nnoremap <Leader><Space> :s/\s\+$//e<CR>
nnoremap <Leader>s :w<CR>:Startify<CR>
nnoremap <Leader>c :Codi!!<CR>
nnoremap Y y$

" Git mappings
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gpo :Git push origin main<CR>
nnoremap gb :GBrowse<CR>
xnoremap gb :GBrowse<CR>
nnoremap <Leader>u :UndotreeToggle<CR>

set path+=**
set wildmode=longest:full,full
set updatetime=500

set pyxversion=3

" this stops lines in keybindings.txt that start with "vim: " from being
" interpreted as commands
set nomodeline

set formatprg=par

let g:auto_save = 1  " enable AutoSave on Vim startup

" ----------------------------------
"  startify
" ----------------------------------
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_bookmarks = [
    \ { 'v': '$HOME/.config/nvim/init.vim' },
    \ { 'b': '$HOME/.bashrc' },
    \ { 'bp': '$HOME/.bash_profile' },
    \ { 'kb': '$HOME/.config/rofi/keybindings.txt' },
    \ { 'r': '$HOME/.config/rofi/config.rasi' },
    \ { 'wm': '$HOME/.config/qtile/config.py' },
    \ { 'ki': '$HOME/.config/kitty/kitty.conf' },
    \ { 's': '$HOME/.config/starship.toml' },
    \ { 'ra': '$HOME/.config/ranger/rc.conf' },
    \ { 'ri': '$HOME/.config/ranger/rifle.conf' },
    \ { 'z': '$HOME/.config/zathura/zathurarc' },
    \ ]
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = []
let g:startify_lists = [
    \ { 'header': ['   Recent Files'],            'type': 'files' },
    \ { 'header': ['   Current Directory '. getcwd()], 'type': 'dir' },
    \ { 'header': ['   Sessions'],       'type': 'sessions' },
    \ { 'header': ['   Bookmarks'],        'type': 'bookmarks' },
    \ ]


:color srcery


" highlight trailing whitespaces and spaces before tabs
highlight link sensibleWhitespaceError Error
autocmd Syntax * syntax match sensibleWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL


" set undo directory for persistent undo history
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0


" make line numbers automatically toggle between relative and absolute
" https://jeffkreeftmeijer.com/vim-number/
set number
:augroup numbertoggle
  :autocmd!
  :autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  :autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Map keys to move lines or groups of lines up and down with <A-j> and <A-k>
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap - :m .+1<CR>==
nnoremap _ :m .-2<CR>==
vnoremap - :m '>+1<CR>gv=gv
vnoremap _ :m '<-2<CR>gv=gv


" make tabs use 4 spaces
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set shiftround
set expandtab

