




if exists("b:julia_PlugPluggidiliditity")
  finish
endif
let b:julia_PlugPluggidiliditity = 1




let g:julia_indent_align_imports=0
let g:julia_indent_align_brackets=0

set indentexpr=GetJuliaIndent()

"autocmd FileType julia map <silent> <F9> :w<CR>:call JuliaTerminal_Initializer()<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n><CR>

"map <silent> <C-P> :let @r = 'include("' . @% . '")'<CR>:w<CR>:winc h<CR>:winc j<CR>i<space><CR><C-r>r<CR><C-\><C-n><CR>


function NeotermTerminal(currentFile)
    if !exists("s:TerminalsOpen")
        let s:TerminalsOpen = 1
        exec "winc h"
        exec "T Julia --quiet"
        exec "T ] "
        exec "Tclear"
        exec "T activate ."
        "exec "Tclear"
        "Tkill
        exec "T "


        exec "setlocal statusline="

        let b:CloseThisWindowIfItsLonely = 1    " re-label this variable to be named after your plugin
        setlocal nobuflisted
        setlocal noswapfile
        setlocal bufhidden="wipe"
        setlocal foldcolumn=1
        setlocal winfixwidth

        syntax match JuliaTermPath0 "@"
        syntax match JuliaTermPath1 "\s\s\s\zs@.*\d\s*"
        syntax match JuliaTermPath2 "\s\s\s\zs@ C:\(\S.*\(\n\|.*:\d*\)\)*"
        syntax match JuliaTermPath3 "\s\s\s\zs@ \w* C:\(\S.*\(\n\|.*:\d*\)\)*"
        syntax match JuliaTermPath4 "C:\(\S.*\(\n\|.*:\d*\)\)*"
        highlight JuliaTermPath0 guifg=#9aacce
        highlight JuliaTermPath1 guifg=#9aacce
        highlight JuliaTermPath2 guifg=#9aacce
        highlight JuliaTermPath3 guifg=#9aacce
        highlight JuliaTermPath4 guifg=#9aacce
        " \s\s\s\zs@.*\d\s*

"        "silent exec 'bel new ' . s:output_buffer_name
"        let s:buf_nr = bufnr('%')
"        silent execute 'terminal'
"
"        setlocal nomodifiable
"        "setlocal bufhidden=delete
"        ""setlocal buftype=nofile
"        "setlocal noswapfile
"        "setlocal nobuflisted
"        "setlocal winfixheight
"        "setlocal cursorline " make it easy to distinguish
"        "setlocal nonumber
"        "setlocal norelativenumber
"        "setlocal showbreak=""
"
"        "" clear the buffer
"        "setlocal noreadonly
"        "setlocal modifiable
    endif
    exec 'T include("' . a:currentFile .'")'
endfunction


autocmd FileType julia map <silent> <F9> :w<CR>:call NeotermTerminal(substitute(@%,"\\", "/", "g"))<CR>
autocmd FileType julia map <silent> <C-P> :w<CR>:call NeotermTerminal(substitute(@%,"\\", "/", "g"))<CR>





















"
""hi link juliaDocString String
"
"

""autocmd FileType julia map <F9>  :let @r='include("' . @% . '")'<CR> :winc h<CR>:bel split JuliaTerminal<CR>:terminal<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n> :winc l<CR>
"autocmd FileType julia map <F10> :let @r='include("' . @% . '")'<CR> :winc h<CR>:winc j<CR>i<space><CR><C-r>r<CR><C-\><C-n><CR> :winc l<CR> :winc l<CR>
"
"
""autocmd FileType julia map <F9>  :let @r='include("' . @% . '")'<CR> :winc h<CR>:bel split JuliaTerminal<CR>:terminal<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n> :winc l <CR>:map <F9> :let @r='include("' . @% . '")'<CR>:winc h<CR>:winc j<CR>i<space><CR><C-r>r<CR><C-\><C-n><CR> :winc l<CR> :winc l<CR>
"
""This Julia mapping works like this
""First time <F9> is entered.
"" - then do this
""   Save file [:w]
""   call JuliaTerminal_Initializer()
""   run this: [<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n><CR>]
""       That is, run the julia script.
""After First time <F9> was entered.
"" - then do this
""   Check if we are in another jl file
""       If new file
""       then simply run
"
"
"function JuliaTerminal_Initializer()
"    let s:output_buffer_name = "JuliaTerminal"
"    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
"        let @r = 'include("' . @% . '")'
"
"        silent exec 'winc h'
"        silent exec 'enew '
"        "silent exec 'bel new ' . s:output_buffer_name
"        let s:buf_nr = bufnr('%')
"        silent execute 'terminal'
"
"        setlocal nomodifiable
"        "setlocal bufhidden=delete
"        ""setlocal buftype=nofile
"        "setlocal noswapfile
"        "setlocal nobuflisted
"        "setlocal winfixheight
"        "setlocal cursorline " make it easy to distinguish
"        "setlocal nonumber
"        "setlocal norelativenumber
"        "setlocal showbreak=""
"
"        "" clear the buffer
"        "setlocal noreadonly
"        "setlocal modifiable
"
"
"        "silent execute  ':winc l'
"
"    endif
"    " New Mapping
"    map <silent> <F9> :let @r = 'include("' . @% . '")'<CR>:w<CR>:winc h<CR>:winc j<CR>i<space><CR><C-r>r<CR><C-\><C-n><CR>
"    map <silent> <C-P> :let @r = 'include("' . @% . '")'<CR>:w<CR>:winc h<CR>:winc j<CR>i<space><CR><C-r>r<CR><C-\><C-n><CR>
"endfunction
"
"autocmd FileType julia map <silent> <F9> :w<CR>:call JuliaTerminal_Initializer()<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n><CR>
"autocmd FileType julia map <silent> <C-P> :w<CR>:call JuliaTerminal_Initializer()<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n><CR>
"
"
"        "silent exec 'terminal<CR>i<space>julia<CR><C-r>r<CR><C-\><C-n>'
"        ":winc h
"        ":winc j
"        "startinsert
"        "call feedkeys("julia\<CR><C-r>r<Cr><C-\><C-n>")
"        ":winc l
"        ":echo @%
"        "silent exec 'i'
"        "silent execute 'insert'
"        "silent execute 'setlocal filetype=' . s:output_buffer_filetype
"        ":map <F9> :let @r='include("' . @% . '")'<CR>:winc h<CR>:winc j<CR>i<space><CR><C-r>r<CR><C-\><C-n><CR> :winc l<CR> :winc l<CR>
""    endif
""endfunction
"
"
"
""autocmd FileType julia map <buffer> <F9> :w<CR>:exec '!julia' shellescape(@%, 1 )<CR>
"
""map <F9> :winc h<CR>:bel split JuliaTerm<CR>:terminal<CR>i<space>julia<CR><C-\><C-N>
"
"
""function JuliaTerm()
""    :winc h
""    :bel split JuliaTerm
""    :terminal
""    :
""endfunc

"function! JuliaTermblablabla()
"    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim
"
"
"    " get file path of current file
"    let s:current_buffer_file_path = expand("%")
"
"    let s:output_buffer_name = "JuliaTerm"
"
"    " reuse existing buffer window if it exists otherwise create a new one
"    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
"        if t:mutton_enabled['left'] == 1 && 'cow'=='horse'
"            silent execute 'winc h'
"            silent execute 'below new ' . s:output_buffer_name
"            let s:buf_nr = bufnr('%')
"        else
"            silent execute 'below new ' . s:output_buffer_name
"            let s:buf_nr = bufnr('%')
"        endif
"    elseif bufwinnr(s:buf_nr) == -1
"        silent execute 'below new'
"        silent execute s:buf_nr . 'buffer'
"    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
"        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
"
"    silent execute "setlocal filetype=" . s:output_buffer_filetype
"    setlocal bufhidden=delete
"    setlocal buftype=nofile
"    setlocal noswapfile
"    setlocal nobuflisted
"    setlocal winfixheight
"    setlocal cursorline " make it easy to distinguish
"    setlocal nonumber
"    setlocal norelativenumber
"    setlocal showbreak=""
"
"    " clear the buffer
"    setlocal noreadonly
"    setlocal modifiable
"    %delete _
"
"    " add the console output
"    silent execute ".!". a:file_type . " " . shellescape(s:current_buffer_file_path, 1)
"
"    " resize window to content length
"    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
"    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
"    "
"    "       But if you close the output buffer then it returns to using the default size when its recreated
"    "execute 'resize' . line('$')
"
"    " make the buffer non modifiable
"    setlocal readonly
"    setlocal nomodifiable
"
"endfunction


