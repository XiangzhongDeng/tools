"-----------------------------------------------------------------------------
" base
"-----------------------------------------------------------------------------
" 语法高亮度显示
syntax on
set hlsearch

set cuc
set cul
" 设置行号
set nu

let mapleader = ","

"防止中文注释乱码
set fileencoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936,big－5                    
set enc=utf-8
let &termencoding=&encoding

"设置字体
set guifont=Monospace\ 13

" 设置tab4个空格
set tabstop=4
set expandtab

"程序自动缩进时候空格数
set shiftwidth=4

"退格键一次删除4个空格
set softtabstop=4
autocmd FileType make set noexpandtab

" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

" 搜索忽略大小写 
set ignorecase 

" vim使用自动对起，也就是把当前行的对起格式应用到下一行
set autoindent

" 依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
set smartindent

" 在状态列显示目前所执行的指令
set showcmd
set autochdir "NERDTree dir set
" 设置颜色主题
colorscheme desert

" windows size
winpos 235 235
set lines=25 columns=108 

set nocompatible
set backspace=indent,eol,start

set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

imap ii <ESC>

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"-----------------------------------------------------------------------------
"  vundle
"-----------------------------------------------------------------------------
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'git://github.com/VundleVim/Vundle.vim'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/w0rp/ale.git'
Plugin 'git://github.com/bling/vim-airline'
Plugin 'git://github.com/SirVer/ultisnips'
Plugin 'git://github.com/honza/vim-snippets'
Plugin 'git://github.com/Shougo/neocomplcache.vim'
Plugin 'git://github.com/junegunn/vim-easy-align'
Plugin 'git://github.com/scrooloose/nerdcommenter'
" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本


"-----------------------------------------------------------------------------
" NERDTree
"-----------------------------------------------------------------------------
map <leader>ne :NERDTreeToggle<CR>
" 目录树窗口尺寸
let g:NERDTreeWinSize = 25
" 关闭nerd帮助
" let g:NERDTreeMinimalUI = 1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 修改默认箭头符号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
augroup NERDTree
    au!
    autocmd vimenter * NERDTree     " vim启动时自动打开NERDTree
    " vim启动打开目录时自动打开NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd vimenter * NERDTreeFind 
    " 文件全部关闭时退出NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>

wincmd w
autocmd VimEnter * wincmd w


"-----------------------------------------------------------------------------
" ale.vim
"-----------------------------------------------------------------------------
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
 
" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1
" self-define statusline
" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" only enable these linters
let g:ale_linters = {
\    'verilog': ['verilator']
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)
" run lint only on saving a file
" let g:ale_lint_on_text_changed = 'never'
" dont run lint on opening a file
" let g:ale_lint_on_enter = 0


"-----------------------------------------------------------------------------
"snippet.vim
"-----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



"-----------------------------------------------------------------------------
" neocomplcache
"-----------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1 "作用：在系统启动的时候启动neo  
let g:neocomplcache_enable_auto_select = 1 "作用：提示的时候默认选择地一个，如果你设置为0，每次输入都需要用上下键选择


"-----------------------------------------------------------------------------
" easyalign
"-----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"-----------------------------------------------------------------------------
" verilog_inst_gen
"-----------------------------------------------------------------------------
so ~/.vim/bundle/vlog_inst_gen.vim
let g:vlog_inst_gen_mode=2 "copy to clipboard and echo inst in split window


"-----------------------------------------------------------------------------
"vtag
"-----------------------------------------------------------------------------
source /home/eda/vtags-3.01/vtags_vim_api.vim


"-----------------------------------------------------------------------------
"nerdcommenter
"-----------------------------------------------------------------------------
let mapleader = ","


"-----------------------------------------------------------------------------
" Add File Header
"-----------------------------------------------------------------------------
autocmd BufNewFile *.v,*.sv,*.cpp,*.c,*.h exec ":call AddHeader()"
autocmd BufWrite *.v call UpdateLastModifyTime()

function s:GetUserName() 
    let user_name = "Rongye"
    return user_name
endfunction 

function AddHeader() 
	let line = getline(1)
  	let filename = expand("%")
	call append(0,  "// +FHDR----------------------------------------------------------------------------")
	call append(1,  "//                 Copyright (c) ".strftime("%Y ") )
	call append(2,  "//                       ALL RIGHTS RESERVED")
	call append(3,  "// ---------------------------------------------------------------------------------")
	call append(4,  "// Filename      : ".filename)
	call append(5,  "// Author        : ".s:GetUserName())
	call append(6,  "// Created On    : ".strftime("%Y-%m-%d %H:%M"))
	call append(7,  "// Last Modified : ")
	call append(8,  "// ---------------------------------------------------------------------------------")
	call append(9,  "// Description   : ")
	call append(10, "//")
	call append(11, "//")
	call append(12, "// -FHDR----------------------------------------------------------------------------")
endfunction 


"-----------------------------------------------------------------------------
" ModifyTime
"-----------------------------------------------------------------------------
function UpdateLastModifyTime() 
	let line = getline(8)
	if line =~ '// Last Modified'
		call setline(8,"// Last Modified : " . strftime("%Y-%m-%d %H:%M"))
	endif
endfunction 

