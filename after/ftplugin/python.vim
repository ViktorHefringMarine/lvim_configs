
"let g:python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/iris/python"
if exists("t:python_PlugPluggidiliditity")
  finish
endif



"call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"    Plug 'Yggdroot/indentLine'
"call plug#end()

"let g:python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/iris/python"

let t:python_PlugPluggidiliditity = 1
let g:python_RunFile = 'undefined'

function CondaInfo()
    " Print Info
    echo $CONDA_DEFAULT_ENV
    echo g:python3_host_prog
endfunction

function CondaUpdate()
    let g:python3_host_prog = 'C:/Users/Lenovo/miniconda3/envs/' . g:CondaEnv . '/python'
endfunction

function CondaInit(env='')
    " Set Environment
    echo a:env
    if a:env != ''
        let g:CondaEnv = a:env
        call CondaUpdate()
    endif
endfunction

if $CONDA_DEFAULT_ENV == ''
    call CondaInit($CONDA_DEFAULT_ENV)
endif


" Call Python
"map <buffer> <F9> :w<CR>:execute '!condaVim'  g:CondaEnv shellescape(@%, 1)<CR>
"imap <buffer> <F9> <esc>:w<CR>:execute '!condaVim' g:CondaEnv shellescape(@%, 1)<CR>

 " Bind F5 to save file if modified and execute python script in a buffer. -
"map <F10> :call SaveAndExecutePython('python')<CR>
"imap <F10> :<C-u>call SaveAndExecutePython('python')<CR>


let g:CondaEnv = $CONDA_DEFAULT_ENV

let g:python3_host_prog = 'C:/Users/Lenovo/miniconda3/envs/' . g:CondaEnv . '/python'


"""""""""""""""""""""""
"let g:neoterm_command_prefix = 'python'

function NeotermTerminalPython(current_file, main_window_nr, Update_RunFile)
    if g:python_RunFile=='undefined'|| a:Update_RunFile==1
        let g:python_RunFile = a:current_file
        echo "python" . g:python_RunFile
    else
        echo "python " g:python_RunFile
    endif
    let g:main_window_nr = a:main_window_nr


    if t:python_PlugPluggidiliditity == 1
        execute "1winc w"
        "if t:NerdTreeInUse == 1
        "    NERDTreeToggle
        "    execute "42winc |"
        "endif
        "execute 'T PROMPT $_$_\033[32m' . substitute(getcwd(), '^.*\', '', '') . '$g$s'
        execute 'T PROMPT $_$_' . substitute(getcwd(), '^.*\', '', '') . '$g$s'
        exec "setlocal statusline="
        let b:CloseThisWindowIfItsLonely = 1    " re-label this variable to be named after your plugin
        setlocal nobuflisted
        setlocal noswapfile
        "setlocal bufhidden="wipe"
        setlocal foldcolumn=1
        setlocal winfixwidth


        " Traceback
        syntax match Terminal_Error /Traceback (most recent call last):/
        hi Terminal_Error guibg=bold,underline, guifg=#af5f5f

        " File
        exec "match Terminal_File /File/"
        hi Terminal_File gui=bold guifg=#87875f

        " line
        exec "2match Terminal_Line /line/"
        hi Terminal_Line gui=italic guifg=#d29958

        " Route-Guidance
        syntax keyword RootDirName /Route-guidance/
        hi RootDirName gui=bold guifg=#E49B5D


        syntax match Terminal_Call /NoDkferd>/
        syntax match Terminal_Call /Route-guidance>/
        hi Terminal_Call gui=bold guifg=#E49B5D


        " String
        syntax region TerminalString start=+"C+ skip=+\\\\\|\\'\|\\$+ end=+.py"+
        hi TerminalString gui=italic guifg=#ffdf87

        syntax match Terminal_number /\<\d\+\,/
        hi Terminal_number gui=bold guifg=#af5f00
        let t:TerminalInUse = 1
        let t:SidePanelInUse = 0
        let t:NerdTreeInUse = 0
        let t:TagBarInUse = 0
        let t:buf_Terminal_python = buffer_number()
        execute "T python " . g:python_RunFile
        execute a:main_window_nr . "winc w"
    elseif t:TerminalInUse == 1
        execute "T python " . g:python_RunFile
        execute a:main_window_nr . "winc w"
    "elseif t:TerminalInUse == 0
        "call SidePanelToggleManagement("PythonTerminal")
    endif

    let t:python_PlugPluggidiliditity = 0
endfunction



" Python Mappings: Defined in /after/ftplugins/python.vim
" <F9>   Change the 'RunFile' to the file currently being viewed and run it
" <C-p>  Run the 'RunFile'
" <F10>  Kill Terminal
" <C-w><C-p> Kill Terminal
nnoremap   <F9> :w!<CR>:call NeotermTerminalPython(@%, winnr(), 1)<CR>
" nnoremap  <C-p> :w!<CR>:call NeotermTerminalPython(@%, winnr(), 0)<CR>
nnoremap  <F10> :w!<CR>:Tkill<CR>
" nnoremap  <C-w><C-p> :w!<CR>:Tkill<CR>
" autocmd BufWinEnter :imap  <C-p> <Esc>:w!<CR>:call NeotermTerminalPython(@%, winnr(), 0)<CR><CR>

autocmd BufWinEnter :setlocal completeopt=menuone,noselect "removes double pressing enter
