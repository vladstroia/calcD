set number number

filetype plugin on

set omnifunc=syntaxcomplete#Complete
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
												  " line to one character right
												  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
	return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
	return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
	return "\<C-X>\<C-F>"                         " file matching
  else
	return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
"plugin uri pt vim

call plug#begin('~/.vim/plugged')
"pt comentarii
Plug 'scrooloose/nerdcommenter'
"pt html
Plug 'mattn/emmet-vim', {'for': 'HTML' }
"pt elm
Plug 'elmcast/elm-vim', {'for': 'elm'}
"Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'


call plug#end()

"schimbam leader key ca sa fie ","
let mapleader = ","

"schimbam cum activam emmet
let g:user_emmet_leader_key = ','

" tab sa fie 4 spatii
set tabstop=2

"indentarea sa fie 4 spatii, la fel ca tabul
set shiftwidth=2

"run python script with <F9>
imap <F9> <Esc>:w!<CR>:!clear;python3 %<CR>


"bracket matching
inoremap " ""<left>
"inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
