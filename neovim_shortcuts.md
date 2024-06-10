# TED'S NEOVIM SHORTCUTS DOCS



## THEME SHORTCUTS
### SPACE c   ->   nnoremap <leader>c :set background=light<CR>
Set the colorscheme to light, which is useful for bright environments (such as outdoors)

### SPACE c   ->   nnoremap <leader>C :set background=dark<CR>
Set the colorscheme to dark, which is my preference when coding at home or indoors



## INDENTATION SHORTCUTS
### SPACE i 4   ->   nnoremap <leader>i4 :set expandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>:retab<CR>
Retabs the file to use 4-spaces for indentation.  Useful for fixing files where the indentation has become mixed, or when editing a file that Neovim is unfamiliar with (Neovim will automatically use appropriate indentation based on the programming language)

### SPACE i 2   ->   nnoremap <leader>i2 :set expandtab tabstop=2 softtabstop=2 shiftwidth=2<CR>:retab<CR>
Retabs the file to use 2-spaces for indentation, which is common for HTML/CSS/JavaScript

### SPACE I 4   ->   nnoremap <leader>I4 :set noet ts=4 sts=4 sw=4<CR>:%retab!<CR>:set ts=8 sts=8 sw=8<CR>
Reset back to tab indentation (tabs are drawn to be 8-spaces wide, but are really just one character), replacing every 4-space indentation with one tab

### SPACE I 2   ->   nnoremap <leader>I2 :set noet ts=2 sts=2 sw=2<CR>:%retab!<CR>:set ts=8 sts=8 sw=8<CR>
Reset back to tab indentation (tabs are drawn to be 8-spaces wide, but are really just one character), replacing every 2-space indentation with one tab



## MOVEMENT SHORTCUTS
### CTRL down-arrow   ->   noremap <C-Down> }
Move downwards to the blank line just after the current paragraph

### CTRL up-arrow   ->   noremap <C-Up> {
Move upwards to the blank line just before the current paragraph

*'CTRL right-arrow' and 'CTRL left-arrow' are built-in shortcuts that move you horizontally to the next/previous word*



## WINDOW SPLIT NAVIGATION SHORTCUTS
### SPACE v   ->   nnoremap <leader>v <C-w><C-v>:bn<CR>
Split the window vertically, and open up the next buffer in the new window split

### SPACE s   ->   nnoremap <leader>s <C-w><C-s>:bn<CR>
Split the window horizontally, and open up the next buffer in the new window split

### CTRL h   ->   nnoremap <C-h> <C-w><C-h>
Move to the window split to the left

### CTRL j   ->   nnoremap <C-j> <C-w><C-j>
Move to the window split below

### CTRL k   ->   nnoremap <C-k> <C-w><C-k>
Move to the window split to the right

### CTRL l   ->   nnoremap <C-l> <C-w><C-l>
Move to the window split above

### SPACE r   ->   nnoremap <leader>r <C-w><C-r>
Rotate the window splits (i.e., when using either vertical or horizontal window splits, swap the files in the splits)



## BUFFER AND TAB SHORTCUTS
### SPACE f   ->   nnoremap <leader>f :e<Space>.<CR>
Open vim's built-in file browser (netrw) in the current working directory to find a file to open

### SPACE w   ->   nnoremap <leader>w :w<CR>
Write the current buffer to disk (save the file)

### SPACE W   ->   nnoremap <leader>W :wa<CR>
Write all buffers/files to disk (save all)

### SPACE b   ->   nnoremap <leader>b :ls<CR>:buffer 
List buffers; also sets you up to immediately type the buffer number or partial name and hit ENTER to switch to that buffer in the current window or window split

### SPACE B   ->   nnoremap <leader>B :ls<CR>:tab sb 
List buffers; also sets you up to immediately type the buffer number or partial name and hit ENTER to switch to that buffer in a new tab

### SPACE SPACE   ->   nnoremap <leader><leader> :b#<CR>
Change the current window to the previous buffer (like the "previous channel" button on the TV remote); using this command repeatedly will swap back forth between the last two buffers or files

### SPACE n   ->   nnoremap <leader>n :bn<CR>
Switch to the next buffer (the buffer order can be seen when you list all the buffers with 'SPACE b')

### SPACE N   ->   nnoremap <leader>N :tab sbn<CR>
Open the next buffer in a new tab

### SPACE p   ->   nnoremap <leader>p :bp<CR>
Switch to the previous buffer (the buffer order can be seen when you list all the buffers with 'SPACE b')

### SPACE P   ->   nnoremap <leader>P :tab sbp<CR>
Open the previous buffer in a new tab

### SPACE D   ->   nnoremap <leader>D :bn<CR>:bd#<CR>
Delete the current buffer (from memory, i.e., just close the file), but attempt to preserve the window splits



## AUTOCOMPLETION SHORTCUTS
*'CTRL p' and 'CTRL n' while typing a partial word is already a built-in shortcut to autocomplete to any other word in the currently open buffers, and is also how you navigate up/down in any of the pop-up menus from the commands below*

### (while typing a partial filename/path) CTRL f   ->   inoremap <C-f> <C-x><C-f>
Autocomplete a filename or path

### (while typing a partial function) CTRL d   ->   inoremap <C-d> <C-x><C-d>
Autocomplete a function name (definition) or macro

### (while typing a partial line) CTRL l   ->   inoremap <C-l> <C-x><C-l>
Autocomplete a line of text from the open buffers



## SEARCHING SHORTCUTS
### (with text highlighted) SPACE /   ->   vnoremap <leader>/ y/\<<C-r>"\><CR>
Perform a forward search on the highlighted text

### (with text highlighted) SPACE ?   ->   vnoremap <leader>? y?\<<C-r>"\><CR>
Perform a backward search on the highlighted text

### SPACE h   ->   nnoremap <leader>h :noh<CR>
Turn highlighting off (highlighting is left on by default when performing a / or ? search)



## UNDO SHORTCUT
### SPACE u   ->   nnoremap <leader>u :MundoToggle<CR>
Open the Mundo dialog, which allows you to see the buffer's entire undo history in a tree format, which allows you to go "back in time" to see your edits in an "alternate timeline", and create more splits from prior states of the buffer (the most recent timeline of edits will always be listed on the far left edge of the dialog box)

*If you cannot open the Mundo plugin, it's usually because you opened Neovim from the terminal with a Python virtual environment (venv) active; close that Neovim application and open it again either through your system's application launcher or from a terminal window with no venv active*



## TODO LIST SHORTCUTS (only really useful if you like making files like todo.txt)
### SPACE d   ->   nnoremap <Leader>d i<C-r>=strftime('%F %a %T')<CR>
Insert the current datetime timestamp

### SPACE t   ->   nnoremap <Leader>t o- [ ] 
Open a new task below your current line, with '[ ]' to use as an empty checkbox

### SPACE T   ->   nnoremap <Leader>T O- [ ] 
Open a new task above your current line, with '[ ]' to use as an empty checkbox

### SPACE x   ->   nnoremap <Leader>x 0f[lrxA [<C-r>=strftime('%F %a %T')<CR>]<Esc>
Mark the current task as done (puts an 'x' in the checkbox) and adds the current datetime timestamp to the end of the line

### SPACE X   ->   nmap <Leader>X \xddGp<C-o>
Mark the current task as done (with the 'x' in the checkbox and timestamp at the end of the line), but then moves the completed task to the very bottom of the buffer

### (with text highlighted) SPACE t   ->   vnoremap <Leader>t :g!/\[ \] /normal I- [ ] <CR>:noh<CR>
Convert the highlighted text into tasks by adding checkboxes

### (with Tasks highlighted) SPACE x   ->   vmap <Leader>x :g/\[ \] /normal \x<CR>:noh<CR>
Mark the highlighted tasks as completed (add 'x' inside checkboxes and add timestamps)
