" Install vim-plug with:
" $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Make sure a Nerd-compatible patched font is installed: https://www.nerdfonts.com/
" Go to https://github.com/ryanoasis/nerd-fonts/releases and click on 'show all assets'
" I prefer Hack, here is the link for the latest release at the time of this writing:
"       https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Hack.zip
" On non-Windows operating system, delete all of the Windows-compatible fonts.
" Make sure the monospace font set by the OS is configured to use the patched font above.
" On Linux, make sure ~/.local/share/fonts has the patched font or is linked to a
" folder containing the patched font.


call plug#begin(stdpath('data') . '/plugged')
Plug 'liuchengxu/space-vim-theme'
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.17.0' }
Plug 'simnalamburt/vim-mundo'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'zah/nim.vim'
Plug 'constructingcode/vim-timestampedbackups'
call plug#end()


" Personal settings
set nocompatible
set showmatch
set encoding=utf-8
set mouse=a
set number
set wrap linebreak
set virtualedit=block
set display+=lastline
set scrolloff=3
filetype indent off
set autoindent
set ignorecase
set smartcase
set formatoptions+=ro
set hlsearch incsearch
set hidden " Allows switching between buffers without saving
set autochdir
set path+=** " Allow for fuzzy file searching of subdirectories
set wildmode=longest,full " For command line tab completion
set wildmenu
set clipboard=unnamedplus " Use system clipboard as the default
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
syntax on
set list listchars=tab:\│\ ,trail:·,nbsp:⎵
set diffopt+=vertical
set splitbelow
set splitright
set nobackup " Prefer TimestampedBackups instead


" Read/write undofile in relative undodir
set undodir=.history
au BufReadPost * call ReadUndo()
au BufWritePost * call WriteUndo()
func! ReadUndo()
  let undofile_path = expand('%:h') . '/' . &undodir . '/' . expand('%:t') . '.undo'
  if filereadable(undofile_path)
    execute 'silent rundo ' . undofile_path
  endif
endfunc
func! WriteUndo()
  let dirname = expand('%:h') . '/' . &undodir
  if !isdirectory(dirname)
    call mkdir(dirname)
  endif
  execute 'silent wundo ' . dirname . '/' . expand('%:t') . '.undo'
endfunc


" Netrw
let g:netrw_liststyle = 3
let g:netrw_keepdir = 0


" Shortcuts
let mapleader=" "
let maplocalleader=" "
nmap \ <Space>
vmap \ <Space>
" 	Allow \ to be used as the leader key in recursive key maps and :g commands


" Theme settings
set cursorline
set background=dark
hi Comment cterm=italic
set termguicolors
colorscheme space_vim_theme
nnoremap <leader>c :set background=light<CR>
nnoremap <leader>C :set background=dark<CR>


" Toggle relative line numbers with focus
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
"   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
" augroup END


" Indentation
nnoremap <leader>i4 :set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>:retab<CR>
"	Change tabs to 4 space indents
nnoremap <leader>i2 :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>:retab<CR>
"	Change tabs to 2 space indents
nnoremap <leader>I4 :set noet ts=4 sts=4 sw=4<CR>:%retab!<CR>:set ts=8 sts=8 sw=8<CR>
"	Change 4 space indents to tabs
nnoremap <leader>I2 :set noet ts=2 sts=2 sw=2<CR>:%retab!<CR>:set ts=8 sts=8 sw=8<CR>
"	Change 2 space indents to tabs
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2


" Movement shortcuts
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
noremap <C-Down> }
noremap <C-Up> {
" 	Use CTRL + arrow keys to jump to/across whitespace in any direction


" Split window navigation shortcuts
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <leader>r <C-w><C-r>


" Split window resizing shortcuts
nnoremap <S-Down> <C-w>-
nnoremap <S-Up> <C-w>+
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>


" Buffer and tab shortcuts
nnoremap <leader><leader> :b#<CR>
nnoremap \\ :b#<CR>
nnoremap <leader>b :ls<CR>:buffer 
nnoremap <leader>B :ls<CR>:tab sb 
nnoremap <leader>D :bn<CR>:bd#<CR>
" 	The above keymap will delete the current buffer and switch to
" 	next buffer without losing current window split (may close other
" 	splits if multiple splits are pointing to the same buffer)
nnoremap <leader>v <C-w><C-v>:bn<CR>
nnoremap <leader>s <C-w><C-s>:bn<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>N :tab sbn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>P :tab sbp<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>
nnoremap <leader>f :e<Space>.<CR>


" Autocompletion shortcuts
inoremap <C-f> <C-x><C-f>
" 	Files
inoremap <C-d> <C-x><C-d>
" 	Definitions/macros
inoremap <C-l> <C-x><C-l>
" 	Lines


" Searching shortcuts
vnoremap <leader>/ y/\<<C-r>"\><CR>
vnoremap <leader>? y?\<<C-r>"\><CR>
nnoremap <leader>h :noh<CR>


" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>


" Undo/redo tree visualization
nnoremap <leader>u :MundoToggle<CR>


" TODO list shortcuts
nnoremap <Leader>d i<C-r>=strftime('%F %a %T')<CR>
nnoremap <Leader>t o[_] 
nnoremap <Leader>T O[_] 
nmap <Leader>x V/\%V\[_\]<CR><Esc>lrxA []<Esc>\d<Esc>0fx\h
nmap <Leader>X \xddGp<C-o>
inoremap <C-j> <Esc>o[_] 
vmap <Leader>t :g!/\[_\] /normal I[_] <CR>\h
vmap <Leader>x :g/\[_\] /normal \x<CR>\h
vmap <Leader>X :g/\[_\] /normal \xddGp<CR><C-o>\h


" For Nim plugin
func! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf


" Jump to tag
nn <M-g> :call JumpToDef()<CR>
ino <M-g> <Esc>:call JumpToDef()<CR>i


lua << END
require('lualine').setup { -- Use default config with small customizations
  sections = {
    lualine_c = {{'filename', path=2}}, -- 0 = just filename, 1 = relative path, 2 = absolute path
  },
  inactive_sections = {
    lualine_c = {{'filename', path=2}},
  },
  options = {
    theme = 'dracula'
  }
}
END
