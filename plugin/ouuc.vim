" ouuc.vim - A Vim global plugin for opening a url under the cursor
" Last Change:	Feb 27th 2012
" Maintainer:	Mauro Morales <http://mauromorales.com>
" Version: 1.0
"
" Copyright (c) 2012 Mauro Morales

" Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
" associated documentation files (the "Software"), to deal in the Software without restriction, 
" including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
" and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
" subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all copies or substantial 
" portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
" LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
" WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


if exists("g:loaded_ouuc") || &cp || v:version < 700
  finish
endif
let g:loaded_ouuc = 1

function! OpenUrlUnderCursor()
    let path="/Applications/Safari.app"
    execute "normal BvEy"
    let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
    if url != ""
        silent exec "!open -a ".path." '".url."'" | redraw! 
        echo "opened ".url
    else
        echo "No URL under cursor."
    endif
endfunction

command OpenUrlUnderCursor :call OpenUrlUnderCursor()
