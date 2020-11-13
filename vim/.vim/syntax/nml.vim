" Vim syntax file
" Language:	NeoPulse Modeling Language(NML)
" Maintainer:	Mikio Akamatsu <mikio@aidynamics.com>
" Last Change:	2016 Oct 29

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match  Number	"\<\%(0\%(x\x[[:xdigit:]_]*\|b[01][01_]*\|\o[0-7_]*\|\)\|[1-9][[:digit:]_]*\)\>"
syn match  Float	"\<\d[[:digit:]_]*[eE][\-+]\=\d\+"
syn match  Float	"\<\d[[:digit:]_]*\.[[:digit:]_]*\%([eE][\-+]\=\d\+\)\="
syn match  Float    "\.[[:digit:]][[:digit:]_]*\%([eE][\-+]\=\d\+\)\="

syn region String matchgroup=stringdouble start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region String matchgroup=stringsingle start=+'+ skip=+\\\\\|\\'+ end=+'+

syn keyword Operator	bind input output params compile run dashboard
syn keyword Function	oracle source architecture train
syn keyword Define		FlatDataGenerator ImageDataGenerator VideoDataGenerator TextDataGenerator AudioDataGenerator
syn keyword Define		Conv2D MaxPooling2D Dense Flatten Activation Dropout
syn keyword String		""

let b:current_syntax = "nml"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
