" Maintainer:   Emile Swarts
" Last Change:  2012/10/04
" URL: https://github.com/emileswarts/velvet-vim-colourscheme
"
"
"  .    .    . .       .         .    .    . .       . .    .    
"  .+'|  .'| .+'|=|`+. .+'|      .+'|  .'| .+'|=|`+. .+'|=|`+.=|`+. 
"  |  |  | | |  | `+.| |  |      |  |  | | |  | `+.| |.+' |  | `+.| 
"  |  |  | | |  |=|`.  |  |      |  |  | | |  |=|`.       |  |      
"  |  |  | | |  | `.|  |  |      |  |  | | |  | `.|       |  |      
"  |  |  | | |  |    . |  |    . |  |  | | |  |    .      |  |      
"  |  | .+ | |  | .+'| |  | .+'| |  | .+ | |  | .+'|      |  |      
"  `+.|=|.+' `+.|=|.+' `+.|=|.+' `+.|=|.+' `+.|=|.+' '`'`'`'`'`'`'
"          
"
set background=dark
hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "velvet"

" Define colors {{{

let s:vc = {}
let s:vc.plain 			= ['ffffff', 15]
let s:vc.white 			= ['ffffff', 15]
let s:vc.black 			= ['000000', 16]
let s:vc.brightgravel   = ['d9cec3', 252]
let s:vc.lightgravel    = ['998f84', 245]
let s:vc.pinkpurple     = ['998f84', 165]
let s:vc.lightlightpurple    = ['998f84', 93]
let s:vc.lightpurple    = ['998f84', 93]
let s:vc.brightpurple   = ['998f84', 98]
let s:vc.darkpurple    	= ['998f84', 57]
let s:vc.brightorange   = ['998f84', 166]
let s:vc.brightred 		= ['fade3e', 196]
let s:vc.brightaqua 	= ['ffa724', 45]
let s:vc.igravel 		= ['cccccc', 242]
let s:vc.mediumgravel   = ['666462', 241]
let s:vc.deepgravel     = ['45413b', 238]
let s:vc.deepergravel   = ['35322d', 236]
let s:vc.darkgravel     = ['242321', 235]
let s:vc.blackgravel    = ['1c1b1a', 233]
let s:vc.blackestgravel = ['141413', 232]
let s:vc.army 			= ['f4cf86', 101]
let s:vc.armylight 		= ['f4cf86', 107]
let s:vc.lime 			= ['aeee00', 87]
let s:vc.peach 	   		= ['ff9eb8', 211]
let s:vc.sand 			= ['b88853', 137]
let s:vc.coffee    		= ['c7915b', 173]
let s:vc.darkroast 		= ['88633f', 95]

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

call s:HL('Normal', 'plain', 'blackestgravel')
call s:HL('Folded', 'mediumgravel', 'bg', 'none')
call s:HL('VertSplit', 'lightgravel', 'bg', 'none')
call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')
call s:HL('MatchParen', 'brightred', 'darkgravel', 'bold')
call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')
call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')
call s:HL('Search',    'brightred', 'blackgravel', 'bold')
call s:HL('IncSearch', 'brightorange', 'blackgravel',    'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'black', 'brightaqua',     'bold')
call s:HL('StatusLineNC', 'white', 'deepgravel', 'bold')
call s:HL('Directory', 'army', '', 'bold')
call s:HL('Title', 'lime')
call s:HL('ErrorMsg',   'brightpurple',       'bg', 'bold')
call s:HL('MoreMsg',    'brightred',   '',   'bold')
call s:HL('ModeMsg',    'army', '',   'bold')
call s:HL('Question',   'army', '',   'bold')
call s:HL('WarningMsg', 'brightred',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{
call s:HL('LineNr',     'mediumgravel', 'blackestgravel')
call s:HL('SignColumn', '',             'blackestgravel')
call s:HL('FoldColumn', 'mediumgravel', 'blackestgravel')

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
call s:HL('Comment',        'blackestgravel')
call s:HL('Todo',           'white', 'bg', 'bold')
call s:HL('SpecialComment', 'white', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'army')

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

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'lime', '', 'none')
call s:HL('Macro',     'lime', '', 'none')
call s:HL('Define',    'lime', '', 'none')
call s:HL('PreCondit', 'lime', '', 'bold')

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
call s:HL('Exception', 'lime', '', 'bold')

" Misc
call s:HL('Error',  'white',   'brightpurple', 'bold')
call s:HL('Debug',  'white',   '',      'bold')
call s:HL('Ignore', 'igravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'black', 'brightaqua', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'black', 'black')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'white', 'deepergravel', 'bold')

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
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

    " the prompt’s base
    call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

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
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'black', 'lightpurple')
call s:HL('InterestingWord2', 'black', 'lime')
call s:HL('InterestingWord3', 'black', 'brightpurple')

" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=black guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" ShowMarks {{{
	call s:HL('ShowMarksHLl', 'brightaqua', 'blackgravel')
	call s:HL('ShowMarksHLu', 'brightaqua', 'blackgravel')
	call s:HL('ShowMarksHLo', 'brightaqua', 'blackgravel')
	call s:HL('ShowMarksHLm', 'brightaqua', 'blackgravel')
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
	call s:HL('clojureParen0', 'lightgravel', '', 'none')
	call s:HL('clojureAnonArg', 'white', '', 'bold')
" }}}
" CSS {{{
	call s:HL('cssColorProp', 'army', '', 'none')
	call s:HL('cssBoxProp', 'army', '', 'none')
	call s:HL('cssTextProp', 'army', '', 'none')
	call s:HL('cssRenderProp', 'army', '', 'none')
	call s:HL('cssGeneratedContentProp', 'army', '', 'none')
	call s:HL('cssValueLength', 'sand', '', 'bold')
	call s:HL('cssColor', 'sand', '', 'bold')
	call s:HL('cssBraces', 'lightgravel', '', 'none')
	call s:HL('cssIdentifier', 'lightpurple', '', 'bold')
	call s:HL('cssClassName', 'lightpurple', '', 'none')
" }}}
" Diff {{{

call s:HL('gitDiff', 'lightgravel', '',)

call s:HL('diffRemoved', 'brightred', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'black', 'brightpurple', 'bold')
call s:HL('diffNewFile', 'black', 'brightpurple', 'bold')

call s:HL('diffLine', 'black', 'lightpurple', 'bold')
call s:HL('diffSubname', 'lightpurple', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'army', '',)
call s:HL('djangoTagBlock', 'lightpurple', '')
call s:HL('djangoVarBlock', 'lightpurple', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'darkroast', 'bg', 'none')
call s:HL('htmlEndTag', 'darkroast', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'coffee', '', 'bold')
call s:HL('htmlSpecialTagName', 'coffee', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')

" Attributes
call s:HL('htmlArg', 'coffee', '', 'none')

" Stuff inside an <a> tag

call s:HL('htmlLink', 'lightgravel', '', 'underline')

" }}}
" Java {{{

call s:HL('javaClassDecl', 'brightpurple', '', 'bold')
call s:HL('javaScopeDecl', 'brightpurple', '', 'bold')
call s:HL('javaCommentTitle', 'igravel', '')
call s:HL('javaDocTags', 'white', '', 'none')
call s:HL('javaDocParam', 'brightred', '', '')

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'lime', '', 'none')

" }}}
" Mail {{{

call s:HL('mailSubject', 'lightpurple', '', 'bold')
call s:HL('mailHeader', 'lightgravel', '', '')
call s:HL('mailHeaderKey', 'lightgravel', '', '')
call s:HL('mailHeaderEmail', 'white', '', '')
call s:HL('mailURL', 'sand', '', 'underline')
call s:HL('mailSignature', 'igravel', '', 'none')

call s:HL('mailQuoted1', 'igravel', '', 'none')
call s:HL('mailQuoted2', 'brightred', '', 'none')
call s:HL('mailQuoted3', 'army', '', 'none')
call s:HL('mailQuoted4', 'lightpurple', '', 'none')
call s:HL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'white', '', 'bold')
call s:HL('markdownBold', 'white', '', 'bold')
call s:HL('markdownH1', 'lightpurple', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'sand', '', 'underline')
call s:HL('markdownIdDeclaration', 'sand')
call s:HL('markdownAutomaticLink', 'sand', '', 'bold')
call s:HL('markdownUrl', 'sand', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'army', '', 'bold')
call s:HL('markdownCode', 'army', '', 'none')
call s:HL('markdownCodeBlock', 'army', '', 'none')

" }}}
" PHP {{{

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
	call s:HL('pythonException',   'lime', '', 'bold')
	call s:HL('pythonExceptions',  'lime', '', 'none')
	call s:HL('pythonPrecondit',   'lime', '', 'none')
	call s:HL('pythonDecorator',   'brightpurple', '', 'none')
	call s:HL('pythonRun',         'igravel', '', 'bold')
	call s:HL('pythonCoding',      'igravel', '', 'bold')

" }}}
" Vim {{{

	call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')
	call s:HL('VimMapMod',    'brightred', '', 'none')
	call s:HL('VimMapModKey', 'brightred', '', 'none')
	call s:HL('VimNotation', 'brightred', '', 'none')
	call s:HL('VimBracket', 'brightred', '', 'none')

" }}}

" }}}

