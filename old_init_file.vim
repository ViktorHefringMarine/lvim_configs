
imap  <C-p> <Esc>:w!<CR>:call NeotermTerminalPython(@%, winnr(), 0)<CR>
if exists('g:neovide')
    "set guifont=FiraCode\ Nerd\ Font:h11
    "set guifont=FiraCode\ Nerd\ Font\ Mono\ Retina:h11
    set guifont=JetBrainsMonoNL\ Nerd\ Font\ Mono:h11
else
    set guifont=Consolas:h12
endif

let &runtimepath.=',~/.vim/bundle/neoterm'
let g:neoterm_automap_keys = '\w_thrash_1'

filetype off
let &runtimepath.= ', '. stdpath('data') . '/plugged/neoterm'
let g:neoterm_eof="\r"
let g:neoterm_autoscroll=1
filetype plugin on



let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_CommandMap = {'<M-K>': ['<Up>'], '<M-J>': ['<Down>']}
let g:Lf_PopupPalette = {
            \'light': {
                \'Lf_hl_match': {
                    \'gui': 'NONE',
                    \'font': 'NONE',
                    \'guifg': 'NONE',
                    \'guibg': '#303136',
                    \'cterm': 'NONE',
                    \'ctermfg': 'NONE',
                    \'ctermbg': '236'
                \},
                \'Lf_hl_cursorline': {
                    \'gui': 'NONE',
                    \'font': 'NONE',
                    \'guifg': 'NONE',
                    \'guibg': '#303136',
                    \'cterm': 'NONE',
                    \'ctermfg': 'NONE',
                    \'ctermbg': '236'
                    \},
                \},
            \  'dark': {
                \'Lf_hl_popup_window': {
                    \'gui': 'NONE',
                    \'font': 'NONE',
                    \'guifg': 'NONE',
                    \'guibg': 'None',
                    \'cterm': 'NONE',
                    \'ctermfg': 'NONE',
                    \'ctermbg': '236'
                    \},
                \},
            \}

augroup THE_PRIMEAGEN
    autocmd!
    autocmd FileType python :syn region foldImports start='"""' end='"""' fold keepend
    autocmd FileType python :syn region foldManual start='#<#' end='#>#' fold keepend

    autocmd FileType python :setlocal foldmethod=syntax
    autocmd FileType python :setlocal foldclose=all
    autocmd FileType python :setlocal shiftwidth=4

    autocmd BufRead, BufNewFile *.rs set filetype=rust
    autocmd FileType rust :nnoremap <F9> :RustRun<Cr>
augroup END





"let g:python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/iris/python"







autocmd UIEnter * :packadd lsp_signature<CR>

filetype plugin indent on


set updatetime=10

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/' 
    else 
        match none 
    endif
endfunction

"autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
" nnoremap <leader>h :call HighlightWordUnderCursor()<Cr> 




