"File: commenter.vim
"Author: Eivy <modern.times.rock.and.roll+git@gmail.com>
"Description: 
"Last Change: 13-Dec-2013.
" vim: ts=4 sw=4 noet

function! commenter#comment_out_line() abort
	let comment=commenter#get_comment_string()
	let lnum=line('.')
	if has_key(comment, 'line')
		let comstr=comment['line']
		let line=substitute(getline(lnum), '\ze\S', comstr, '')
	elseif has_key(comment, 'start') && has_key(comment, 'end')
		let line=getline(lnum)
		let line=substitute(line, '\ze\S', comment['start'], '')
		let line=substitute(line, '$', comment['end'], '')
	endif
	call setline(lnum, line)
endf

function! commenter#comment_out_block() range abort
	let l:comment=commenter#get_comment_string()
	let indent = matchstr(getline(a:firstline), '^\s*')
	if has_key(comment, 'start') && has_key(comment, 'middle') && has_key(comment, 'end')
		for l:lnum in range(a:firstline, a:lastline)
			let l:line=substitute(getline(lnum), '\%('.indent.'\|^\)\zs', comment['middle'], '')
			call setline(lnum, line)
		endfor
		call append(a:firstline-1, indent.comment['start'])
		call append(a:lastline+1, indent.comment['end'])
	elseif has_key(comment, 'line')
		execute a:firstline.','.a:lastline.'call commenter#comment_out_line()'
	endif
endf

function! commenter#comment_undo() range abort
	let comment=commenter#get_comment_string()
	let [start, end] = [a:firstline, a:lastline]
	if has_key(comment, 'start') && getline(start) =~ '^\s*'.escape(comment['start'], '*\').'\s*$'
		execute start.'d'
		let start -= 1
		let end -= 1
	endif
	if has_key(comment, 'end') && getline(end) =~ '^\s*'.escape(comment['end'], '*\').'\s*$'
		execute end.'d'
		let end -= 1
	endif
	for lnum in range(end, start, -1)
		let line=getline(lnum)
		for comstr in values(comment)
			let line=substitute(line, comstr, '', '')
		endfor
		call setline(lnum, line)
	endfor
endf

function! commenter#get_comment_string()
	let comment_dic={}
	let comments=split(&com, '\\\@<!,')
	for comment in comments
		let list = split(comment, ':')
		if len(list) < 2
			let comment_dic['line']=list[0]
			continue
		endif
		if list[0]=~'O'
			let comment_dic['line']=join(list[1:], '')
		elseif list[0]=~'s'
			let comment_dic['start']=join(list[1:], '')
		elseif list[0]=~'m'
			let comment_dic['middle']=join(list[1:], '')
		elseif list[0]=~'e'
			let comment_dic['end']=join(list[1:], '')
		endif
	endfor
	return comment_dic
endf