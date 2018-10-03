set nocompatible              " required
filetype off                  " required
execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'fatih/vim-go'
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2
set clipboard=unnamed
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" NERDTree config
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25
nmap <F2> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=25
let g:tagbar_autofocus=1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>
syntax on
set background=dark
"colorscheme solarized
"colorscheme Zenburn
colorscheme molokai

" vim-go
let g:go_fmt_command = "goimports"


" syntastic 

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']


" cscope
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
:set cscopequickfix=s-,c-,d-,i-,t-,e-

" cscope快捷键映射
nmap <silent> <F5> :cs find s <C -R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nmap <silent> <F6> :cs find t <C -R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nmap <silent> <F7> :cs find c <C -R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>


" ctags
if filereadable("tags")
    set tags=tags
endif


" global: 建立数据库

if filereadable("GTAGS")
    set cscopetag
    set cscopeprg=gtags-cscope
    cs add GTAGS
    au BufWritePost *.c,*.cpp,*.h silent! !global -u &
endif

" YCM配置
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"let g:ycm_python_binary_path = '/usr/local/bin/python3'
"nmap<C-a> :YcmCompleter FixIt<CR>
" 自动补全配置
"set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

"let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
"let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
"inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0

"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处




"==========================================
"General
"==========================================
" history存储长度。
set history=1000
"检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on
"兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

" 取消备份。
"urn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"粘贴时保持格式
set paste
"- 则点击光标不会换,用于复制
set mouse-=a           " 在所有的模式下面打开鼠标。
set selection=exclusive
set selectmode=mouse,key

" No annoying sound on errors
" 去掉输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"==========================================
" show and format
"==========================================
"显示行号：
set number
set nowrap                    " 取消换行。
"为方便复制，用<F4>开启/关闭行号显示:
nnoremap <F4> :set nonumber!<CR>:set foldcolumn=0<CR>

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
"set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
"set foldmethod=syntax
" 在左侧显示折叠的层次
"set foldcolumn=4

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4

set ai "Auto indent
set si "Smart indent

"==========================================
" status
"==========================================
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set so=7
"set cursorline              " 突出显示当前行



"au BufNewFile,BufRead *.py
"\ set tabstop=4
"\ set softtabstop=4
"\ set shiftwidth=4
"\ set textwidth=79
"\ set expandtab
"\ set autoindent
"\ set fileformat=unix

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
