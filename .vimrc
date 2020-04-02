call plug#begin('~/.vim/plugged')
"dress
Plug 'bling/vim-bufferline'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
"vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"start-page
Plug 'mhinz/vim-startify'
"nerdtree's dress
Plug 'ryanoasis/vim-devicons'
"colorful bracket
Plug 'luochen1990/rainbow'
Plug 'wincent/terminus'

"file navagation
"nerd-tree
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"taglist
Plug 'liuchengxu/vista.vim'

"editor enhancement
"auto-pair
Plug 'jiangmiao/auto-pairs'
"auto completer
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"format
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"switch true and false gs to switch
Plug 'AndrewRadev/switch.vim'
"da= to delete what's after =
Plug 'junegunn/vim-after-object'
"gaip= to align the = in paragraph
Plug 'junegunn/vim-easy-align'
"Ctrl+L (insert) to toggle capslock
Plug 'tpope/vim-capslock'
"find plus
Plug 'easymotion/vim-easymotion'
"auto format
Plug 'Chiel92/vim-autoformat'

"for writing
Plug 'junegunn/goyo.vim'

"bookmarks
Plug 'MattesGroeger/vim-bookmarks'

"markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"test point
"dress
"wait area
call plug#end()

"neovim
set number
syntax on
"end

"F5 to compile and run
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
"end

"vim-airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="bubblegum"
nmap <tab> :bn<cr>
"end

"rainbow
let g:rainbow_active = 1
"end

"nerd-tree
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"end

"coc
" use <tab> for trigger completion and navigate to the next complete item
set signcolumn=yes
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
"end

"vista.vim
noremap <silent> T :Vista!!<CR>
noremap <c-t> :silent! Vista finder<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"end

"vim-after-object
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
"vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
"end

"easymotion
map ' <Plug>(easymotion-bd-f)
map ' <Plug>(easymotion-bd-f)
"end

"auto format
nnoremap <F3> :Autoformat<CR>:w<CR>
"end

"markdown
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_browser = "google-chrome-stable --new-window"
let g:instant_markdown_autostart = 0
nmap <F6> :InstantMarkdownStop<cr>
"end

"bookmarks
nmap mt <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mi <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1
"end

colorscheme gruvbox
set background=dark
"end
