
" Side bars
let t:SidePanelInUse = 0
let t:NerdTreeInUse = 0
let t:TagBarInUse = 0
let t:TerminalInUse = 0
autocmd TabEnter * silent execute "let t:SidePanelInUse = 0"
autocmd TabEnter * silent execute "let t:NerdTreeInUse = 0"
autocmd TabEnter * silent execute "let t:TagBarInUse = 0"
autocmd TabEnter * silent execute "let t:TerminalInUse = 0"




function CreateSidePanel()
    "-------------------------------------------
    if exists(':GuiPopupmenu')
        exec "GuiPopupmenu 0"
        set guioptions-=mT
    endif
    "-------------------------------------------
    if t:SidePanelInUse == 1
        "let g:width = winwidth(1)
        execute "vertical split SidePannel"
        execute a:SideWidth . " wincmd |"
        let b:CloseThisWindowIfItsLonely = 1    " re-label this variable to be named after your plugin
        setlocal nobuflisted
        setlocal noswapfile
        setlocal bufhidden="wipe"
        setlocal foldcolumn=1
        set winfixwidth
        setlocal nomodifiable
        set buftype=nofile
        set nonumber norelativenumber nocursorline nocursorcolumn
        execute "winc l"
        let t:SidePanelInUse = 1
    else
        "let g:width = winwidth(1)
        execute "vertical split SidePannel"
        execute a:SideWidth . " wincmd |"
        let b:CloseThisWindowIfItsLonely = 1    " re-label this variable to be named after your plugin
        setlocal nobuflisted
        setlocal noswapfile
        setlocal bufhidden="wipe"
        setlocal foldcolumn=1
        set winfixwidth
        setlocal nomodifiable
        set buftype=nofile
        set nonumber norelativenumber nocursorline nocursorcolumn
        execute "winc l"
        let t:SidePanelInUse = 1
    endif
    "-------------------------------------------
endfunction

function CloseSidePanelIfLonely()
    if winnr('$') == 1 && exists("b:CloseThisWindowIfItsLonely") && b:CloseThisWindowIfItsLonely == 1
        quit
    endif
endfunction

function EchoStatus()
    echo '(SidePanel, NerdTree, TagBar, Terminal) = (' . t:SidePanelInUse . ', ' . t:NerdTreeInUse . ', ' . t:TagBarInUse . ', ' t:TerminalInUse . ')'
endfunction

function ChangeGlobalVariable()
    if exists("b:CloseThisWindowIfItsLonely")
        let t:SidePanelInUse = 0
        let t:NerdTreeInUse = 0
        let t:TagBarInUse = 0
    endif
endfunction


au WinEnter * call CloseSidePanelIfLonely()
au WinClosed * call ChangeGlobalVariable()

"""nnoremap <leader>ss :call CreateSidePanel()<CR>
"""nnoremap <leader>sd :call CreateSidePanel(40)<CR>
"autocmd VimEnter * silent call CreateSidePanel()
""""""""""""""""""""""""""
""""""""""""""""""""""""""
""""""""""""""""""""""""""
""""""""""""""""""""""""""
" Part 2
function BufffergatorMyFunc()
    call MuttonToggle('buffergator')
    if t:mutton_visible['left'] == 'buffergator'
        :wincmd l
        :echo t:mutton_enabled
    endif
endfunction

function SidePanelToggleManagement(Toggle)
    " if open then close it
    if t:SidePanelInUse == 1
        exec "winc h"
        exec "winc q"
        let t:SidePanelInUse = 0
    elseif t:SidePanelInUse==0 && a:Toggle=='SidePanel'
        let t:SidePanelInUse = 1
    endif
    if t:NerdTreeInUse == 1
        exec "winc h"
        exec "winc q"
        let t:NerdTreeInUse = 0
    endif
    if t:TagBarInUse == 1
        exec "winc h"
        exec "winc q"
        let t:TagBarInUse = 0
    endif
    if t:TerminalInUse == 1
        exec "winc h"
        exec "winc q"
        let t:TerminalInUse = 0
    endif


    if a:Toggle == 'SidePanel'
        call CreateSidePanel()
        echo "SidePanel"
    elseif a:Toggle == 'NerdTree'
        NERDTreeToggle
        exec "10 winc h"
        let b:CloseThisWindowIfItsLonely = 1    " re-label this variable to be named after your plugin
        exec "50winc|"
        exec "1 winc l"
        let t:NerdTreeInUse  = 1
        echo "NERDTree"
    elseif a:Toggle == 'Tagbar'
        TagbarToggle
        exec "10 winc h"
        exec "50winc|"
        exec "1 winc l"
        let t:TagBarInUse = 1
        echo "TagBar"
    elseif a:Toggle == 'PythonTerminal'
        call CreateSidePanel()
        exec "winc h"
        execute "buf" . t:buf_Terminal_python
        exec "winc l"
        let t:SidePanelInUse = 0
        let t:TerminalInUse = 1
        echo "Python Terminal "
    endif

    let l:nr_open = t:SidePanelInUse + t:NerdTreeInUse + t:TagBarInUse + t:TerminalInUse
    if 2 <= l:nr_open
        echo "WARNING: write this \\q"
    endif
endfunction



function Open_Init_Vim()
    execute "tabnew C:/Users/Lenovo/AppData/Local/nvim/init.vim"
    execute "call CreateSidePanel()"
    if $Neovide_Configuration == 1
        call SidePanelToggleManagement("SidePanel")
    elseif $Neovide_Configuration == 2
        call SidePanelToggleManagement("SidePanel")
    endif

endfunction


