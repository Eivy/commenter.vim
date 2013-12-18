"File: commenter.vim
"Author: Eivy <modern.times.rock.and.roll+git@gmail.com>
"Description: Comment out plugin
"Last Change: 17-Dec-2013.
" vim: ts=4 sw=4 noet

if has('g:loaded_commenter') | finish | endif
let g:loaded_commenter=1

noremap <silent> <Plug>(Commenter-line)		:call commenter#comment_out_line()<CR>
noremap <silent> <Plug>(Commenter-block)	:call commenter#comment_out_block()<CR>
noremap <silent> <Plug>(Commenter-undo)		:call commenter#comment_undo()<CR>
noremap <silent> <Plug>(Commenter-toggle)	:call commenter#comment_toggle()<CR>
