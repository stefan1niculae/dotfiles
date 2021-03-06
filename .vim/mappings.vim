" TODO
" C-s to save
" C-/ for toggling comments
" fix delete key: to delete when at end of line and not to jump backwards
" when on first column, pressing esc from insert moves once to the right
" f, t, T, F to go beyond line

" Capslock acts as escape
" this is done from the system
"silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

" Swap semicolon and colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Leader is space
nnoremap <Space> <nop>
let mapleader = "\<Space>"

" Workdir tree
nnoremap <Leader>t :NERDTreeToggle<CR>

" Cursor stays in place when exiting insert into normal mode
" This makes the arrow keys in insert not work and insert letters instead
inoremap <silent> <Esc> <Esc>`^

" doesn't work
"command Paste execute 'set paste | insert | set nopaste'

" Delete key behaves like in insert mode
function! Delete_key(...)
    let line=getline (".")
    if line=~'^\s*$'
        execute "normal dd"
            return
    endif
    let column = col (".")
    let line_len = strlen (line)
    let first_or_end=0

    if column == 1
        let first_or_end=1
    else
        if column == line_len
            let first_or_end=1
        endif
    endif

    execute "normal i\<DEL>\<Esc>"
    if first_or_end == 0
        execute "normal l"
    endif
endfunction
nnoremap <silent> <DEL> :call Delete_key()<CR>

" Return key behaves like in insert mode
nnoremap <silent> <CR> i<CR><Esc>

" Better comand-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" G actually takes you to the end of the file
map G G$

" Don't deselect after indent/unindent
vnoremap > >gv
vnoremap < <gv

" Tab and shift-tab indent and unindent
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Minus deletes row contents
nnoremap - 0d$

" Ctrl-a selects all
nnoremap <C-a> ggvG$

" Ctrl-Shift-up/down move lines of text up/down
" TODO bind to A-j, A-k
function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")

      let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

" TODO remap these (C-directional key is no good for mac)
" nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
" nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
" inoremap <silent> <C-Up> <C-o>:call MoveLineUp()<CR>
" inoremap <silent> <C-Down> <C-o>:call MoveLineDown()<CR>
" "vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
" "vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>
" xnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
" xnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>

" Shift-Enter inserts line after cursor
" FIXME, doesn't work in console vim...
" nmap <NL> <CR>k

" TODO make esc toggle between normal/insert (enter insert mode from normal)
"nnoremap <silent><Esc> :startinsert<CR>

" F5 toggles spell checking
nnoremap <silent> <F5> :set spell!<CR>

" FIXME make this mapping work from plugins.vim and remove it from her
noremap <silent> <Leader>c :TComment<CR>

