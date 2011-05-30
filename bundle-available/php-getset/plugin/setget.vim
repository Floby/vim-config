" Vim filetype plugin for creating setters and getters
" FileType:     PHP
" Author:       Peter Reisinger <p.reisinger@gmail.com>
" Version:      0.1
" Maintainer:   Peter Reisinger <p.reisinger@gmail.com>
" Last Cahnge:  2009 Jun 07
" Location:     http://www.vim.org/scripts/script.php?script_id=xxx
" Licence:      This program is free software; you can redistribute it
"               and/or modify it under the terms of the GNU General Public
"               License.  See http://www.gnu.org/copyleft/gpl.txt
" Thanks:       To my wife - Toya, Bram for Vim and all the people who
"               contribute to the Free software

" TODO
" check if there's specific getter/setter already in the class
" if so, then highlight it and display message

" indent inserted methods automatically (not everybody uses 4 spaces 
" instedad of tab)

" check if mark has been set by user, if so then put it back

" support more files - java, python etc.

if exists("loaded_phpset")
    finish
endif
let loaded_phpset = 1

" PHP package
if exists("PHP_loaded")
    delfun PHP_getter
    delfun PHP_setter
    delfun PHP_setget
endif

" +-----------------------------------------------------------------+
" |                     php getter method                           |
" +-----------------------------------------------------------------+

" argumetns are:
" pos - position, where to insert method
" var - variable name without '$'
" static - boolean, indicates if variable is static or not
function s:PHP_getter(pos, var, static)
    " this is part of the method header
    let getString = "get" . toupper(strpart(a:var, 0, 1)) . strpart(a:var, 1) 

    " TODO first check if theres getter for this variable
    " check only between { and } - php can have more than one class in a file
    " highlight found item
    "if searchdecl(getString) == 1
    "    execute "normal /getString\<CR>"
    "    echo getString . " is already in the file"
    "    return
    "endif

    " make first letter uppercase
    " TODO - indent this code automatically so it will suit everybody's settings
    call append(a:pos + 1, "    public function ". getString ."()")
    call append(a:pos + 2, "    {")
    if a:static == 1
        call append(a:pos + 3, "        return self::$". a:var .";")
    else
        call append(a:pos + 3, "        return $this->". a:var .";")
    endif
    call append(a:pos + 4, "    }")
    call append(a:pos + 5, "")
endfunction

" +-----------------------------------------------------------------+
" |                     php setter methohd                          |
" +-----------------------------------------------------------------+
"
" argumetns are:
" pos - position, where to insert method
" var - variable name without '$'
" static - boolean, indicates if variable is static or not
function s:PHP_setter(pos, var, static)
    " part of the method header
    let setString = "set" . toupper(strpart(a:var, 0, 1)) . strpart(a:var, 1)

    " make first letter uppercase
    " TODO - indent this code automatically so it will suit everybody's settings
    call append(a:pos + 1, "    public function ". setString ."($" . a:var . ")")
    call append(a:pos + 2, "    {")
    if a:static == 1
        call append(a:pos + 3, "        self::$". a:var ." = $" . a:var . ";")
    else
        call append(a:pos + 3, "        $this->". a:var ." = $" . a:var . ";")
    endif
    call append(a:pos + 4, "    }")
    call append(a:pos + 5, "")
endfunction

" +-----------------------------------------------------------------+
" |                     main function                               |
" +-----------------------------------------------------------------+
function PHP_setget()
    " check file type - if not php then exit
    if &filetype != 'php'
        return
    endif

    " save user's option
    let option = inputlist(['Choose action', '1. Getter', '2. Setter', '3. Getter & Setter'])

    " remember user's position
    let saveCursor = getpos(".")

    " search for ; - end of instance variable declaration
    call search(';', 'c')
    " this indicates end of our search
    let endl = line(".")    " line

    " set mark - TODO - check if this mark is there, if it is
    " then save it and at the end put it back
    normal ma

    " look back for one of these:
    " ; - end of instance variable declaration
    " { - begining of a class declaration
    " } - end of a method
    " so we get begining of a search
    call search('[;\{\}]', 'be')
    " begining of the search
    let startl = line(".")  " line

    " get the range, so we can check if it's positive number
    let range = endl - startl

    " check for negative values - that means code is wrong
    if 0 <= range
        " prepare register for our use
        let s:oldreg = @"

        " save selection - yank, and get from register
        normal v`ay
        let content = @"

        " put old register back
        let @" = s:oldreg
        unlet! s:oldreg

        " variable pattern - pattern is from php website
        let pattern = '\$[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*'
        " list of instance variables
        let instVar = []

        " check for static keyword
        let static = (content =~? "static") ? 1 : 0

        " add all matched variable names to the list - isntVar
        while "" != matchstr(content, pattern)
            " add variable name (without dollar) to the list
            call add(instVar, substitute(matchstr(content, pattern), '\$', '', ''))
            " remove already added variable from searched content
            let content = substitute(content, pattern, '', '')
        endwhile

        " add new line after the end of search
        normal `ao
        " loop through the list

        " option 1 is getter, 2 is setter and 3 is both
        if option == 1
            for var in instVar
                call s:PHP_getter(endl, var, static)
            endfor
        elseif option == 2
            for var in instVar
                call s:PHP_setter(endl, var, static)
            endfor
        else
            for var in instVar
                call s:PHP_getter(endl, var, static)
                call s:PHP_setter(endl, var, static)
            endfor
        endif

    endif
    " restore user's postion
    call setpos('.', saveCursor)

endfunction

let PHP_loaded = 1
