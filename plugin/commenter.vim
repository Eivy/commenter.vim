"File: commenter.vim
"Author: Eivy <modern.times.rock.and.roll+git@gmail.com>
"Description: Comment out plugin
"Last Change: 19-Dec-2013.
" vim: ts=4 sw=4 noet

if has('g:loaded_commenter') | finish | endif
let g:loaded_commenter=1

nnoremap <silent> <Plug>(Commenter-line)	:call commenter#comment_out_line()<CR>
nnoremap <silent> <Plug>(Commenter-block)	:call commenter#comment_out_block()<CR>
nnoremap <silent> <Plug>(Commenter-undo)	:call commenter#comment_undo()<CR>
nnoremap <silent> <Plug>(Commenter-toggle)	:call commenter#comment_toggle()<CR>

xnoremap <silent> <Plug>(Commenter-line)	:call commenter#comment_out_line()<CR>
xnoremap <silent> <Plug>(Commenter-block)	:call commenter#comment_out_block()<CR>
xnoremap <silent> <Plug>(Commenter-undo)	:call commenter#comment_undo()<CR>
xnoremap <silent> <Plug>(Commenter-toggle)	:call commenter#comment_toggle()<CR>

nnoremap <silent> <Plug>(Commenter-line-with-motion)	:set opfunc=commenter#comment_out_line<CR>g@
nnoremap <silent> <Plug>(Commenter-block-with-motion)	:set opfunc=commenter#comment_out_block<CR>g@
nnoremap <silent> <Plug>(Commenter-undo-with-motion)	:set opfunc=commenter#comment_undo<CR>g@
nnoremap <silent> <Plug>(Commenter-toggle-with-motion)	:set opfunc=commenter#comment_toggle<CR>g@
