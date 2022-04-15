
set bg=dark
runtime colors\melange.vim



if exists('g:neovide')
    let g:neovide_transparency=0.86
endif


" Syntaxes:
" * pythonImport:    {import}, {from} , NOT {as}
" * semshiImported:
"   * given:         from folder import Module, Class
"   * higlighted     {Module}, {Class}
" * semshiBuiltin:   {__name__}, {open}, {IOError}, {print}
" * semshiSelected:  the variable/module/function/etc being hovered (that is, the word the cursor is located on)




highlight normal guifg=#d8cdc0 guibg=#2a2520

highlight search guifg=none guibg=#63584c

highlight pythonIndentError guifg=none guibg=none
highlight pythonSpaceError  guifg=none guibg=none


highlight pythonImport guifg=#e49b5d


"highlight semshiImported guifg=#D5971D
highlight semshiImported guifg=#e479ab
highlight semshiParameter gui=italic
highlight semshiBuiltin guifg=none gui=italic             "
highlight semshiSelected guifg=none guibg=#63584c
highlight semshiAttribute guifg=none

highlight LineNrAbove guifg=#d8cdc0
highlight LineNrBelow guifg=#d8cdc0
highlight LineNr ctermfg=238 ctermbg=16 guifg=#d8cdc0 guibg=none gui=bold

highlight FoldColumn        guibg=None
highlight SignColumn        guibg=None
highlight String            guibg=None guifg=#b69f89
highlight Folded            guibg=None guifg=#696969
highlight ColorColumn ctermfg=237 ctermbg=237  guibg=#3c3836 guifg=#a89984  "gui=reverse



"#e479ab
augroup JuliaGroup
    autocmd!
    autocmd FileType julia :highlight operator guifg=#bdaa94
    autocmd FileType julia :highlight link juliapardelim delimiter

    autocmd FileType julia :highlight link juliasemicolon operator
    autocmd FileType julia :highlight link juliafunctioncall Function
    autocmd FileType julia :highlight juliaBaseTypeNum guifg=#fabd2f "guibg=#1c1c1c

augroup End



augroup ColorGroup
    autocmd!
    "autocmd InsertEnter * highlight semshiUnresolved cterm=none      ctermfg=none gui=none     guifg=none
    "autocmd InsertLeave * highlight semshiUnresolved cterm=underline ctermfg=226  gui=underline guifg=#ffff00

    autocmd InsertEnter * highlight semshiUnresolved cterm=none      ctermfg=none gui=none      guifg=none guibg=none
    autocmd InsertLeave * highlight semshiUnresolved cterm=underline ctermfg=226  gui=underline guifg=none guibg=#683f3b
augroup END


"highlight CursorLine guibg=None guifg=None
highlight CursorLine guifg=None


highlight SpecialKey guifg=#86A3A3


"highlight LspReferenceRead guibg=#484848
highlight LspReferenceRead guibg=none
highlight LspReferenceWrite guibg=none
highlight semshiSelected guibg=#484848
highlight Visual guibg=#666666


"highlight pythonTSVariable 
"highlight TSField guifg=#C1A78E
highlight TSField guifg=#ab677b
"highlight TSParameter gui=italic guifg=#d7bf91
highlight TSParameter gui=italic guifg=pink

" Def
highlight TSKeywordFunction guifg=#E49B5D
highlight TSInclude guifg=#E49B5D

"highlight pythonTSOperator guifg=#bdaa94
highlight TSPunctDelimiter guifg=#bdaa94

"highlight Constant
"highlight Type

highlight ColorColumn guibg=#352F2A
highlight VertSplit guibg=#352F2A guifg=#352F2A
highlight CursorLine guifg=none guibg=#595959



highlight NormalFloat guibg=#0b0a09 blend=10
highlight FloatBorder guibg=#0b0a09 guifg=#888888 blend=10
let g:neovide_floating_opacity=0.6

highlight StatusLine guibg=#352f2A gui=bold
highlight TablineFill gui=none





highlight BufferLineFill guibg=None
highlight TablineFill guibg=#26221d
highlight TablineSel guibg=#1f1b18

" Highlight the background of the main text
"hi NvimTreeNormal guibg=#372f2b
"hi NvimTreeNormal guibg=#332b27

hi NvimTreeStatusLineNC guibg=#26221d
hi VertSplit guifg=#26221d guibg=#26221d

"hi ColorCollumn guifg=#26221d



highlight BufferlineBufferSelected guibg=#3a332e guifg=pink
autocmd ColorScheme :highlight Normal guibg=#2a2521<CR>
autocmd ColorScheme :highlight TablineSel guibg=#1f1b18<CR>
"hi BufferLineBufferSelected guib

highlight Type guifg=#8ca8a8





highlight LspSignatureActiveParameter guifg=#a9a92e gui=undercurl,bold
