" Install vim-plug with:
" $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Make sure a Nerd-compatible patched font is installed: https://www.nerdfonts.com/
" Here is the link for Hack: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
" On non-Windows operating system, delete all of the Windows-compatible fonts.
" Make sure the monospace font set by the OS is configured to use the patched font above.
" On Linux, make sure ~/.local/share/fonts has the patched font or is linked to a
" folder containing the patched font.

" TODO Write a vim function that will create timestamped backups on write (not
" automatically) but delete ones beyond a quantity of 5 or some other number.


call plug#begin(stdpath('data') . '/plugged')
Plug 'navarasu/onedark.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'simnalamburt/vim-mundo'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
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
set formatoptions+=r
set hlsearch incsearch
set hidden " Allows switching between buffers without saving
set autochdir
set path+=** " Allow for fuzzy file searching of subdirectories
set wildmode=longest,list,full " Command mode tab completion operations
set wildmenu " Full tab completion options displayed on status line
set clipboard=unnamedplus " Use system clipboard as the default
syntax on
set background=dark
set termguicolors
hi Comment cterm=italic
set nobackup " Prefer TimestampedBackups instead
set undofile
set undodir=.
set list listchars=tab:\│\ ,trail:·,nbsp:⎵
set splitbelow
set splitright

" Netrw
let g:netrw_liststyle=3
let g:netrw_keepdir = 0

" Shortcuts
let mapleader=" "
let maplocalleader=" "
" Allow \ to be used as the leader key in recursive key maps and :g commands
nmap \ <Space>
vmap \ <Space>

" Movement shortcuts
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
" Use CTRL + arrow keys to jump to/across whitespace in any direction
noremap <C-Down> }
noremap <C-Up> {

" Split window navigation shortcuts
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Split window resizing shortcuts
nnoremap <S-Down> <C-w>-
nnoremap <S-Up> <C-w>+
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>

" Buffer shortcuts
nnoremap <leader><leader> :b#<CR>
nnoremap \\ :b#<CR>
nnoremap <leader>b :ls<CR>:buffer 
" Delete current buffer and switch to previous buffer without losing window split
nnoremap <leader>D :b#<CR>:bd#<CR>
nnoremap <leader>v <C-w><C-v>:bn<CR>
nnoremap <leader>s <C-w><C-s>:bn<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>
nnoremap <leader>f :e<Space>.<CR>

" Undo/redo tree visualization
nnoremap <leader>u :MundoToggle<CR>
" Turn off search highlighting
nnoremap <leader>h :noh<CR>
" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>

" TODO list shortcuts
nnoremap <Leader>t o- [ ] 
nnoremap <Leader>T O- [ ] 
nnoremap <Leader>x 0f[lrxA [<C-r>=strftime('%F %a %T')<CR>]<Esc>
nmap <Leader>X \xddGp<C-o>
inoremap <C-j> <Esc>o- [ ] 
vnoremap <Leader>t :g!/- \[ \] /normal I- [ ] <CR>:noh<CR>
vmap <Leader>x :g/- \[ \] /normal \x<CR>:noh<CR>
vmap <Leader>X :g/- \[ \] /normal \xddGp<CR><C-o>:noh<CR>

" Autocompletion shortcuts
" ^F = files
" ^D = definitions / macros
" ^L = lines
inoremap <C-f> <C-x><C-f>
inoremap <C-d> <C-x><C-d>
inoremap <C-l> <C-x><C-l>



" For Nim plugin
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i



lua << END
-- require('lualine').setup() -- Use just the default config as is
require('lualine').setup { -- Use default config with small customizations
  sections = {
    lualine_c = {{'filename', path=2}}, -- 0 = just filename, 1 = relative path, 2 = absolute path
  },
  inactive_sections = {
    lualine_c = {{'filename', path=2}},
  },
}

-- Modify ~/.local/share/nvim/plugged/onedark.nvim/lua/onedark/highlights.lua:47 to be:
--    LineNr = {fg = c.grey, bg = c.bg1}, -- Add background color to line numbers
require('onedark').setup {
    style = 'warmer',
    toggle_style_key = '<leader>c',
    toggle_style_list = {'darker', 'deep', 'warmer', 'light'}, -- List of styles to toggle
}
require('onedark').load()
END
