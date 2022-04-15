



nnoremap <silent> 0 :call MoveLeft(col('.'))<CR>
nnoremap <silent> <C-h> :call MoveLeft(col('.'))<CR>
nnoremap <C-l> $
" nnoremap <C-j> L
" nnoremap <C-k> H
" nnoremap <C-N> M


"nnoremap \dk :lua vim.diagnostic.goto_prev()<CR>
"nnoremap \dj :lua vim.diagnostic.goto_next()<CR>
nnoremap gep :lua vim.diagnostic.goto_prev()<CR>
nnoremap gen :lua vim.diagnostic.goto_next()<CR>
nnoremap gef :lua vim.diagnostic.open_float()<CR>
nnoremap geq :lua vim.diagnostic.setloclist()<CR>


" iu kj
" iu jj
" iu jk

autocmd BufWinEnter * map 't gg
autocmd BufWinEnter * map 'b G
autocmd BufWinEnter * map 'm /\v^\s*def\s\zs\w*\|^\s*class\s\zs\w*\ze[:(]<CR>
autocmd BufWinEnter * map 'n /\v^\s*\zsclass\ze\s\|^\s*\zsdef\ze\s\|^\s*\zsif\ze\s\|^\s*\zsfor\ze\s\|^\s*\zselif\ze\s\|^\s*\zselse\ze:\|^\s*\zswhile\ze\s<CR>
autocmd BufWinEnter * map 'c /^\s*\zsclass\ze\s<CR>
autocmd BufWinEnter * map 'f /^\s*\zsfor\ze\s<CR>
autocmd BufWinEnter * map 'w /^\s*\zswhile\ze\s<CR>
autocmd BufWinEnter * map 'r /^\s*\zsreturn\ze\s<CR>
autocmd BufWinEnter * map 'y /^\s*\zsyield\ze\s<CR>
autocmd BufWinEnter * map 'i /\v^\s*\zsif\ze\s\|^\s*\zselif\ze\s\|^\s*\zselse\ze:<CR>
autocmd BufWinEnter * map 'd /^\s*def<CR>




autocmd ColorScheme :highlight Normal guibg=#2a2521<CR>
autocmd ColorScheme :highlight TablineSel guibg=#1f1b18<CR>

":>

"autocmd FileType julia * nnoremap \j 


"autocmd! VimEnter :map <leader>; :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>
