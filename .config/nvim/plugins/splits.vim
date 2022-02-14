set splitbelow
set splitright


"configuration for splits 
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" cloase split
nnoremap <Leader>qq <C-W>c

" expand split
nnoremap <leader>k <C-W>_
nnoremap <leader>l <C-W>\|

" same size
nnoremap <leader>= <C-W>=

" resizing

nnoremap <silent> <C-left> :vertical resize +2 <Cr>
nnoremap <silent> <C-right> :vertical resize -2 <Cr>
nnoremap <silent> <C-up> :resize +2 <Cr>
nnoremap <silent> <C-down> :resize -2 <Cr>

"remove | from vertical split
:set fillchars+=vert:\ 
