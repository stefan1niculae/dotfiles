""" Vimrc tweaks

" autoreload vimrc on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set timeoutlen=50 ttimeoutlen=10

