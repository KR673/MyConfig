"----------------------------------------------------------------------
" 初始化配置 

let use_vscode = exists('g:vscode')
let use_neovim = !use_vscode
let company = ($HOME =~ 'wys3640')
let g:iswindows = 0
let g:islinux = 0

" if company && use_neovim
"     let $http(s)_proxy = 'wys3640:3s?MS5r+@172.25.14.130:8080'
" endif

if(has("win32") || has("win64") || has("win95") || has("win16"))
	let g:iswindows = 1
else
	let g:islinux = 1
endif

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
if use_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.config/vscodeVim/autoload/plug.vim')
endif

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if use_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.config/vscodeVim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" Active plugins
" this needs to be here, so vim-plug knows we are declaring the plugins we want to use

if use_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.config/vscodeVim/plugged")
endif


if use_neovim
	Plug 'easymotion/vim-easymotion'
    Plug 'joshdick/onedark.vim'
    Plug 'iCyMind/NeoSolarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'terryma/vim-multiple-cursors'
	Plug 'mg979/vim-visual-multi'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
else
	Plug 'asvetliakov/'
endif

if iswindows
    Plug 'lyokha/vim-xkbswitch', {'as': 'xkbswitch'}
endif

Plug 'tpope/vim-surround'

call plug#end()

"----------------------------------------------------------------------
" 初始化配置 

set clipboard^=unnamed,unnamedplus
set smartcase
let mapleader=" "

if use_neovim
    " let g:airline_theme='onedark'
	set autoindent
	set cindent
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	" number + relativenumber 显示相对行号 + 绝对行号
	set number
	set relativenumber
	set cursorcolumn
	set cursorline
	syntax on
	colorscheme onedark
endif

"----------------------------------------------------------------------
" 按钮映射

map \ <Plug>(easymotion-prefix)
inoremap jk <ESC>
nmap <CR> o<ESC>
nnoremap <esc> :noh<return><esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

"----------------------------------------------------------------------
" 插件 --- xkbswitch
" 输入法切换 启动输入法切换
if iswindows
    let g:XkbSwitchEnabled = 1
    let g:XkbSwitchNLayout = 'US'

    if company 
        let g:XkbSwitchLib = 'E:\software\Neovim\bin\libxkbswitch64.dll'
    else
        let g:XkbSwitchLib = 'D:\software\Neovim\bin\libxkbswitch64.dll'
	endif
endif


"----------------------------------------------------------------------
" coc
if use_neovim
    if iswindows
        if company
            let g:coc_node_path = 'E:/software/nodejs/node'
        else
            let g:coc_node_path = 'D:/software/node.js/node'
        endif
    else
        let g:coc_node_path = '/usr/bin/node'
    endif

    let g:coc_global_extensions = ['coc-json', 'coc-vimlsp']
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
endif
