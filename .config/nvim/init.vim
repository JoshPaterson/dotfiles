call plug#begin("~/.local/share/nvim/plugged")
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
call plug#end()

nmap <C-n> :NERDTreeToggle<CR>
set number

" make tabs use 4 spaces
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set shiftround
set expandtab

