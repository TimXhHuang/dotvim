set nocompatible   
 
set fileencodings=utf-8,gb2312,gbk,gb18030

set termencoding=utf-8

set encoding=prc

let s:MSWIN = has("win16") || has("win32")   || has("win64")    || has("win95")

let s:UNIX	= has("unix")  || has("macunix") || has("win32unix")

if	s:MSWIN
 source $VIMRUNTIME/vimrc_example.vim
 source $VIMRUNTIME/mswin.vim
 behave mswin
endif

set bsdir=buffer
set autochdir


set expandtab


if	s:MSWIN
    autocmd! bufwritepost _vimrc sourc $VIM/_vimrc
endif

"syntax setting
syntax enable
syntax on

filetype off                   " required!


 " Usual quickstart instructions
if	s:MSWIN
    set rtp+=$VIM/vimfiles/bundle/vundle.vim
    call vundle#rc('$VIM/vimfiles/bundle/')
   set guifont=Courier_New:h11:cANSI
elseif s:UNIX 
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

" let Vundle manage Vundle
" required! 
Bundle 'VundleVim/Vundle.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'majutsushi/tagbar'
Bundle 'grep.vim' 
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'SuperTab'
Bundle 'vimprj'
" Needed yb vimprj and indexer
Bundle 'DfrankUtil' 
Bundle 'DoxygenToolkit.vim'
Bundle 'tomtom/checksyntax_vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/Railscasts-Theme-GUIand256color'
Bundle 'plasticboy/vim-markdown'
Bundle 'jamshedVesuna/vim-markdown-preview'
Bundle 'Valloric/YouCompleteMe'

" Generate vim settings
filetype plugin indent on     " required!
set mouse=a  
set nu 

"tagbar
nmap <silent> <F4> :TagbarToggle<CR>
nmap <silent> <F2> :wq!<CR>

let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30


"set backup
set nobackup 
set foldmethod=syntax
set foldlevel=100



"Doxygentoolkit setting
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Tim huang" 
let g:DoxygenToolkit_licenseTag="tim for "
let g:DoxygenToolkit_commentType = "C++" 

"mark
let g:mwDefaultHighlightingPalette= 'extended' 

"indent guides
set t_Co=256
colorscheme  railscasts
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
        colorscheme railscasts
endif 

"Use this option to control whether the plugin is enabled on Vim startup.

let g:indent_guides_enable_on_vim_startup = 1
"remove ~M
nmap mm :%s/\r//g<cr>


"==========================================================================
"Begin setup Vexplore
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Change directory to the current buffer when opening files.
set autochdir
"End setup Vexplore
" ==========================================================================








