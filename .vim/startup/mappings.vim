let mapleader =","
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>


" Open corresponding .pdf/.html or preview
"map <leader>p :!opout <c-r>%<CR><CR>
map <leader>p :call SaveFile()<cr>

" jump through errors
"nnoremap <C-e> :lnext
"split navigations
noremap <F3> :Autoformat<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
"map leadlead-F to ctrl-j to quickly acejump
nnoremap <C-;> <leader><leader>f
nnoremap <Shift-C-;> <leader><leader>f
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
vnoremap <C-c> "*y
" Enable folding with the spacebar
nnoremap <C-f> :Goyo <bar> highlight StatusLineNC ctermfg=white <bar> : hi Normal guibg=NONE ctermbg=NONE <CR>
nnoremap <space> za
nnoremap <C-t> :highlight LineNr term=bold cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE<CR> 

