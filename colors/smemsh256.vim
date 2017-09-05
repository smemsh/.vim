"
" smemsh256
"   vim colorscheme for 256 color xterms, based on elflord
"
" magic incantation used to create this file:
"   - start vim with csapprox plugin installed and enabled
"   - :colorscheme elflord
"   - :source old hand made colors (~/.vim/colors/default.vim)
"   - :redir! > /tmp/thisfile
"   - :highlight
"   - add cterm=NONE, ctermfg=fg, ctermbg=bg where missing
"   - add 'hi' keywords
"   - rearrange 'link' lines to have correct syntax for input
"   - grep out into separate sections: colors, links, and clears
"   - hand fixup and make changes as we go after that
"
" stat:
"   - still under development
"
" note:
"   - $TERM eg xterm-256color, screen-256color, rxvt-unicode-256color
"   - no attempt was made to provide gui or term values, only cterm
"
" todo:
"   - vim syntax def has a bug where "hi clear <group>" does
"     not color group name differently but "hi link <group>" does
"   - 'hi clear' does not change already drawn colors (scheme reload
"     alone not sufficient to affect changes during edit-test cycle)
"
" scott@smemsh.net
" http://smemsh.net/src/vim-smemsh256/
" http://spdx.org/licenses/GPL-2.0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "smemsh256"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal               cterm=NONE          ctermfg=252     ctermbg=0
hi smemshNotYet         cterm=NONE          ctermfg=11      ctermbg=1
hi Ignore               cterm=NONE          ctermfg=0       ctermbg=bg

"""

hi Comment              cterm=italic        ctermfg=111     ctermbg=bg
hi Cursor               cterm=NONE          ctermfg=15      ctermbg=0
hi SubtleWarningMsg     cterm=NONE          ctermfg=fg      ctermbg=12

hi SpecialKey           cterm=NONE          ctermfg=23      ctermbg=0
hi NonText              cterm=NONE          ctermfg=159     ctermbg=0
hi Directory            cterm=NONE          ctermfg=81      ctermbg=0
hi ErrorMsg             cterm=NONE          ctermfg=224     ctermbg=0
hi IncSearch            cterm=NONE          ctermfg=11      ctermbg=12
hi Search               cterm=NONE          ctermfg=11      ctermbg=12
hi MoreMsg              cterm=NONE          ctermfg=11      ctermbg=12
hi ModeMsg              cterm=NONE          ctermfg=15      ctermbg=0
hi LineNr               cterm=NONE          ctermfg=121     ctermbg=0
hi CursorLineNr         cterm=bold          ctermfg=226     ctermbg=bg
hi Question             cterm=NONE          ctermfg=11      ctermbg=12
hi StatusLine           cterm=italic        ctermfg=11      ctermbg=17
hi StatusLineNC         cterm=NONE          ctermfg=6       ctermbg=17
hi VertSplit            cterm=NONE          ctermfg=63      ctermbg=bg
hi Title                cterm=bold          ctermfg=201     ctermbg=bg
hi Visual               cterm=NONE          ctermfg=NONE    ctermbg=235
hi WarningMsg           cterm=NONE          ctermfg=11      ctermbg=9
hi WildMenu             cterm=NONE          ctermfg=16      ctermbg=226
hi Folded               cterm=italic        ctermfg=172     ctermbg=233
hi FoldColumn           cterm=NONE          ctermfg=51      ctermbg=bg

hi SignColumn           cterm=NONE          ctermfg=51      ctermbg=250
hi Conceal              cterm=NONE          ctermfg=252     ctermbg=248

hi SpellBad             cterm=NONE          ctermfg=208     ctermbg=0
hi SpellCap             cterm=NONE          ctermfg=12      ctermbg=0
hi SpellRare            cterm=NONE          ctermfg=13      ctermbg=0
hi SpellLocal           cterm=NONE          ctermfg=81      ctermbg=0

hi Pmenu                cterm=NONE          ctermfg=15      ctermbg=56
hi PmenuSel             cterm=bold,italic   ctermfg=227     ctermbg=20
hi PmenuSbar            cterm=NONE          ctermfg=11      ctermbg=21
hi PmenuThumb           cterm=NONE          ctermfg=fg      ctermbg=17

hi TabLine              cterm=underline     ctermfg=fg      ctermbg=248
hi TabLineSel           cterm=bold          ctermfg=fg      ctermbg=bg
hi TabLineFill          cterm=reverse       ctermfg=fg      ctermbg=bg

hi CursorColumn         cterm=NONE          ctermfg=fg      ctermbg=236
hi CursorLine           cterm=NONE          ctermfg=214     ctermbg=236
hi ColorColumn          cterm=NONE          ctermfg=fg      ctermbg=88

hi MatchParen           cterm=NONE          ctermfg=fg      ctermbg=30

"""

hi Constant             cterm=NONE          ctermfg=182     ctermbg=bg
hi String               cterm=NONE          ctermfg=187     ctermbg=bg
hi Character            cterm=NONE          ctermfg=104     ctermbg=bg
hi Number               cterm=NONE          ctermfg=164     ctermbg=bg
hi Boolean              cterm=NONE          ctermfg=120     ctermbg=bg
hi Float                cterm=NONE          ctermfg=163     ctermbg=bg

hi Identifier           cterm=NONE          ctermfg=80      ctermbg=bg
hi Function             cterm=NONE          ctermfg=227     ctermbg=bg

hi Statement            cterm=bold          ctermfg=186     ctermbg=bg
hi Conditional          cterm=NONE          ctermfg=225     ctermbg=bg
hi Repeat               cterm=NONE          ctermfg=230     ctermbg=bg
hi Label                cterm=NONE          ctermfg=226     ctermbg=bg
hi Operator             cterm=bold          ctermfg=204     ctermbg=bg
hi Keyword              cterm=NONE          ctermfg=142     ctermbg=bg
hi Exception            cterm=NONE          ctermfg=214     ctermbg=bg

hi PreProc              cterm=NONE          ctermfg=221      ctermbg=bg
hi Include              cterm=italic        ctermfg=212     ctermbg=bg
hi Define               cterm=italic        ctermfg=211     ctermbg=bg
hi Macro                cterm=italic        ctermfg=210     ctermbg=bg
hi PreCondit            cterm=italic        ctermfg=209     ctermbg=bg

hi Type                 cterm=bold          ctermfg=77      ctermbg=bg
hi StorageClass         cterm=bold          ctermfg=83      ctermbg=bg
hi Structure            cterm=bold          ctermfg=78      ctermbg=bg
hi Typedef              cterm=bold          ctermfg=82      ctermbg=bg

hi Special              cterm=NONE          ctermfg=222     ctermbg=bg
hi SpecialChar          cterm=NONE          ctermfg=199     ctermbg=bg
hi Tag                  cterm=NONE          ctermfg=204     ctermbg=bg
hi Delimiter            cterm=NONE          ctermfg=203     ctermbg=bg
hi SpecialComment       cterm=NONE          ctermfg=161     ctermbg=bg
hi Debug                cterm=NONE          ctermfg=226     ctermbg=bg

"""

hi Underlined           cterm=underline     ctermfg=111     ctermbg=bg
hi Error                cterm=bold,italic   ctermfg=227     ctermbg=196
hi Todo                 cterm=bold,italic   ctermfg=52      ctermbg=226

""" LANGUAGE OVERRIDES """""""""""""""""""""""""""""""""""""""""""""""""""""""

" diffmode
"
hi DiffAdd              cterm=NONE          ctermfg=252     ctermbg=18
hi DiffChange           cterm=NONE          ctermfg=252     ctermbg=90
hi DiffDelete           cterm=NONE          ctermfg=21      ctermbg=30
hi DiffText             cterm=NONE          ctermfg=252     ctermbg=88

" diffsyntax
"
hi diffOldFile          cterm=italic        ctermfg=44      ctermbg=233
hi diffNewFile          cterm=italic        ctermfg=45      ctermbg=233
hi diffFile             cterm=italic        ctermfg=87      ctermbg=233
hi diffLine             cterm=italic        ctermfg=213     ctermbg=233
hi diffSubname          cterm=italic        ctermfg=171     ctermbg=233
hi diffAdded            cterm=NONE          ctermfg=11      ctermbg=bg
hi diffRemoved          cterm=NONE          ctermfg=204     ctermbg=bg
"hi diffOnly
"hi diffIdentical
"hi diffDiffer
"hi diffBDiffer
"hi diffIsA
"hi diffNoEOL
"hi diffCommon
"hi diffChanged
"hi diffComment

" vimhelp
"
hi helpHyperTextEntry   cterm=bold,italic   ctermfg=39      ctermbg=NONE
hi helpStar             cterm=italic        ctermfg=9       ctermbg=NONE
hi helpBar              cterm=NONE          ctermfg=123     ctermbg=NONE
hi helpBacktick         cterm=NONE          ctermfg=187     ctermbg=NONE

" vimhelp: eg embdedded examples are surrounded by < > but
" looks klunky if they're visible (they appear everywhere)
"
hi link helpIgnore      Ignore

" python
"
hi pythonConditional    cterm=NONE          ctermfg=184     ctermbg=NONE

" vimscript: overrides
"
hi vimAutoCmdSfxList    cterm=NONE          ctermfg=11      ctermbg=bg
hi vimCmdSep            cterm=NONE          ctermfg=11      ctermbg=bg
hi vimComment           cterm=italic        ctermfg=111     ctermbg=bg
hi vimCommentString     cterm=italic        ctermfg=108     ctermbg=bg
hi vimGroupList         cterm=NONE          ctermfg=45      ctermbg=bg
hi vimSynRegion         cterm=NONE          ctermfg=203     ctermbg=bg
hi vimSynPatMod         cterm=NONE          ctermfg=152     ctermbg=bg
hi vimMapLhs            cterm=bold,italic   ctermfg=207     ctermbg=bg
hi vimNormCmds          cterm=NONE          ctermfg=85      ctermbg=bg
hi vimGlobal            cterm=NONE          ctermfg=27      ctermbg=bg
hi vimSubstPat          cterm=NONE          ctermfg=206     ctermbg=bg
hi vimSubstRep4         cterm=NONE          ctermfg=155     ctermbg=bg

" vimscript: links to other groups
"
hi link vimHiCtermColor Number

" vimscript: too many false positives with isCommand makes it
" unreadable so treat them like statements
"
hi link vimIsCommand    vimStatement

" vimscript: smemshNotYet-vetted clears
"
hi clear vimExecute
hi clear vimFuncBody
hi clear vimFunction
hi clear vimHiKeyList
hi clear vimHiLink
hi clear vimOperParen
hi clear vimSet
hi clear vimMapRhs
hi clear vimSetEqual
hi clear vimCommentTitleLeader
hi clear vimUserCmd
hi clear vimAutoCmdSpace
hi clear vimSynKeyRegion
hi clear vimSynMatchRegion
hi clear vimClusterName
hi clear vimSyncLines
hi clear vimFiletype
hi clear vimAugroup
hi clear vimFilter
hi clear vimEcho

" vimscript: suboptimal clears where we could do something better
"
hi clear vimMapRhsExtend

" perl: smemshNotYet-vetted clears
"
hi clear perlVarBlock
hi clear perlVarMember
hi clear perlStatementIndirObjWrap

""" LINKS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" remove links (below) when overriding with a specific color (above)
"

hi link vimTodo                         Todo
hi link vimCommand                      Statement
hi link vimOption                       PreProc
hi link vimErrSetting                   vimError
hi link vimAutoEvent                    Type
hi link vimGroup                        Type
hi link vimHLGroup                      vimGroup
hi link vimFuncName                     Function
hi link vimSubst                        vimCommand
hi link vimNumber                       Number
hi link vimAddress                      vimMark
hi link vimAutoCmd                      vimCommand
hi link vimLet                          vimCommand
hi link vimMap                          vimCommand
hi link vimMark                         Number
hi link vimSyntax                       vimCommand
hi link vimVar                          Identifier
hi link vimFBVar                        vimVar
hi link vimInsert                       vimString
hi link vimBehaveModel                  vimBehave
hi link vimBehaveError                  vimError
hi link vimBehave                       vimCommand
hi link vimFTCmd                        vimCommand
hi link vimFTOption                     vimSynType
hi link vimFTError                      vimError
hi link vimNotFunc                      vimCommand
hi link vimFunctionError                vimError
hi link vimLineComment                  vimComment
hi link vimSpecFile                     Identifier
hi link vimOper                         Operator
hi link vimComment                      Comment
hi link vimString                       String
hi link vimRegister                     SpecialChar
hi link vimCmplxRepeat                  SpecialChar
hi link vimNotation                     Special
hi link vimCtrlChar                     SpecialChar
hi link vimFuncVar                      Identifier
hi link vimContinue                     Special
hi link vimAugroupKey                   vimCommand
hi link vimEnvvar                       PreProc
hi link vimFunc                         vimError
hi link vimParenSep                     Delimiter
hi link vimSep                          Delimiter
hi link vimOperError                    Error
hi link vimFuncKey                      vimCommand
hi link vimFuncSID                      Special
hi link vimAbb                          vimCommand
hi link vimEchoHL                       vimCommand
hi link vimHighlight                    vimCommand
hi link vimNorm                         vimCommand
hi link vimUnmap                        vimMap
hi link vimPattern                      Type
hi link vimSpecFileMod                  vimSpecFile
hi link vimSetString                    vimString
hi link vimUserAttrb                    vimSpecial
hi link vimUserAttrbError               Error
hi link vimUserAttrbKey                 vimOption
hi link vimUserAttrbCmplt               vimSpecial
hi link vimUserCmdError                 Error
hi link vimUserAttrbCmpltFunc           Special
hi link vimPatSepErr                    vimPatSep
hi link vimPatSep                       SpecialChar
hi link vimPatSepZ                      vimPatSep
hi link vimPatSepZone                   vimString
hi link vimPatSepR                      vimPatSep
hi link vimNotPatSep                    vimString
hi link vimStringCont                   vimString
hi link vimSubstTwoBS                   vimString
hi link vimSubstSubstr                  SpecialChar
hi link vimSubst1                       vimSubst
hi link vimSubstDelim                   Delimiter
hi link vimSubstFlagErr                 vimError
hi link vimCollClassErr                 vimError
hi link vimSubstFlags                   Special
hi link vimMarkNumber                   vimNumber
hi link vimPlainMark                    vimMark
hi link vimPlainRegister                vimRegister
hi link vimSetMod                       vimOption
hi link vimSetSep                       Statement
hi link vimMapMod                       vimBracket
hi link vimEchoHLNone                   vimGroup
hi link vimMapBang                      vimCommand
hi link vimMapModKey                    vimFuncSID
hi link vimMapModErr                    vimError
hi link vimMenuName                     PreProc
hi link vimMenuMod                      vimMapMod
hi link vimMenuNameMore                 vimMenuName
hi link vimBracket                      Delimiter
hi link vimUserFunc                     Normal
hi link vimElseIfErr                    Error
hi link vimBufnrWarn                    vimWarn
hi link vimGroupSpecial                 Special
hi link vimSynError                     Error
hi link vimSynContains                  vimSynOption
hi link vimSynKeyContainedin            vimSynContains
hi link vimSynNextgroup                 vimSynOption
hi link vimSynType                      vimSpecial
hi link vimSynCase                      Type
hi link vimSynCaseError                 vimError
hi link vimGroupName                    vimGroup
hi link vimGroupAdd                     vimSynOption
hi link vimGroupRem                     vimSynOption
hi link vimSynKeyOpt                    vimSynOption
hi link vimMtchComment                  vimComment
hi link vimSynMtchOpt                   vimSynOption
hi link vimSynRegPat                    vimString
hi link vimSynPatRange                  vimString
hi link vimSynNotPatRange               vimSynRegPat
hi link vimSynRegOpt                    vimSynOption
hi link vimSynReg                       Type
hi link vimSynMtchGrp                   vimSynOption
hi link vimSyncC                        Type
hi link vimSyncError                    Error
hi link vimSyncGroupName                vimGroupName
hi link vimSyncKey                      Type
hi link vimSyncGroup                    vimGroupName
hi link vimSyncNone                     Type
hi link vimHiClear                      vimHighlight
hi link vimHiCtermError                 vimError
hi link vimHiGroup                      vimGroupName
hi link vimHiAttrib                     PreProc
hi link vimFgBgAttrib                   vimHiAttrib
hi link vimHiAttribList                 vimError
hi link vimHiGuiRgb                     vimNumber
hi link vimHiTerm                       Type
hi link vimHiCTerm                      vimHiTerm
hi link vimHiStartStop                  vimHiTerm
hi link vimHiCtermFgBg                  vimHiTerm
hi link vimHiGui                        vimHiTerm
hi link vimHiGuiFont                    vimHiTerm
hi link vimHiGuiFgBg                    vimHiTerm
hi link vimHiKeyError                   vimError
hi link vimHiNmbr                       Number
hi link vimCommentTitle                 PreProc
hi link vimScriptDelim                  Comment
hi link vimSearchDelim                  Statement
hi link vimSearch                       vimString

hi link luaTodo                         Todo
hi link luaComment                      Comment
hi link luaParenError                   Error
hi link luaSpecial                      SpecialChar
hi link luaElse                         Conditional
hi link luaIn                           Operator
hi link luaStatement                    Statement
hi link luaTable                        Structure
hi link luaBraceError                   Error
hi link luaError                        Error
hi link luaFunction                     Function
hi link luaCond                         Conditional
hi link luaRepeat                       Repeat
hi link luaLabel                        Label
hi link luaOperator                     Operator
hi link luaConstant                     Constant
hi link luaString2                      String
hi link luaString                       String
hi link luaNumber                       Number
hi link luaFunc                         Identifier
hi link luaFor                          Repeat

hi link podCmdText                      String
hi link podCommand                      Statement
hi link podOverIndent                   Number
hi link podForKeywd                     Identifier
hi link podFormat                       Identifier
hi link podVerbatimLine                 PreProc
hi link podSpecial                      Identifier
hi link podEscape                       String
hi link podEscape2                      Number

hi link perlTodo                        Todo
hi link perlPOD                         perlComment
hi link perlConditional                 Conditional
hi link perlElseIfError                 Error
hi link perlRepeat                      Repeat
hi link perlOperator                    Operator
hi link perlControl                     PreProc
hi link perlStatementStorage            perlStatement
hi link perlStatementControl            perlStatement
hi link perlStatementScalar             perlStatement
hi link perlStatementRegexp             perlStatement
hi link perlStatementNumeric            perlStatement
hi link perlStatementList               perlStatement
hi link perlStatementHash               perlStatement
hi link perlStatementIOfunc             perlStatement
hi link perlStatementFiledesc           perlStatement
hi link perlStatementVector             perlStatement
hi link perlStatementFiles              perlStatement
hi link perlStatementFlow               perlStatement
hi link perlStatementInclude            perlStatement
hi link perlStatementProc               perlStatement
hi link perlStatementSocket             perlStatement
hi link perlStatementIPC                perlStatement
hi link perlStatementNetwork            perlStatement
hi link perlStatementPword              perlStatement
hi link perlStatementTime               perlStatement
hi link perlStatementMisc               perlStatement
hi link perlStatementIndirObj           perlStatement
hi link perlLabel                       Label
hi link perlVarPlain                    perlIdentifier
hi link perlVarNotInMatches             perlIdentifier
hi link perlVarSlash                    perlIdentifier
hi link perlPackageRef                  perlType
hi link perlVarSimpleMember             perlIdentifier
hi link perlMethod                      perlIdentifier
hi link perlVarPlain2                   perlIdentifier
hi link perlFunctionName                perlIdentifier
hi link perlShellCommand                perlString
hi link perlFloat                       Float
hi link perlNumber                      Number
hi link perlStringUnexpanded            perlString
hi link perlString                      String
hi link perlQQ                          perlString
hi link perlArrow                       perlIdentifier
hi link perlVarSimpleMemberName         perlString
hi link perlFiledescRead                perlIdentifier
hi link perlFiledescStatement           perlIdentifier
hi link perlSpecialString               perlSpecial
hi link perlSpecialStringU2             perlString
hi link perlSpecialStringU              perlSpecial
hi link perlSpecialMatch                perlSpecial
hi link perlNotEmptyLine                Error
hi link perlMatchStartEnd               perlStatement
hi link perlVStringV                    perlStringStartEnd
hi link perlParensSQ                    perlString
hi link perlBracketsSQ                  perlString
hi link perlBracesSQ                    perlString
hi link perlAnglesSQ                    perlString
hi link perlParensDQ                    perlString
hi link perlBracketsDQ                  perlString
hi link perlBracesDQ                    perlString
hi link perlAnglesDQ                    perlString
hi link perlMatch                       perlString
hi link perlComment                     Comment
hi link perlSubstitutionGQQ             perlString
hi link perlSubstitutionSQ              perlString
hi link perlTranslationGQ               perlString
hi link perlStringStartEnd              perlString
hi link perlHereDoc                     perlString
hi link perlStatementPackage            perlStatement
hi link perlPackageDecl                 perlType
hi link perlSubError                    Error
hi link perlSubAttributesCont           perlSubAttributes
hi link perlSubAttributes               PreProc
hi link perlSubPrototypeError           Error
hi link perlSubPrototype                Type
hi link perlSubName                     Function
hi link perlFunction                    Keyword
hi link perlFunctionPRef                perlType
hi link perlSharpBang                   PreProc
hi link perlFormatName                  perlIdentifier
hi link perlFormatField                 perlString
hi link perlDATA                        perlComment
hi link perlInclude                     Include
hi link perlSpecial                     Special
hi link perlCharacter                   Character
hi link perlType                        Type
hi link perlIdentifier                  Identifier
hi link perlStatement                   Statement
hi link perlList                        perlStatement
hi link perlMisc                        perlStatement
hi link perlStorageClass                perlType
hi link perlSpecialAscii                perlSpecial
hi link perlSpecialDollar               perlSpecial

hi link rubyConditional                 Conditional
hi link rubyExceptional                 rubyConditional
hi link rubyMethodExceptional           rubyDefine
hi link rubyTodo                        Todo
hi link rubyStringEscape                Special
hi link rubyQuoteEscape                 rubyStringEscape
hi link rubyInterpolationDelimiter      Delimiter
hi link rubyInstanceVariable            rubyIdentifier
hi link rubyClassVariable               rubyIdentifier
hi link rubyGlobalVariable              rubyIdentifier
hi link rubyPredefinedVariable          rubyPredefinedIdentifier
hi link rubyInvalidVariable             Error
hi link rubyNoInterpolation             rubyString
hi link rubyString                      String
hi link rubyRegexpSpecial               Special
hi link rubyRegexpComment               Comment
hi link rubyRegexpCharClass             rubyRegexpSpecial
hi link rubyRegexpEscape                rubyRegexpSpecial
hi link rubyRegexpQuantifier            rubyRegexpSpecial
hi link rubyRegexpAnchor                rubyRegexpSpecial
hi link rubyRegexpDot                   rubyRegexpCharClass
hi link rubyASCIICode                   Character
hi link rubyInteger                     Number
hi link rubyFloat                       Float
hi link rubyConstant                    Type
hi link rubySymbol                      Constant
hi link rubyBlockParameter              rubyIdentifier
hi link rubyPredefinedConstant          rubyPredefinedIdentifier
hi link rubyRegexpDelimiter             rubyStringDelimiter
hi link rubyRegexp                      rubyString
hi link rubyStringDelimiter             Delimiter
hi link rubySymbolDelimiter             rubyStringDelimiter
hi link rubyHeredoc                     rubyString
hi link rubyBoolean                     Boolean
hi link rubyPseudoVariable              Constant
hi link rubyOperator                    Operator
hi link rubyFunction                    Function
hi link rubyControl                     Statement
hi link rubyKeyword                     Keyword
hi link rubyBeginEnd                    Statement
hi link rubyDefine                      Define
hi link rubyClass                       rubyDefine
hi link rubyModule                      rubyDefine
hi link rubyConditionalModifier         rubyConditional
hi link rubyRepeatModifier              rubyRepeat
hi link rubyRepeat                      Repeat
hi link rubyOptionalDo                  rubyRepeat
hi link rubyAccess                      Statement
hi link rubyAttribute                   Statement
hi link rubyEval                        Statement
hi link rubyException                   Exception
hi link rubyInclude                     Include
hi link rubySharpBang                   PreProc
hi link rubySpaceError                  rubyError
hi link rubyComment                     Comment
hi link rubyDocumentation               Comment
hi link rubyDataDirective               Delimiter
hi link rubyData                        Comment
hi link rubyIdentifier                  Identifier
hi link rubyPredefinedIdentifier        rubyIdentifier
hi link rubyError                       Error

hi link pythonStatement                 Statement
hi link pythonFunction                  Function
hi link pythonRepeat                    Repeat
hi link pythonOperator                  Operator
hi link pythonException                 Exception
hi link pythonInclude                   Include
hi link pythonDecorator                 Define
hi link pythonTodo                      Todo
hi link pythonComment                   Comment
hi link pythonQuotes                    String
hi link pythonEscape                    Special
hi link pythonString                    String
hi link pythonTripleQuotes              pythonQuotes
hi link pythonDoctest                   Special
hi link pythonRawString                 String
hi link pythonNumber                    Number
hi link pythonBuiltin                   Function
hi link pythonExceptions                Structure
hi link pythonDoctestValue              Define
hi link pythonDot                       Operator

hi link tclCommand                      Statement
hi link tclProcCommand                  Type
hi link tclConditional                  Conditional
hi link tclLabel                        Label
hi link tclRepeat                       Repeat
hi link tcltkSwitch                     Special
hi link tcltkWidgetSwitch               Special
hi link tclVarRef                       Identifier
hi link tclSpecial                      Special
hi link tclExpand                       Special
hi link tcltkWidgetColor                Structure
hi link tclLineContinue                 WarningMsg
hi link tclString                       String
hi link tclNumber                       Number
hi link tcltkCommandColor               Statement
hi link tcltkPackConfColor              Identifier
hi link tcltkPackConfSwitch             Special
hi link tcltkNamespaceSwitch            Special
hi link tcltkMaths                      Special
hi link tcltkPackSwitch                 Special
hi link tcltkStringSwitch               Special
hi link tcltkArraySwitch                Special
hi link tcltkLsortSwitch                Special
hi link tclTodo                         Todo
hi link tclComment                      Comment
hi link tclError                        Error

hi link vimEmbedError                   vimError
hi link vimError                        Error
hi link vimKeyCodeError                 vimError
hi link vimWarn                         WarningMsg
hi link vimAuHighlight                  vimHighlight
hi link vimAutoCmdOpt                   vimOption
hi link vimAutoSet                      vimCommand
hi link vimCondHL                       vimCommand
hi link vimElseif                       vimCondHL
hi link vimFold                         Folded
hi link vimSynOption                    Special
hi link vimHLMod                        PreProc
hi link vimKeyCode                      vimSpecFile
hi link vimKeyword                      Statement
hi link vimSpecial                      Type
hi link vimStatement                    Statement

hi link helpHeadline                    Statement
hi link helpSectionDelim                PreProc
hi link helpExample                     Comment
hi link helpHyperTextJump               Identifier
hi link helpVim                         Identifier
hi link helpOption                      Type
hi link helpCommand                     Comment
hi link helpHeader                      PreProc
hi link helpNote                        Todo
hi link helpSpecial                     Special
hi link helpNotVi                       Special
hi link helpComment                     Comment
hi link helpConstant                    Constant
hi link helpString                      String
hi link helpCharacter                   Character
hi link helpNumber                      Number
hi link helpBoolean                     Boolean
hi link helpFloat                       Float
hi link helpIdentifier                  Identifier
hi link helpFunction                    Function
hi link helpStatement                   Statement
hi link helpConditional                 Conditional
hi link helpRepeat                      Repeat
hi link helpLabel                       Label
hi link helpOperator                    Operator
hi link helpKeyword                     Keyword
hi link helpException                   Exception
hi link helpPreProc                     PreProc
hi link helpInclude                     Include
hi link helpDefine                      Define
hi link helpMacro                       Macro
hi link helpPreCondit                   PreCondit
hi link helpType                        Type
hi link helpStorageClass                StorageClass
hi link helpStructure                   Structure
hi link helpTypedef                     Typedef
hi link helpSpecialChar                 SpecialChar
hi link helpTag                         Tag
hi link helpDelimiter                   Delimiter
hi link helpSpecialComment              SpecialComment
hi link helpDebug                       Debug
hi link helpUnderlined                  Underlined
hi link helpError                       Error
hi link helpTodo                        Todo
hi link helpURL                         String

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" everything below originally set to "hi clear <group>" after loading elflord

hi link VisualNOS smemshNotYet

hi link vimStdPlugin smemshNotYet
hi link vimExtCmd smemshNotYet
hi link vimRegion smemshNotYet
hi link vimSynLine smemshNotYet
hi link vimAugroupError smemshNotYet
hi link vimAugroupSyncA smemshNotYet
hi link vimIf smemshNotYet
hi link vimFuncBlank smemshNotYet
hi link vimEscapeBrace smemshNotYet
hi link vimSubstRep smemshNotYet
hi link vimSubstRange smemshNotYet
hi link vimPatRegion smemshNotYet
hi link vimCollection smemshNotYet
hi link vimCollClass smemshNotYet
hi link vimAutoEventList smemshNotYet
hi link vimMenuBang smemshNotYet
hi link vimMenuPriority smemshNotYet
hi link vimMenuMap smemshNotYet
hi link vimMenuRhs smemshNotYet
hi link vimAuSyntax smemshNotYet
hi link vimSynMtchCchar smemshNotYet
hi link vimSynMtchGroup smemshNotYet
hi link vimSyncMatch smemshNotYet
hi link vimSyncLinebreak smemshNotYet
hi link vimSyncLinecont smemshNotYet
hi link vimSyncRegion smemshNotYet
hi link vimHiBang smemshNotYet
hi link vimHiFontname smemshNotYet
hi link vimHiGuiFontname smemshNotYet
hi link vimHiTermcap smemshNotYet
hi link vimLuaRegion smemshNotYet
hi link vimPerlRegion smemshNotYet
hi link vimRubyRegion smemshNotYet
hi link vimPythonRegion smemshNotYet
hi link vimTclRegion smemshNotYet
hi link vimTclScript smemshNotYet

hi link luaInnerComment smemshNotYet
hi link luaIfThen smemshNotYet
hi link luaElseifThen smemshNotYet
hi link luaThenEnd smemshNotYet
hi link luaBlock smemshNotYet
hi link luaLoopBlock smemshNotYet
hi link luaParen smemshNotYet
hi link luaTableBlock smemshNotYet
hi link luaFunctionBlock smemshNotYet

hi link podBoldItalic smemshNotYet
hi link podBoldOpen smemshNotYet
hi link podBoldAlternativeDelimOpen smemshNotYet
hi link podItalicBold smemshNotYet
hi link podItalicOpen smemshNotYet
hi link podItalicAlternativeDelimOpen smemshNotYet
hi link podNoSpaceOpen smemshNotYet
hi link podNoSpaceAlternativeDelimOpen smemshNotYet
hi link podIndexOpen smemshNotYet
hi link podIndexAlternativeDelimOpen smemshNotYet
hi link podBold smemshNotYet
hi link podBoldAlternativeDelim smemshNotYet
hi link podItalic smemshNotYet
hi link podItalicAlternativeDelim smemshNotYet

hi link perlBraces smemshNotYet
hi link perlFakeGroup smemshNotYet
hi link perlFiledescStatementNocomma smemshNotYet
hi link perlFiledescStatementComma smemshNotYet
hi link perlVarBlock2 smemshNotYet
hi link perlPackageConst smemshNotYet

hi link perlAutoload smemshNotYet
hi link perlFormat smemshNotYet
hi link perlSync smemshNotYet
hi link perlSyncPOD smemshNotYet

hi link rubyInterpolation smemshNotYet
hi link rubyDelimEscape smemshNotYet
hi link rubyNestedParentheses smemshNotYet
hi link rubyNestedCurlyBraces smemshNotYet
hi link rubyNestedAngleBrackets smemshNotYet
hi link rubyNestedSquareBrackets smemshNotYet
hi link rubyRegexpParens smemshNotYet
hi link rubyRegexpBrackets smemshNotYet
hi link rubyLocalVariableOrMethod smemshNotYet
hi link rubyBlockArgument smemshNotYet
hi link rubyBlockParameterList smemshNotYet
hi link rubyHeredocStart smemshNotYet
hi link rubyAliasDeclaration2 smemshNotYet
hi link rubyAliasDeclaration smemshNotYet
hi link rubyMethodDeclaration smemshNotYet
hi link rubyClassDeclaration smemshNotYet
hi link rubyModuleDeclaration smemshNotYet
hi link rubyMethodBlock smemshNotYet
hi link rubyBlock smemshNotYet
hi link rubyDoBlock smemshNotYet
hi link rubyCurlyBlockDelimiter smemshNotYet
hi link rubyCurlyBlock smemshNotYet
hi link rubyArrayDelimiter smemshNotYet
hi link rubyArrayLiteral smemshNotYet
hi link rubyBlockExpression smemshNotYet
hi link rubyCaseExpression smemshNotYet
hi link rubyConditionalExpression smemshNotYet
hi link rubyOptionalDoLine smemshNotYet
hi link rubyRepeatExpression smemshNotYet
hi link rubyMultilineComment smemshNotYet
hi link rubyKeywordAsMethod smemshNotYet

hi link pythonSpaceError smemshNotYet
hi link pythonSync smemshNotYet

hi link tclVars smemshNotYet
hi link tclBoolean smemshNotYet
hi link tcltkWidget smemshNotYet
hi link tcltkCommand smemshNotYet
hi link tcltkPackConf smemshNotYet
hi link tcltlWidgetSwitch smemshNotYet
hi link tclEmbeddedStatement smemshNotYet

hi link helpNormal smemshNotYet
hi link helpGraphic smemshNotYet
hi link helpLeadBlank smemshNotYet
