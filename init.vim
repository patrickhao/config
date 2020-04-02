call plug#begin('~/.vim/plugged')
"vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"auto-pair
Plug 'jiangmiao/auto-pairs'
"start-page
Plug 'mhinz/vim-startify'
"nerd-tree
Plug 'preservim/nerdtree'
"markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"neovim
set number
syntax on
"end

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="bubblegum"
nmap <tab> :bn<cr>
"end

"nerd-tree
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"end

"markdown
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_browser = "google-chrome-stable --new-window"
let g:instant_markdown_autostart = 0
nmap <F6> :InstantMarkdownStop<cr>
"end

"coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
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
