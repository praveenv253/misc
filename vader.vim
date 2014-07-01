set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vader"

hi Normal                           ctermfg=252
hi Comment                          ctermfg=244
hi String                           ctermfg=076
hi Number                           ctermfg=196
hi Constant                         ctermfg=208
hi Special                          ctermfg=191
hi Identifier            cterm=none ctermfg=011
hi Statement             cterm=bold ctermfg=214
hi PreProc                          ctermfg=135
hi Type                  cterm=bold ctermfg=011
hi Function                         ctermfg=039
hi Operator                         ctermfg=026
hi Ignore                           ctermfg=008
hi Error                            ctermfg=124
hi Todo                             ctermfg=000 ctermbg=011
hi MatchParen            cterm=bold ctermfg=160 ctermbg=none

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String           String
hi link Character        String
hi link Number           Number
hi link Boolean          Constant
hi link Float            Number
hi link Conditional      Statement
hi link Repeat           Statement
hi link Label            Statement
hi link Keyword          Statement
hi link Exception        Statement
hi link Include          PreProc
hi link Define           PreProc
hi link Macro            PreProc
hi link PreCondit        PreProc
hi link StorageClass     Type
hi link Structure        Type
hi link Typedef          Type
hi link Tag              Special
hi link SpecialChar      Special
hi link Delimiter        Special
hi link SpecialComment   Special
hi link Debug            Special
hi link Operator         Operator

" C-specific
hi cCustomClass          ctermfg=030

" Python-specific
hi pythonExceptions      cterm=bold ctermfg=160

" Make-specific
hi link makeTarget       Statement
hi link makeIdent        Type
hi link makeCommands     String

" Tex-specific
hi link texSection       Statement
hi link texStatement     Type
hi link texTypeStyle     Type
hi link texDelimiter     Operator
hi link texRefZone       String
hi link texSectionName   String
hi link texInputFile     String
hi link texMathZoneA     String
hi link texMathZoneE     String
hi link texMathZoneX     String
hi link texMathZoneY     String
hi link texMathSymbol    Special
hi link texSubscript     Special
hi link texSuperscript   Special
hi link texZone          Function

" Vim-specific
hi link VimGroup         Identifier
hi link VimHiGroup       Identifier
hi link VimHiCterm       String
hi link VimHiCtermFgBg   String
hi link VimHiAttrib      Number
hi link VimOption        Identifier

" Miscellaneous
hi LineNr                ctermfg=238
hi ColorColumn                       ctermbg=235
hi SpecialKey            ctermfg=237
