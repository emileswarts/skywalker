" Maintainer:   Emile Swarts
" Last Change:  2012/10/04
" URL: https://github.com/emileswarts/velvet-vim-colourscheme
"
set background=dark
hi clear

if version > 580
    " You gotta upgrade
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "velvet"

" COLOURS {{{

let s:vc = {}
let s:vc.plain 				= ['ffffff', 15]
let s:vc.white 				= ['ffffff', 15]
let s:vc.brightgrey   	= ['d9cec3', 252]
let s:vc.lightgrey    	= ['998f84', 245]
let s:vc.igrey 			= ['cccccc', 242]
let s:vc.mediumgrey   	= ['666462', 241]
let s:vc.deepgrey     	= ['45413b', 238]
let s:vc.deepergrey   	= ['35322d', 236]
let s:vc.darkgrey     	= ['242321', 235]
let s:vc.blackgrey    	= ['1c1b1a', 233]
let s:vc.blackestgrey 	= ['141413', 232]
let s:vc.black 		    = ['000000', 16]
let s:vc.pink 			= ['000000', 197]

let s:vc.pinkpurple     	= ['998f84', 165]
let s:vc.lightlightpurple   = ['998f84', 135]
let s:vc.lightpurple    	= ['998f84', 93]
let s:vc.brightpurple   	= ['998f84', 98]
let s:vc.darkpurple    		= ['998f84', 57]

let s:vc.brightorange   	= ['998f84', 166]
let s:vc.brightred 			= ['fade3e', 196]
let s:vc.brightaqua 		= ['ffa724', 45]
let s:vc.army 				= ['f4cf86', 101]
let s:vc.armylight 			= ['f4cf86', 187]
let s:vc.aqua 				= ['aeee00', 87]

let s:vc.brightyellow 		= ['88633f', 220]

" }}}

if ! exists("g:velvet_black_background")
    let g:velvet_black_background = 0
endif

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:vc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:vc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:vc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Configuration Options {{{

" }}}
" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{
" General/UI {{{

call s:HL('Normal', 'plain', 'blackestgrey')
call s:HL('Folded', 'mediumgrey', 'bg', 'none')
call s:HL('VertSplit', 'lightgrey', 'bg', 'none')
call s:HL('CursorLine',   '', 'blackgrey', 'none')
call s:HL('CursorColumn', '', 'blackgrey')
call s:HL('ColorColumn',  '', 'darkgrey')
call s:HL('MatchParen', 'brightred', 'blackestgrey', 'bold')
call s:HL('NonText',    'deepgrey', 'bg')
call s:HL('SpecialKey', 'deepgrey', 'bg')
call s:HL('Visual',    '',  'deepgrey')
call s:HL('VisualNOS', '',  'deepgrey')
call s:HL('Search',    'brightred', 'blackestgrey', 'bold')
call s:HL('IncSearch', 'brightorange', 'blackestgrey',    'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'black', 'brightaqua',     'bold')
call s:HL('StatusLineNC', 'brightred', 'deepgrey', 'bold')
call s:HL('Directory', 'brightred', '', 'bold')
call s:HL('Title', 'brightorange')
call s:HL('ErrorMsg',   'brightpurple',       'bg', 'bold')
call s:HL('MoreMsg',    'brightred',   '',   'bold')
call s:HL('ModeMsg',    'armylight', '',   'bold')
call s:HL('Question',   'armylight', '',   'bold')
call s:HL('WarningMsg', 'brightred',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{
call s:HL('LineNr',     'mediumgrey', 'blackestgrey')
call s:HL('SignColumn', '',             'blackestgrey')
call s:HL('FoldColumn', 'mediumgrey', 'blackestgrey')

" }}}
" Cursor {{{

call s:HL('Cursor',  'black', 'brightaqua', 'bold')
call s:HL('vCursor', 'black', 'brightaqua', 'bold')
call s:HL('iCursor', 'black', 'brightaqua', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'blackestgrey')
call s:HL('Todo',           'white', 'bg', 'bold')
call s:HL('SpecialComment', 'white', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'armylight')

" Control flow stuff is brightpurple.
call s:HL('Statement',   'brightpurple', '', 'bold')
call s:HL('Keyword',     'brightpurple', '', 'bold')
call s:HL('Conditional', 'brightpurple', '', 'bold')
call s:HL('Operator',    'brightpurple', '', 'none')
call s:HL('Label',       'brightpurple', '', 'none')
call s:HL('Repeat',      'brightpurple', '', 'none')

" Functions and variable declarations are aqua, because plain looks weird.
call s:HL('Identifier', 'lightpurple', '', 'none')
call s:HL('Function',   'lightpurple', '', 'none')

" Preprocessor stuff is aqua, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'brightyellow', '', 'none')
call s:HL('Macro',     'brightyellow', '', 'none')
call s:HL('Define',    'brightorange', '', 'none')
call s:HL('PreCondit', 'brightyellow', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'brightorange', '', 'bold')
call s:HL('Character', 'brightorange', '', 'bold')
call s:HL('Boolean',   'brightorange', '', 'bold')

call s:HL('Number', 'brightorange', '', 'bold')
call s:HL('Float',  'brightorange', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'brightorange', '', 'bold')

call s:HL('Type', 'brightorange', '', 'none')
call s:HL('StorageClass', 'brightpurple', '', 'none')
call s:HL('Structure', 'brightpurple', '', 'none')
call s:HL('Typedef', 'brightpurple', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'aqua', '', 'bold')

" Misc
call s:HL('Error',  'white',   'brightpurple', 'bold')
call s:HL('Debug',  'white',   '',      'bold')
call s:HL('Ignore', 'igrey', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergrey')
call s:HL('PmenuSel', 'black', 'brightaqua', 'bold')
call s:HL('PmenuSbar', '', 'deepergrey')
call s:HL('PmenuThumb', 'brightgrey')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'black', 'black')
call s:HL('DiffAdd',    '',     'deepergrey')
call s:HL('DiffChange', '',     'darkgrey')
call s:HL('DiffText',   'white', 'deepergrey', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'brightred', 'bg', 'undercurl,bold', 'brightred')
    call s:HL('SpellBad', 'black', '', 'undercurl', 'brightorange')
    call s:HL('SpellLocal', '', '', 'undercurl', 'brightred')
    call s:HL('SpellRare', '', '', 'undercurl', 'brightred')
endif

" }}}

" }}}
" Plugins {{{
" CtrlP {{{
    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'white', 'darkpurple', 'bold')
    " the matched pattern
    call s:HL('CtrlPMatch', 'lightpurple', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgrey', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'deepgrey', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'black', 'brightaqua', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'black', 'brightaqua', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'black', 'brightaqua', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'black', 'brightaqua', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'brightaqua',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgrey', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'black', 'lightpurple')
call s:HL('InterestingWord2', 'black', 'aqua')
call s:HL('InterestingWord3', 'black', 'brightpurple')

" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=black guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" ShowMarks {{{
	call s:HL('ShowMarksHLl', 'brightaqua', 'blackgrey')
	call s:HL('ShowMarksHLu', 'brightaqua', 'blackgrey')
	call s:HL('ShowMarksHLo', 'brightaqua', 'blackgrey')
	call s:HL('ShowMarksHLm', 'brightaqua', 'blackgrey')
" }}}

" }}}
" Filetype-specific {{{
" Clojure {{{
	call s:HL('clojureSpecial',  'brightpurple', '', '')
	call s:HL('clojureDefn',     'brightpurple', '', '')
	call s:HL('clojureDefMacro', 'brightpurple', '', '')
	call s:HL('clojureDefine',   'brightpurple', '', '')
	call s:HL('clojureMacro',    'brightpurple', '', '')
	call s:HL('clojureCond',     'brightpurple', '', '')
	call s:HL('clojureKeyword', 'lightpurple', '', 'none')
	call s:HL('clojureFunc',   'brightred', '', 'none')
	call s:HL('clojureRepeat', 'brightred', '', 'none')
	call s:HL('clojureParen0', 'lightgrey', '', 'none')
	call s:HL('clojureAnonArg', 'white', '', 'bold')
" }}}
" CSS {{{
	call s:HL('cssColorProp', 'armylight', '', 'none')
	call s:HL('cssBoxProp', 'armylight', '', 'none')
	call s:HL('cssTextProp', 'armylight', '', 'none')
	call s:HL('cssRenderProp', 'armylight', '', 'none')
	call s:HL('cssGeneratedContentProp', 'armylight', '', 'none')
	call s:HL('cssValueLength', 'armylight', '', 'bold')
	call s:HL('cssColor', 'armylight', '', 'bold')
	call s:HL('cssBraces', 'lightgrey', '', 'none')
	call s:HL('cssIdentifier', 'lightpurple', '', 'bold')
	call s:HL('cssClassName', 'lightpurple', '', 'none')
" }}}
" Diff {{{

call s:HL('gitDiff', 'lightgrey', '',)

call s:HL('diffRemoved', 'brightred', '',)
call s:HL('diffAdded', 'aqua', '',)
call s:HL('diffFile', 'black', 'brightpurple', 'bold')
call s:HL('diffNewFile', 'black', 'brightpurple', 'bold')

call s:HL('diffLine', 'black', 'lightpurple', 'bold')
call s:HL('diffSubname', 'lightpurple', '', 'none')

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'lightpurple', 'bg', 'none')
call s:HL('htmlEndTag', 'lightpurple', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'brightpurple', '', 'bold')
call s:HL('htmlSpecialTagName', 'darkpurple', '', 'bold')
call s:HL('htmlSpecialChar',    'lightpurple',   '', 'none')

" Attributes
call s:HL('htmlArg', 'darkpurple', '', 'none')

" Stuff inside an <a> tag

call s:HL('htmlLink', 'lightgrey', '', 'underline')

" }}}
" Java {{{

call s:HL('javaClassDecl', 'brightpurple', '', 'bold')
call s:HL('javaScopeDecl', 'brightpurple', '', 'bold')
call s:HL('javaCommentTitle', 'igrey', '')
call s:HL('javaDocTags', 'white', '', 'none')
call s:HL('javaDocParam', 'brightred', '', '')

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'aqua', '', 'none')

" }}}
" Mail {{{

call s:HL('mailSubject', 'lightpurple', '', 'bold')
call s:HL('mailHeader', 'lightgrey', '', '')
call s:HL('mailHeaderKey', 'lightgrey', '', '')
call s:HL('mailHeaderEmail', 'white', '', '')
call s:HL('mailURL', 'armylight', '', 'underline')
call s:HL('mailSignature', 'igrey', '', 'none')

call s:HL('mailQuoted1', 'igrey', '', 'none')
call s:HL('mailQuoted2', 'brightred', '', 'none')
call s:HL('mailQuoted3', 'army', '', 'none')
call s:HL('mailQuoted4', 'lightpurple', '', 'none')
call s:HL('mailQuoted5', 'aqua', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'lightgrey', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgrey', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgrey', '', 'bold')
call s:HL('markdownListMarker', 'lightgrey', '', 'bold')
call s:HL('markdownItalic', 'white', '', 'bold')
call s:HL('markdownBold', 'white', '', 'bold')
call s:HL('markdownH1', 'lightpurple', '', 'bold')
call s:HL('markdownH2', 'aqua', '', 'bold')
call s:HL('markdownH3', 'aqua', '', 'none')
call s:HL('markdownH4', 'aqua', '', 'none')
call s:HL('markdownH5', 'aqua', '', 'none')
call s:HL('markdownH6', 'aqua', '', 'none')
call s:HL('markdownLinkText', 'armylight', '', 'underline')
call s:HL('markdownIdDeclaration', 'armylight')
call s:HL('markdownAutomaticLink', 'armylight', '', 'bold')
call s:HL('markdownUrl', 'armylight', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgrey', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgrey', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgrey', '', 'bold')
call s:HL('markdownCodeDelimiter', 'army', '', 'bold')
call s:HL('markdownCode', 'army', '', 'none')
call s:HL('markdownCodeBlock', 'army', '', 'none')

" }}}
" PHP {{{

call s:HL('phpRegionDelimiter', 'brightred', '', 'bold') " php tags
call s:HL('phpPropertySelector', 'brightorange', '', 'bold')
call s:HL('phpPropertySelectorInString', 'brightorange', '', 'bold')
call s:HL('phpOperator', 'brightorange', '', 'bold')
call s:HL('phpArrayPair', 'brightred', '', 'bold')
call s:HL('phpAssignByRef', 'brightred', '', 'bold')
call s:HL('phpRelation', 'brightred', '', 'bold') "need to check
call s:HL('phpMemberSelector', 'brightorange', '', 'bold')
call s:HL('phpUnknownSelector', 'brightorange', '', 'bold')
call s:HL('phpVarSelector', 'lightlightpurple', '', 'bold')
call s:HL('phpSemicolon', 'lightgrey', '', 'bold')
call s:HL('phpFunctions', 'brightorange', '', 'bold')
call s:HL('phpParent', 'white', '', 'bold')
" }}}
" MySQL {{{

	call s:HL('mysqlSpecial', 'brightaqua', '', 'bold')

" }}}
" Python {{{

	hi def link pythonOperator Operator
	call s:HL('pythonBuiltin',     'brightred')
	call s:HL('pythonBuiltinObj',  'brightred')
	call s:HL('pythonBuiltinFunc', 'brightred')
	call s:HL('pythonEscape',      'brightred')
	call s:HL('pythonException',   'aqua', '', 'bold')
	call s:HL('pythonExceptions',  'aqua', '', 'none')
	call s:HL('pythonPrecondit',   'aqua', '', 'none')
	call s:HL('pythonDecorator',   'brightpurple', '', 'none')
	call s:HL('pythonRun',         'igrey', '', 'bold')
	call s:HL('pythonCoding',      'igrey', '', 'bold')

" }}}
" Vim {{{

	call s:HL('VimCommentTitle', 'lightgrey', '', 'bold')
	call s:HL('VimMapMod',    'brightred', '', 'none')
	call s:HL('VimMapModKey', 'brightred', '', 'none')
	call s:HL('VimNotation', 'brightred', '', 'none')
	call s:HL('VimBracket', 'brightred', '', 'none')

" }}}

" }}}

