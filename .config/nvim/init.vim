call plug#begin("~/.local/share/nvim/plugged")
    " Colors
    Plug 'srcery-colors/srcery-vim'

    " Better Settings
    Plug 'wincent/loupe'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'

    " Change vim behavior
    Plug 'airblade/vim-rooter'

    " Operators
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
        " Plug 'preservim/nerdcommenter'
        " Plug 'numToStr/Comment.nvim'
    Plug 'tpope/vim-unimpaired'
    Plug 'AndrewRadev/switch.vim'
    " Plug 'christoomey/vim-titlecase'
    " Plug 'christoomey/vim-sort-motion'
    " Plug 'tpope/vim-speeddating'
    " Plug 'justinmk/vim-sneak' to jump to 2 character pairs
    " Plug 'kana/vim-operator-user'

    " Commands
    Plug 'tpope/vim-eunuch'
    Plug 'dstein64/vim-startuptime'
    " Plug 'vim-utils/vim-man'

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
    Plug 'metakirby5/codi.vim'
    Plug 'mbbill/undotree'
        " Plug 'gundo'
        " Plug 'mundo'
    " Plug 'preservim/tagbar'
    " Plug 'stefandtw/quickfix-reflector.vim'
    " Plug 'wfxr/minimap.vim'
    " Plug 'narrwrgn' moves part of file to new buffer for editing, then writes to original

    " Highlighting and text display
    Plug 'Yggdroot/indentLine'
    " Plug 'vim-utils/vim-troll-stopper'

    " Add visuals for builtin vim behavior
    Plug 'kshenoy/vim-signature'
    Plug 'junegunn/vim-peekaboo'

    " Fuzzy finding
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

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

    " Statusline
    Plug 'vim-airline/vim-airline'
        " Plug 'nvim-lualine/lualine.nvim'

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
    " Window Arrangement
    " Plug 'szw/vim-maximizer'
    " Plug 'vim-accordion' makes all vertical splits 1 column wide except one
    "
    " Testing/ Debugging
    " Plug 'coveragepy.vim'
    " Plug 'puremourning/vimspector'
    " Plug 'vim-unstack' opens all levels of stack trace into splits
    " Plug 'vim-test/vim-test'
    "
    " Clipboard
    " Plug 'vim-scripts/ReplaceWithRegister'
    " Plug 'christoomey/vim-system-copy'
    " Plug 'svermeulen/vim-easyclip'
    " Plug 'kana/vim-fakeclip'
    "
    " Tables and text alignment
    " Plug 'godlygeek/tabular'
    " Plug 'junegunn/vim-easy-align'
    " Plug 'dhruvasagar/vim-table-mode'
    " Plug 'gyim/vim-boxdraw'
    "
    " Linting
    " Plug 'onsails/diaglist.nvim' puts diagnosis info in quickfix and location lists
    " Plug 'mfussenegger/nvim-lint'
    "
    " Plug 'plasticboy/vim-markdown'
    " Plug 'wincent/scalpel' helps make substitution for current word
    "
    " Should be last plugin loaded:
    Plug 'ryanoasis/vim-devicons'
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


let g:python3_host_prog="$HOME/.pyenv/versions/nvim/bin/python"


" highlight yanked text, see :h lua-highlight
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}


" ----------------------------------
" fzf configuration
" ----------------------------------
command! -bang ProjectFiles call fzf#vim#files('~/projects', fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)


" ----------------------------------
command Reload :w|:so %|:PlugInstall
nnoremap <Leader><Space> :s/\s\+$//e<CR>
nnoremap <Leader>s :w<CR>:Startify<CR>
nnoremap <Leader>c :Codi!!<CR>
nnoremap Y y$

" Git mappings
nnoremap <Leader>gs :wall <bar> :Git<CR>
nnoremap <Leader>gpo :Git push origin main<CR>
nnoremap <Leader>gb :Git blame<CR>
xnoremap <Leader>gb :Git blame<CR>
nnoremap gb :GBrowse<CR>
xnoremap gb :GBrowse<CR>
nnoremap <Leader>gv :GV<CR>

nnoremap <Leader>u :UndotreeToggle<CR>

" Switch config
nnoremap <Leader>t :Switch<CR>
let g:switch_custom_definitions =
    \ [
    \   ['next', 'previous']
    \ ]


set path+=**
set wildmode=longest:full,full
set updatetime=400

set pyxversion=3

" this stops lines in keybindings.txt that start with "vim: " from being
" interpreted as commands
set nomodeline

set formatprg=par


" ----------------------------------
" vim-rooter
" ----------------------------------
let g:rooter_patterns = ['.git', '.gitignore', '.python-version', 'requirements.txt']

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


" ----------------------------------
" set autosave and persistent undo
" some people also set undolevels, undoreload
" ----------------------------------
set nohidden
set autowriteall

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


" ----------------------------------
" vimwiki
" ----------------------------------
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


" -------------------------------
"  peekaboo
" -------------------------------
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:peekaboo_window="call CreateCenteredFloatingWindow()"
