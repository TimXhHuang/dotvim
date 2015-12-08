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
    set rtp+=$VIM/vimfiles/bundle/vundle/
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
Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'cscope.vim'
Bundle 'echofunc.vim' 
Bundle 'grep.vim' 
Bundle 'vim-scripts/indexer.tar.gz'
"Bundle 'minibufexplorerpp' 
Bundle 'SuperTab'
Bundle 'vimprj'
Bundle 'DfrankUtil' 
Bundle 'OmniCppComplete' 
Bundle 'DoxygenToolkit.vim'
Bundle 'vim-scripts/Mark--Karkat'
Bundle 'tomtom/checksyntax_vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/Railscasts-Theme-GUIand256color'
Bundle 'msanders/snipmate.vim'
Bundle 'AutoComplPop'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'jamshedVesuna/vim-markdown-preview'


filetype plugin indent on     " required!



set mouse=a  
  
set nu 

"Taglist
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=0 
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open =1
let Tlist_Use_Right_Window =1 
let Tlist_Show_One_File = 1
let g:NERDTreeChDirMode=1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 25
let g:Tlist_Show_One_File = 1


"c.vim

filetype plugin on

filetype plugin indent on
set completeopt=longest,menu

set wildmenu

"MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1



let g:SuperTabRetainCompletionType=2

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

"snipmate 's Trigger Completion
"to enable auto-popup(url: http://www.vim.org/scripts/script.php?script_id=1879)
"First need to add code to snipmate.vim
" fun! GetSnipsInCurrentScope()
"   let snips = {}
"   for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
"     call extend(snips, get(s:snippets, scope, {}), 'keep')
"     call extend(snips, get(s:multi_snips, scope, {}), 'keep')
"   endfor
"   return snips
" endf 
let g:acp_behaviorSnipmateLength =1 

" save session for next operation
" 

"autocmd VimLeave * mks! $HOME/vimfiles/session/session.vim

" auto open session file
"autocmd VimEnter * :call s:ReadSession()
"function s:ReadSession()
"    let session_file = $HOME . "/vimfiles/session/session.vim"
"    if filereadable( session_file )
"        execute "so " . session_file
"    endif
"endfunction


" auto sv and ld session
let g:AutoSessionFile="project.vim"
let g:OrigPWD=getcwd()
if filereadable(g:AutoSessionFile)
    if argc() == 0
        au VimEnter * call EnterHandler()
        au VimLeave * call LeaveHandler()
    endif
endif
function! LeaveHandler()
    exec "mks! ".g:OrigPWD."/".g:AutoSessionFile
endfunction
function! EnterHandler()
    exe "source ".g:AutoSessionFile
endfunction


let NERDTreeIgnore = ['.*\.o$','.*\.ko$','.*\.gz$']

