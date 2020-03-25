"
" __  __     __     _____ __  __ ____   ____ 
"|  \/  |_   \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| | | | \ \ / / | || |\/| | |_) | |    
"| |  | | |_| |\ V /  | || |  | |  _ <| |___ 
"|_|  |_|\__, | \_/  |___|_|  |_|_| \_\\____|
"        |___/                               
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
set nocompatible              " be iMproved, required
filetype off                  " required
"设置Vundle的运行路径并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle安装位置与插件路径不同时，需要Vundle插件的路径
"call vundle#begin('~/some/path/here')
"------------------要安装的插件不能写在此行前！------------------
 
"Vundle对自己的调用，不可删去
Plugin 'VundleVim/Vundle.vim'
"以下是所支持的各种不同格式的示例
"需要安装的插件应写在调用的vundle#begin和vundle#end之间
"如果插件托管在Github上，写在下方，只写作者名/项目名就行了

"语法检测插件
Plugin 'w0rp/ale'
"vim-airline
Plugin 'vim-airline/vim-airline'
"vim-airline主题管理
Plugin 'vim-airline/vim-airline-themes'
"代码补全插件
Plugin 'maralla/completor.vim'
"Plugin 'Valloric/YouCompleteMe'
"括号自动补全
Plugin 'jiangmiao/auto-pairs'
"括号自动补全强大版(主要是用来删除成对括号 ds)
Plugin 'tpope/vim-surround'
"注释,可视模式下，注释或取消注释 gc
Plugin 'tpope/vim-commentary'
"markdown插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
"启动界面
Plugin 'mhinz/vim-startify'
"如果插件来自vim-scripts(官方)，写插件名就行了
" Plugin 'L9'
 
"如果Git仓库不在Github上，需要提供完整的链接
" Plugin 'git://git.wincent.com/command-t.git'
 
"本地的插件需要提供文件路径
" Plugin 'file:///home/gmarik/path/to/plugin'
"一定要确保插件就在提供路径的文件夹中(没有子文件夹，直接在这层目录下)
"运行时目录的路径
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"避免插件间的命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}
"------------------要安装的插件不能写在此行后！------------------
call vundle#end()            " required
filetype plugin indent on    " required
"要忽略插件缩进更改，请改用：
"filetype plugin on
"
" 安装插件的相关指令
":PluginList			- 列出已安装插件
":PluginInstall			- 安装新添加的插件;添加`!`或使用`:PluginUpdate`来更新已安装插件
":PluginSearch xxx		- 寻找名字带有xxx的插件;添加`!`刷新本地缓存
":PluginClean			- 删除已经从列表移除的插件;添加`!`静默卸载
":h						- 帮助和说明文档 
"Vundle的设置到此为止了
"
set number
syntax on

"ale配置文件
"保持标记槽打开
"let g:ale_sign_column_always = 1
"关闭高光显示
"let g:ale_set_highlights = 0
"仅在文件保存时运行
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
"you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0
"ctrl+k/j浏览错误
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"ale配置文件结束

"completor配置文件
"用tap实现ctrl+n效果
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"c补全
let g:completor_clang_binary = '/usr/bin/clang'
"completor配置文件结束


"vim-airline配置文件
let g:airline#extensions#tabline#enabled = 1
"设置tab键映射
nmap <tab> :bn<cr> 
"vim-airline配置文件结束

"markdown
let g:vim_markdown_folding_disabled = 1
nmap <F6> :InstantMarkdownStop<cr>
"end
"F5直接编译运行
" <F5> 编译和运行C
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype=='c'
		exec "!gcc % -o %<"
		exec "! ./%<"
	elseif &filetype=='markdown'
		exec "InstantMarkdownPreview"
	endif
endfunc
"结束


