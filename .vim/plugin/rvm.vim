" rvm.vim - Rvm
" Author:   Christopher Sexton

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
if exists('g:loaded_rvm') || &cp
  finish
endif
let g:loaded_rvm = 1

let s:cpo_save = &cpo
set cpo&vim

" Code {{{1
function! rvm#statusline()
  let status = ''

  " Are we even using rvm?
  if !empty($rvm_path)
    let status = system("rvm-prompt i v g")[0:-2]
  endif

  if !empty(status)
    let status = '['.status.']'
    return status
  else
    return ''
  endif
endfunction

" Only display the ruby version if the filetype is ruby.
function! rvm#statusline_ft_ruby()
  if &filetype=='ruby'
    return rvm#statusline()
  else
    return ''
  endif
endfunction
" }}}1

let &cpo = s:cpo_save

" vim:set ft=vim ts=8 sw=2 sts=2:
