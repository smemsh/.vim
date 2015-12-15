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
"
hi Normal
        \ cterm=NONE
        \ ctermfg=252
        \ ctermbg=0

"""

hi Comment              cterm=italic        ctermfg=111     ctermbg=bg
hi Cursor               cterm=NONE          ctermfg=15      ctermbg=0
hi SubtleWarningMsg     cterm=NONE          ctermfg=fg      ctermbg=12

hi SpecialKey           cterm=NONE          ctermfg=224     ctermbg=0
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

hi DiffAdd              cterm=NONE          ctermfg=252     ctermbg=18
hi DiffChange           cterm=NONE          ctermfg=252     ctermbg=90
hi DiffDelete           cterm=NONE          ctermfg=21      ctermbg=30
hi DiffText             cterm=NONE          ctermfg=252     ctermbg=88

hi SignColumn           cterm=NONE          ctermfg=51      ctermbg=250
hi Conceal              cterm=NONE          ctermfg=252     ctermbg=248

hi SpellBad             cterm=NONE          ctermfg=224     ctermbg=0
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

hi Constant             cterm=NONE          ctermfg=129     ctermbg=bg
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
hi Ignore               cterm=NONE          ctermfg=16      ctermbg=bg
hi Error                cterm=bold,italic   ctermfg=227     ctermbg=196
hi Todo                 cterm=bold,italic   ctermfg=52      ctermbg=226

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
hi link vimUserCommand                  vimCommand
hi link vimPattern                      Type
hi link vimSpecFileMod                  vimSpecFile
hi link vimSetString                    vimString
hi link vimUserAttrb                    vimSpecial
hi link vimUserAttrbError               Error
hi link vimUserAttrbKey                 vimOption
hi link vimUserAttrbCmplt               vimSpecial
hi link vimUserCmdError                 Error
hi link vimUserAttrbCmpltFunc           Special
hi link vimCommentString                vimString
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
hi link pythonConditional               Conditional
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
hi link helpIgnore                      Ignore
hi link helpExample                     Comment
hi link helpBar                         Ignore
hi link helpStar                        Ignore
hi link helpHyperTextJump               Identifier
hi link helpHyperTextEntry              String
hi link helpBacktick                    Ignore
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

hi clear VisualNOS

hi clear vimStdPlugin
hi clear vimGlobal
hi clear vimIsCommand
hi clear vimExtCmd
hi clear vimFilter
hi clear vimSet
hi clear vimUserCmd
hi clear vimCmdSep
hi clear vimFiletype
hi clear vimAugroup
hi clear vimExecute
hi clear vimFunction
hi clear vimOperParen
hi clear vimRegion
hi clear vimSynLine
hi clear vimAugroupError
hi clear vimAugroupSyncA
hi clear vimEcho
hi clear vimIf
hi clear vimFuncBody
hi clear vimFuncBlank
hi clear vimEscapeBrace
hi clear vimSetEqual
hi clear vimSubstRep
hi clear vimSubstRange
hi clear vimPatRegion
hi clear vimCollection
hi clear vimSubstPat
hi clear vimSubstRep4
hi clear vimCollClass
hi clear vimMapLhs
hi clear vimAutoCmdSpace
hi clear vimAutoEventList
hi clear vimAutoCmdSfxList
hi clear vimMapRhs
hi clear vimMapRhsExtend
hi clear vimMenuBang
hi clear vimMenuPriority
hi clear vimMenuMap
hi clear vimMenuRhs
hi clear vimNormCmds
hi clear vimGroupList
hi clear vimAuSyntax
hi clear vimClusterName
hi clear vimSynKeyRegion
hi clear vimSynMatchRegion
hi clear vimSynMtchCchar
hi clear vimSynMtchGroup
hi clear vimSynRegion
hi clear vimSynPatMod
hi clear vimSyncLines
hi clear vimSyncMatch
hi clear vimSyncLinebreak
hi clear vimSyncLinecont
hi clear vimSyncRegion
hi clear vimHiLink
hi clear vimHiKeyList
hi clear vimHiBang
hi clear vimHiCtermColor
hi clear vimHiFontname
hi clear vimHiGuiFontname
hi clear vimHiTermcap
hi clear vimCommentTitleLeader
hi clear vimLuaRegion
hi clear vimPerlRegion
hi clear vimRubyRegion
hi clear vimPythonRegion
hi clear vimTclRegion
hi clear vimTclScript

hi clear luaInnerComment
hi clear luaIfThen
hi clear luaElseifThen
hi clear luaThenEnd
hi clear luaBlock
hi clear luaLoopBlock
hi clear luaParen
hi clear luaTableBlock
hi clear luaFunctionBlock

hi clear podBoldItalic
hi clear podBoldOpen
hi clear podBoldAlternativeDelimOpen
hi clear podItalicBold
hi clear podItalicOpen
hi clear podItalicAlternativeDelimOpen
hi clear podNoSpaceOpen
hi clear podNoSpaceAlternativeDelimOpen
hi clear podIndexOpen
hi clear podIndexAlternativeDelimOpen
hi clear podBold
hi clear podBoldAlternativeDelim
hi clear podItalic
hi clear podItalicAlternativeDelim

hi clear perlBraces
hi clear perlFakeGroup
hi clear perlFiledescStatementNocomma
hi clear perlFiledescStatementComma
hi clear perlStatementIndirObjWrap
hi clear perlVarMember
hi clear perlVarBlock
hi clear perlVarBlock2
hi clear perlPackageConst

hi clear perlAutoload
hi clear perlFormat
hi clear perlSync
hi clear perlSyncPOD

hi clear rubyInterpolation
hi clear rubyDelimEscape
hi clear rubyNestedParentheses
hi clear rubyNestedCurlyBraces
hi clear rubyNestedAngleBrackets
hi clear rubyNestedSquareBrackets
hi clear rubyRegexpParens
hi clear rubyRegexpBrackets
hi clear rubyLocalVariableOrMethod
hi clear rubyBlockArgument
hi clear rubyBlockParameterList
hi clear rubyHeredocStart
hi clear rubyAliasDeclaration2
hi clear rubyAliasDeclaration
hi clear rubyMethodDeclaration
hi clear rubyClassDeclaration
hi clear rubyModuleDeclaration
hi clear rubyMethodBlock
hi clear rubyBlock
hi clear rubyDoBlock
hi clear rubyCurlyBlockDelimiter
hi clear rubyCurlyBlock
hi clear rubyArrayDelimiter
hi clear rubyArrayLiteral
hi clear rubyBlockExpression
hi clear rubyCaseExpression
hi clear rubyConditionalExpression
hi clear rubyOptionalDoLine
hi clear rubyRepeatExpression
hi clear rubyMultilineComment
hi clear rubyKeywordAsMethod

hi clear pythonSpaceError
hi clear pythonSync

hi clear tclVars
hi clear tclBoolean
hi clear tcltkWidget
hi clear tcltkCommand
hi clear tcltkPackConf
hi clear tcltlWidgetSwitch
hi clear tclEmbeddedStatement

hi clear helpNormal
hi clear helpGraphic
hi clear helpLeadBlank
