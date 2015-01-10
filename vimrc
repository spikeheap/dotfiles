filetype off

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

syntax on
filetype plugin indent on
set shell=/bin/sh
set modelines=0
set ofu=syntaxcomplete#Complete
set tabstop=2
set smarttab
set title
set scrolloff=3
set encoding=utf-8
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set showmode
set showcmd
set number
set ruler
set hidden
set history=1000
set wildmenu
set wildmode=list:longest

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault

runtime macros/matchit.vim
set showmatch
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=72
set formatoptions=qrn1

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set shortmess=atI
set visualbell
set cursorline
set ttyfast
set undofile
set undodir=~/.vim-tmp/undo,~/.tmp,~/tmp,/var/tmp,/tmp
set laststatus=2

"set background=dark
"colorscheme Tomorrow-Night-Eighties

set colorcolumn=81
highlight ColorColumn ctermbg=18

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

nnoremap ' `
nnoremap ` '
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Disable arrow keys in insert - training wheels mode
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>
"nnoremap <Left>  <NOP>
"nnoremap <Right> <NOP>
"nnoremap <Up>    <NOP>
"nnoremap <Down>  <NOP>
nnoremap j gj
nnoremap k gk

inoremap jj <ESC>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

let mapleader = ","

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>V V`]
nnoremap <leader>, :b#<CR>
nnoremap <leader>@ :!ctags --extra=+f -R *<CR><CR>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>n :nohlsearch<cr>

set listchars=tab:▸\ ,trail:·,eol:¬
set list!
nmap <silent> <leader>s :set nolist!<CR>

autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>

autocmd Filetype gitcommit setlocal spell textwidth=72

set clipboard+=unnamed

" expand %% to current file path in command mode
cabbr <expr> %% expand('%:p:h')
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

au BufRead,BufNewFile *.pl    set filetype=prolog
au BufRead,BufNewFile *.md    set filetype=markdown

" Understand :W to be the same thing as :w
command! W :w
command! Wq :wq

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, vim_command)
  try
    silent! exec a:vim_command . " " . system(a:choice_command . " | selecta")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
  endtry
  redraw!
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
"map <leader>gv :call SelectaCommand("find app/views/* -type f", ":e")<cr>
"map <leader>gc :call SelectaCommand("find app/controllers/* -type f", ":e")<cr>
"map <leader>gm :call SelectaCommand("find app/models/* -type f", ":e")<cr>
"map <leader>gh :call SelectaCommand("find app/helpers/* -type f", ":e")<cr>
"map <leader>ga :call SelectaCommand("find app/assets/* -type f", ":e")<cr>
"map <leader>gl :call SelectaCommand("find lib/* -type f", ":e")<cr>
"map <leader>gs :call SelectaCommand("find spec/* -type f", ":e")<cr>
"map <leader>gf :call SelectaCommand("find features/* -type f", ":e")<cr>
"map <leader>f  :call SelectaCommand("find * -type f", ":e")<cr>

map <leader>gv :CtrlP app/views/<cr>
map <leader>gc :CtrlP app/controllers/<cr>
map <leader>gm :CtrlP app/models/<cr>
map <leader>gh :CtrlP app/helpers/<cr>
map <leader>ga :CtrlP app/assets/<cr>
map <leader>gl :CtrlP lib/<cr>
map <leader>gs :CtrlP spec/<cr>
map <leader>gf :CtrlP features/<cr>
map <leader>f  :CtrlP<cr>
map <leader>b  :CtrlPBuffer<cr>

" Find all tags in the tags database, then open the tag that the user selects
command! SelectaTag :call SelectaCommand("awk '{print $1}' tags | sort -u | grep -v '^!'", ":tag")
map <leader>gt :SelectaTag<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

set winwidth=85
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

if bufwinnr(1)
  map - <c-w>-
  map + <c-w>+
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader><space> :call ReRunTestCommand()<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    if match(expand("%"), '_test\.rb$') != -1
      call RunTestFile() " line number not right for minitest - TODO: Find nearest test name?
    else
      call RunTestFile(":" . spec_line_number)
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    if match(a:filename, '\.feature') != -1
        if filereadable("script/features")
            let run_test = "script/features " . a:filename
        else
            let run_test = "cucumber --color -f pretty " . a:filename
        end
    elseif match(a:filename, '_spec\.rb') != -1
        if filereadable("script/test")
            let run_test = "script/test " . a:filename
        else
            let run_test = "rspec --color " . a:filename
        end
    else
        if filereadable("script/test")
            let run_test = "script/test " . a:filename
        else
            let run_test = "ruby " . a:filename
        end
    end
    call RunTestCommand(run_test)
endfunction

function! RunTestCommand(cmd)
    if match(a:cmd, '.') != -1
      let t:sst_test_command = a:cmd
    end
    exec ":w"
    " check for a test-commands pipe, and execute tests async
    if filewritable(".test-commands")
      exec ":silent !echo " . t:sst_test_command . " > .test-commands"

      redraw!
    else
      exec ":!clear;" . t:sst_test_command
    end
endfunction

function! ReRunTestCommand()
  call RunTestCommand("")
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

function FormatRubyHash()
  Tabularize /^[^:]*\zs:/r1c0l0
  Tabularize /^[^=>]*\zs=>/l1
endfunction

function FormatEquals()
  Tabularize /[=:]/
endfunction

function FormatCommas()
  Tabularize /,\zs/l1l0
endfunction

function FormatCss()
  Tabularize /: \zs/l1l0
endfunction

function FormatRubySymbols()
  Tabularize /:\zs/l1l10
endfunction

map <leader>ah :call FormatRubyHash()<cr>
map <leader>a= :call FormatEquals()<cr>
map <leader>a, :call FormatCommas()<cr>
map <leader>ac :call FormatCss()<cr>
map <leader>a: :call FormatRubySymbols()<cr>

map <F1> :noh<Cr>

function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<policies\>') != -1 || match(current_file, '\<services\>') != -1 || match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  "let in_app = match(current_file, '^app/') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    else
      let new_file = substitute(new_file, '^lib/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    else
      let new_file = 'lib/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>xv :call ExtractVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction
nnoremap <leader>iv :call InlineVariable()<cr>

"VIM Clojure
let vimclojure#WantNailgun = 1
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1


" XMPFilter
" Terminal
nmap <buffer> <leader>rr <Plug>(xmpfilter-run)
xmap <buffer> <leader>rr <Plug>(xmpfilter-run)
imap <buffer> <leader>rr <Plug>(xmpfilter-run)

nmap <buffer> <leader>rm <Plug>(xmpfilter-mark)
xmap <buffer> <leader>rm <Plug>(xmpfilter-mark)
imap <buffer> <leader>rm <Plug>(xmpfilter-mark)

" Word Processor Mode
func! WordProcessorMode()
  setlocal formatoptions=1c
  setlocal noexpandtab
  map j gj
  map k gk
  set complete+=s
  set formatprg=par
  setlocal wrap
endfu
com! WP call WordProcessorMode()

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal wrap linebreak nolist textwidth=80 wrapmargin=0 filetype=ghmarkdown fo+=t 
augroup END

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " use ag instead of ack
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|copen|redraw!
nnoremap \ :Ag<SPACE>
