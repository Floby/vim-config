" Vim syntax file
" Language: TPP <http://synflood.at/tpp/>
" Maintainer: Patricia Jung <trish@trish.de>
" Licence: http://creativecommons.org/licenses/by-sa/2.0/
" Version: 0.1
" Last Change: 21 Sep 2004
" Location: http://www.trish.de/downloads/tpp.vim
" Bugs: On some occasions vim colors text inside slide-environments, against
" advice from this syntax file. Hints welcome. 
 
" for portability  
if version < 600  
    syntax clear  
elseif exists("b:current_syntax")  
     finish  
endif  

" tpp is case-sensitive
syn case match

" allowed colors
syn keyword tppColors yellow magenta red green blue black white cyan contained	
" allowed constant argument for --date
syn match tppToday /\stoday\s*/ contained
" a string which includes at least one number (and as such doesn't match
" today); user-defined argument for --date)
syn match tppDate /\s\w.*\d.*\w/ contained
" argument for --sleep
" \d+ for some reason doesn't work for me (\d == digit)
syn match tppSeconds /\d\d*/ contained
" argument for --exec
syn match tppExternalCmd /\s\D.*\w/ contained
" --bgcolor and --fgcolor
syn match tppPreambleColorSetting /^--\(bg\|fg\)color\s.*$/ contains=tppColors
" other preamble settings
syn match tppPreamble	/^--\(author\|title\|date\)/
syn match tppPreambleDateSetting /^--date\s.*$/ contains=tppDate,tppToday
" tpp-commands for 'wait until keypress' and 'new page'
syn match tppCommand	/^--\(-\s*$\|newpage\)/
" --exec ('execute external command')
syn match tppExecute	/^--exec\s.*$/ contains=tppExternalCmd 
" --sleep <seconds>
syn match tppSleep	/^--sleep\s\s*\d\d*\s*$/ contains=tppSeconds 
" Structuring elements
syn match tppStructure  /^--heading\s/ 
" 'draw horizontal line', 'draw border'
syn match tppDrawCommand /^--\(horline\|withborder\)\s*$/ 
" slide commands (paired)
syn keyword tppSlide --beginslideright --endslideright --beginslideleft --endslideleft --beginslidetop --endslidetop --beginslidebottom --endslidebottom contained
" align text
syn match tppAlign /^--\(center\|right\|left\)/ 
" environments that change font face ((bold, underline, reverse; paired)
syn keyword tppFontFace --boldon --boldoff --ulon --uloff --revon --revoff contained
" keywords for listing environments
syn keyword tppListings --beginshelloutput --beginoutput --endoutput --endshelloutput contained
" set font color
syn match tppColorSetting /^--color\s.*$/ contains=tppColors 
" huge output
syn match tppSizeSetting /^--huge\s/
" environment for bold
syn region tppBold matchgroup=tppFontFace start=/^--boldon/ end=/^--boldoff/ contains=ALL
" environment for reverse
syn region tppRev matchgroup=tppFontFace start=/^--revon/ end=/^--revoff/ contains=ALL 
" environment for underline
syn region tppUnderline matchgroup=tppFontFace start=/^--ulon/ end=/^--uloff/ contains=ALL
" listing environments 
syn region tppOutput matchgroup=tppListings start=/^--beginoutput/ end=/^--endoutput/ contains=ALLBUT,tppPreamble,tppPreambleColorSetting
syn region tppShellOutput matchgroup=tppListings start=/^--beginshelloutput/ end=/^--endshelloutput/ contains=ALLBUT,tppPreamble,tppPreambleColorSetting
" slide environments
syn region tppSlideLeft matchgroup=tppSlide start=/^--beginslideleft/ end=/^--endslideleft/ contains=ALLBUT,tppPreamble,tppPreambleColorSetting
syn region tppSlideRight matchgroup=tppSlide start=/^--beginslideright/ end=/^--endslideright/ contains=ALLBUT,tppPreamble,tppPreambleColorSetting
syn region tppSlideBottom matchgroup=tppSlide start=/^--beginslidebottom/ end=/^--endslidebottom/ contains=ALLBUT,tppPreamble,tppPreambleColorSetting
syn region tppSlideTop matchgroup=tppSlide start=/^--beginslidetop/ end=/^--endslidetop/ contains=ALLBUT,tppPreamble,tppPreambleColorSetting


" Define the default highlighting.
" " For version 5.7 and earlier: only when not done already
" " For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tpp_syn_inits")
  if version < 508
    let did_po_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

HiLink tppPreamble		PreProc
HiLink tppPreambleColorSetting	tppPreamble
HiLink tppPreambleDateSetting	tppPreamble

HiLink tppStructure		Identifier

HiLink tppColorSetting		Function
HiLink tppSizeSetting		tppColorSetting
HiLink tppCommand		Function
HiLink tppExecute		tppCommand
HiLink tppSleep			tppCommand
HiLink tppSlide			Function
HiLink tppDrawCommand		Function

" Builtin constants
HiLink tppColors		String
HiLink tppToday			String
HiLink tppSeconds		Number

" no highlighting of free choosen --date arguments
" HiLink tppDate		String

HiLink tppFontFace		Type
HiLink tppAlign			Type
HiLink tppListings		Type

" Highlight text that will appear highlightened in the presentation
HiLink tppBold			Special
" hi def tppBold	term=bold cterm=bold gui=bold
HiLink tppRev			Special
" Underlined works badly for me
" HiLink tppUnderline		Underlined
HiLink tppUnderline		Special
HiLink tppOutput		Special
HiLink tppShellOutput		tppOutput

" No highlighting of text inside effects (don't confuse users)
" HiLink tppEffect		Special
" HiLink tppSlideLeft		tppEffect
" HiLink tppSlideRight		tppEffect
" HiLink tppSlideTop		tppEffect
" HiLink tppSlideBottom		tppEffect

HiLink tppExternalCmd		Special

  delcommand HiLink
endif

let b:current_syntax = "tpp"
