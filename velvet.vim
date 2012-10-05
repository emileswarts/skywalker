" Maintainer:   Emile Swarts
" Last Change:  2012/10/04
" URL: https://github.com/emileswarts/velvet-vim-colourscheme
"
" SETUP {{{
set background=dark
hi clear

if version > 580
	" You gotta upgrade
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "velvet"
"}}}
" DEFINE COLOURS {{{

"Colors go from dark to light.  1 being the darkest
"Anything marked as bright yellow (should not be much) is still a work in progress and has not showed up in my testing

let s:vc = {}
let s:vc.tokyowhite 		  	= ['ffffff', 15]  " 1
let s:vc.pidgeon   	  		  	= ['e3d8dc', 252] " 2 
let s:vc.mac    	  		  	= ['d1cfd0', 245] " 3 
let s:vc.crane 		  		  	= ['b3b1b1', 242] " 4
let s:vc.shuttle   	  		  	= ['666462', 240] " 5
let s:vc.grey5     	  		  	= ['45413b', 238] " 6 
let s:vc.grey6   	  		  	= ['35322d', 236] " 7 
let s:vc.grey7     	  			= ['242321', 235] " 8 
let s:vc.grey8    	  			= ['1c1b1a', 233] " 9 
let s:vc.offblack 		  		= ['141413', 232] " 111 
let s:vc.rhino 		  			= ['000000', 16]  " 000
let s:vc.pink 		  			= ['000000', 197]                          

let s:vc.purple1      = ['998f84', 57]
let s:vc.purple2      = ['998f84', 93]
let s:vc.purple3   	  = ['998f84', 98]
let s:vc.purple4      = ['998f84', 165]
let s:vc.purple5   	  = ['998f84', 135]
let s:vc.lilac   	  = ['998f84', 198]

let s:vc.orange1 	  = ['998f84', 166]
let s:vc.orange2  	  = ['000000', 208]

let s:vc.brightred 	  = ['fade3e', 196]
let s:vc.tomato 	  = ['fade3e', 160]
let s:vc.archlinux   = ['ffa724', 45]

let s:vc.army1 		  = ['f4cf86', 65]
let s:vc.army2 		  = ['f4cf86', 101]
let s:vc.army3 	  	  = ['f4cf86', 187]

let s:vc.aqua 		  = ['aeee00', 87]
let s:vc.brightyellow = ['88633f', 220]

" }}}
" CATCH BLACK BACKGROUND {{{
if ! exists("g:velvet_black_background")
	let g:velvet_black_background = 0
endif
"}}}
" HIGHLIGHTING FUNCTION {{{
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
" CONFIGURATION OPTIONS {{{
if exists('g:velvet_black') && g:velvet_black
	let s:darkness = 'shuttle'
else
	let s:darkness = 'grey8'
endif
" }}}
" VANILLA VIM {{{
" GENERAL/UI {{{
call s:HL('Normal', 'tokyowhite', 'grey8')
call s:HL('Folded', 'shuttle', 'bg', 'none')
call s:HL('VertSplit', 'mac', 'bg', 'none')
call s:HL('CursorLine',   '', 'grey7', 'none')
call s:HL('CursorColumn', '', 'grey7')
call s:HL('ColorColumn',  '', 'grey7')
call s:HL('MatchParen', 'brightred', 'offblack', 'bold')
call s:HL('NonText',    'grey5', 'bg')
call s:HL('SpecialKey', 'grey5', 'bg')
call s:HL('Visual',    '',  'grey5')
call s:HL('VisualNOS', '',  'grey5')
call s:HL('Search',    'brightred', 'grey8', 'bold')
call s:HL('IncSearch', 'tomato', 'grey8',    'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'rhino', 'archlinux',     'bold')
call s:HL('StatusLineNC', 'brightred', 'grey5', 'bold')
call s:HL('Directory', 'orange1', '', 'bold')
call s:HL('Title', 'orange1')
call s:HL('ErrorMsg',   'purple3',       'bg', 'bold')
call s:HL('MoreMsg',    'brightred',   '',   'bold')
call s:HL('ModeMsg',    'army3', '',   'bold')
call s:HL('Question',   'army3', '',   'bold')
call s:HL('WarningMsg', 'brightred',       '',   'bold')
" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

call s:HL('WildMenu', 'grey5', '',   'bold')
call s:HL('IndentGuides', 'grey5', '',   'bold')

" }}}
" BLACKNESS {{{
call s:HL('LineNr', 'rhino', 'offblack')
call s:HL('SignColumn', '', s:darkness)
call s:HL('FoldColumn', 'shuttle', s:darkness)

" }}}
" CURSOR {{{

call s:HL('Cursor',  'rhino', 'archlinux', 'bold')
call s:HL('vCursor', 'rhino', 'archlinux', 'bold')
call s:HL('iCursor', 'rhino', 'archlinux', 'none')

" }}}
" SYNTAX HIGHLIGHTING {{{

call s:HL('Special', 'tokyowhite')
call s:HL('Comment',        'offblack')
call s:HL('Todo',           'tokyowhite', 'bg', 'bold')
call s:HL('SpecialComment', 'tokyowhite', 'bg', 'bold')
call s:HL('String', 'army3')
call s:HL('Statement',   'purple3', '', 'bold')
call s:HL('Keyword',     'purple3', '', 'bold')
call s:HL('Conditional', 'purple3', '', 'bold')
call s:HL('Operator',    'purple3', '', 'none')
call s:HL('Label',       'purple3', '', 'none')
call s:HL('Repeat',      'purple3', '', 'none')

call s:HL('Identifier', 'purple2', '', 'none')
call s:HL('Function',   'purple2', '', 'none')

call s:HL('PreProc',   'archlinux', '', 'none')
call s:HL('Macro',     'archlinux', '', 'none')
call s:HL('Define',    'orange2', '', 'none')  "php functions in here
call s:HL('PreCondit', 'grey5', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'archlinux', '', 'bold')
call s:HL('Character', 'archlinux', '', 'bold')
call s:HL('Boolean',   'archlinux', '', 'bold')

call s:HL('Number', 'orange1', '', 'bold')
call s:HL('Float',  'orange1', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'orange1', '', 'bold')

call s:HL('Type', 'orange1', '', 'none')
call s:HL('StorageClass', 'purple3', '', 'none')
call s:HL('Structure', 'purple3', '', 'none')
call s:HL('Typedef', 'purple3', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'aqua', '', 'bold')

" Misc
call s:HL('Error',  'tokyowhite',   'brightred', 'bold')
call s:HL('Debug',  'tokyowhite',   '',      'bold')
call s:HL('Ignore', 'crane', '',      '')

" }}}
" COMPLETION MENU {{{
call s:HL('Pmenu', 'tokyowhite', 'grey7')
call s:HL('PmenuSel', 'brightred', 'grey8')
call s:HL('PmenuSbar', '', 'shuttle')
call s:HL('PmenuThumb', 'archlinux')


" }}}
" DIFFS {{{
call s:HL('DiffDelete', 'rhino', 'rhino')
call s:HL('DiffAdd',    '',     'grey6')
call s:HL('DiffChange', '',     'grey7')
call s:HL('DiffText',   'tokyowhite', 'grey6', 'bold')
" }}}
" SPELLING {{{
if has("spell")
	call s:HL('SpellCap', 'brightred', 'bg', 'undercurl,bold', 'brightred')
	call s:HL('SpellBad', 'rhino', '', 'undercurl', 'orange1')
	call s:HL('SpellLocal', '', '', 'undercurl', 'brightred')
	call s:HL('SpellRare', '', '', 'undercurl', 'brightred')
endif
" }}}
" }}}
" PLUGINS {{{
" CTRLP {{{
call s:HL('CtrlPNoEntries', 'tokyowhite', 'brightred', 'bold')
call s:HL('CtrlPMatch', 'purple2', 'bg', 'none')
call s:HL('CtrlPLinePre', 'grey5', 'bg', 'none')

" the prompt’s base
call s:HL('CtrlPPrtBase', 'grey5', 'bg', 'none')

" the prompt’s text
call s:HL('CtrlPPrtText', 'tokyowhite', 'bg', 'none')

" the prompt’s cursor when moving over the text
call s:HL('CtrlPPrtCursor', 'rhino', 'archlinux', 'bold')

" 'prt' or 'win', also for 'regex'
call s:HL('CtrlPMode1', 'rhino', 'archlinux', 'bold')

" 'file' or 'path', also for the local working dir
call s:HL('CtrlPMode2', 'rhino', 'archlinux', 'bold')

" the scanning status
call s:HL('CtrlPStats', 'rhino', 'archlinux', 'bold')

" TODO: CtrlP extensions.
" CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
" CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
" CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
" CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
" CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'archlinux',     'bg', 'bold')
call s:HL('EasyMotionShade',  'grey5', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'rhino', 'purple2')
call s:HL('InterestingWord2', 'rhino', 'aqua')
call s:HL('InterestingWord3', 'rhino', 'purple3')

" }}}
" Makegreen {{{

" }}}
" ShowMarks {{{
call s:HL('ShowMarksHLl', 'archlinux', 'grey8')
call s:HL('ShowMarksHLu', 'archlinux', 'grey8')
call s:HL('ShowMarksHLo', 'archlinux', 'grey8')
call s:HL('ShowMarksHLm', 'archlinux', 'grey8')
" }}}

" }}}
" FILETYPE-SPECIFIC {{{
" Clojure {{{
call s:HL('clojureSpecial',  'purple3', '', '')
call s:HL('clojureDefn',     'purple3', '', '')
call s:HL('clojureDefMacro', 'purple3', '', '')
call s:HL('clojureDefine',   'purple3', '', '')
call s:HL('clojureMacro',    'purple3', '', '')
call s:HL('clojureCond',     'purple3', '', '')
call s:HL('clojureKeyword', 'purple2', '', 'none')
call s:HL('clojureFunc',   'brightred', '', 'none')
call s:HL('clojureRepeat', 'brightred', '', 'none')
call s:HL('clojureParen0', 'mac', '', 'none')
call s:HL('clojureAnonArg', 'tokyowhite', '', 'bold')
" }}}
" CSS {{{
call s:HL('cssColorProp', 'army3', '', 'none')
call s:HL('cssBoxProp', 'army3', '', 'none')
call s:HL('cssTextProp', 'army3', '', 'none')
call s:HL('cssRenderProp', 'army3', '', 'none')
call s:HL('cssGeneratedContentProp', 'army3', '', 'none')
call s:HL('cssValueLength', 'army3', '', 'bold')
call s:HL('cssColor', 'army3', '', 'bold')
call s:HL('cssBraces', 'mac', '', 'none')
call s:HL('cssIdentifier', 'purple2', '', 'bold')
call s:HL('cssClassName', 'purple2', '', 'none')
" }}}
" Diff {{{
call s:HL('gitDiff', 'mac', '',)
call s:HL('diffRemoved', 'brightred', '',)
call s:HL('diffAdded', 'aqua', '',)
call s:HL('diffFile', 'rhino', 'purple3', 'bold')
call s:HL('diffNewFile', 'rhino', 'purple3', 'bold')
call s:HL('diffLine', 'rhino', 'purple2', 'bold')
call s:HL('diffSubname', 'purple2', '', 'none')
" }}}
" HTML {{{
call s:HL('htmlTag',    'purple2', 'bg', 'none')
call s:HL('htmlEndTag', 'purple2', 'bg', 'none')
call s:HL('htmlTagName',        'purple3', '', 'bold')
call s:HL('htmlSpecialTagName', 'purple2', '', 'bold')
call s:HL('htmlSpecialChar',    'purple2',   '', 'none')
call s:HL('htmlArg', 'purple2', '', 'none')
" Stuff inside an <a> tag
call s:HL('htmlLink', 'mac', '', 'underline')

" }}}
" Java {{{
call s:HL('javaClassDecl', 'purple3', '', 'bold')
call s:HL('javaScopeDecl', 'purple3', '', 'bold')
call s:HL('javaCommentTitle', 'crane', '')
call s:HL('javaDocTags', 'tokyowhite', '', 'none')
call s:HL('javaDocParam', 'brightred', '', '')
" }}}
" LessCSS {{{
call s:HL('lessVariable', 'aqua', '', 'none')
" }}}
" Mail {{{
call s:HL('mailSubject', 'purple2', '', 'bold')
call s:HL('mailHeader', 'mac', '', '')
call s:HL('mailHeaderKey', 'mac', '', '')
call s:HL('mailHeaderEmail', 'tokyowhite', '', '')
call s:HL('mailURL', 'army3', '', 'underline')
call s:HL('mailSignature', 'crane', '', 'none')
call s:HL('mailQuoted1', 'crane', '', 'none')
call s:HL('mailQuoted2', 'brightred', '', 'none')
call s:HL('mailQuoted3', 'army1', '', 'none')
call s:HL('mailQuoted4', 'purple2', '', 'none')
call s:HL('mailQuoted5', 'aqua', '', 'none')

" }}}
" Markdown {{{
call s:HL('markdownHeadingRule', 'mac', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'mac', '', 'bold')
call s:HL('markdownOrderedListMarker', 'mac', '', 'bold')
call s:HL('markdownListMarker', 'mac', '', 'bold')
call s:HL('markdownItalic', 'tokyowhite', '', 'bold')
call s:HL('markdownBold', 'tokyowhite', '', 'bold')
call s:HL('markdownH1', 'purple2', '', 'bold')
call s:HL('markdownH2', 'aqua', '', 'bold')
call s:HL('markdownH3', 'aqua', '', 'none')
call s:HL('markdownH4', 'aqua', '', 'none')
call s:HL('markdownH5', 'aqua', '', 'none')
call s:HL('markdownH6', 'aqua', '', 'none')
call s:HL('markdownLinkText', 'army3', '', 'underline')
call s:HL('markdownIdDeclaration', 'army3')
call s:HL('markdownAutomaticLink', 'army3', '', 'bold')
call s:HL('markdownUrl', 'army3', '', 'bold')
call s:HL('markdownUrldelimiter', 'mac', '', 'bold')
call s:HL('markdownLinkDelimiter', 'mac', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'mac', '', 'bold')
call s:HL('markdownCodeDelimiter', 'army2', '', 'bold')
call s:HL('markdownCode', 'army2', '', 'none')
call s:HL('markdownCodeBlock', 'army2', '', 'none')
" }}}
" PHP {{{
call s:HL('phpRegionDelimiter', 'brightred', '', 'bold') " php tags
call s:HL('phpPropertySelector', 'orange1', '', 'bold')
call s:HL('phpPropertySelectorInString', 'orange1', '', 'bold')
call s:HL('phpOperator', 'orange1', '', 'bold')
call s:HL('phpArrayPair', 'brightred', '', 'bold')
call s:HL('phpAssignByRef', 'brightred', '', 'bold')
call s:HL('phpRelation', 'brightred', '', 'bold') "need to check
call s:HL('phpMemberSelector', 'orange1', '', 'bold')
call s:HL('phpUnknownSelector', 'orange1', '', 'bold')
call s:HL('phpVarSelector', 'purple5', '', 'bold')
call s:HL('phpSemicolon', 'mac', '', 'bold')
call s:HL('phpFunctions', 'orange1', '', 'bold')
call s:HL('phpParent', 'tokyowhite', '', 'bold')
" }}}
" RUBY {{{
call s:HL('railsMethod', 'purple3', '', 'bold')
call s:HL('rubyDefine', 'purple3', '', 'bold')
call s:HL('rubyDescribe', 'purple3', '', 'bold')
call s:HL('rubySymbol', 'purple2', '', 'bold')
call s:HL('rubyAccess', 'archlinux', '', 'bold')
call s:HL('rubyAttribute', 'brightyellow', '', 'bold')
call s:HL('rubyEval', 'brightyellow', '', 'bold')
call s:HL('rubyException', 'brightyellow', '', 'bold')
call s:HL('rubyInclude', 'purple2', '', 'bold')
call s:HL('rubyStringDelimiter', 'army2', '', 'bold')
call s:HL('rubyRegexp', 'army1', '', 'bold')
call s:HL('rubyRegexpDelimiter', 'army2', '', 'bold')
call s:HL('rubyConstant', 'orange1', '', 'bold')
call s:HL('rubyGlobalVariable', 'brightyellow', '', 'bold')
call s:HL('rubyClassVariable', 'brightyellow', '', 'bold')
call s:HL('rubyInstanceVariable', 'army2', '', 'bold')
" }}}
" MySQL {{{
call s:HL('mysqlSpecial', 'archlinux', '', 'bold')
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
call s:HL('pythonDecorator',   'purple3', '', 'none')
call s:HL('pythonRun',         'crane', '', 'bold')
call s:HL('pythonCoding',      'crane', '', 'bold')
" }}}
" Vim {{{
call s:HL('VimCommentTitle', 'mac', '', 'bold')
call s:HL('VimMapMod',    'brightred', '', 'none')
call s:HL('VimMapModKey', 'brightred', '', 'none')
call s:HL('VimNotation', 'brightred', '', 'none')
call s:HL('VimBracket', 'brightred', '', 'none')
call s:HL('VimError', 'brightred', '', 'none')
" }}}
" }}}
