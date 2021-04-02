filetype plugin indent on
filetype indent on
syntax on

set nocompatible
set autoindent
set smartindent
set incsearch
set mouse=a
set shortmess+=c
set smartcase
set textwidth=80
set autowrite
set number
set relativenumber
set clipboard=unnamed

" Display all matching files when we tab complete
set wildmenu
set wildignorecase
set wildmode=longest,list

nnore Q @@
nnore <PAGEUP> <C-u>
nnore <PAGEDOWN> <C-d>
" quick movement within buffers
nnore gb :bn<CR>
nnore gB :bp<CR>
nnore <Leader>f :ls<CR>:b 

nnore <Leader><Space> :noh<CR>
" Farbiges Zeichen in Spalte 81
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" colorscheme
let g:monochrome_italic_comments = 1
colorscheme monochrome

" spellchecker
let g:myLang = 0
let g:myLangList = ['nospell', 'de_de', 'en_us']
function! MySpellLang()
  "loop through languages
  if g:myLang == 0 | setlocal nospell | endif
  if g:myLang == 1 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
  if g:myLang == 2 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
  echomsg 'language:' g:myLangList[g:myLang]
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <F7> :<C-U>call MySpellLang()<CR>

autocmd Filetype go autocmd BufWritePre <buffer> :%!gofmt
