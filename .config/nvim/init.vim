"set leader to space
let mapleader =" "

" ============ Plugins Setup ============
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Navigation
Plug 'nvim-lua/popup.nvim' " required by telescope
Plug 'nvim-lua/plenary.nvim' " required by telescope
Plug 'nvim-lua/telescope.nvim' " best fuzzy finder
Plug 'scrooloose/nerdtree' " files tree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jmckiern/vim-venter' " zen mode

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin' " for flutter

" Git
Plug 'tpope/vim-fugitive'

" Colorscemes - Themes
Plug 'morhetz/gruvbox'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'jceb/vim-orgmode'
"Plug 'axvr/org.vim'
Plug 'tpope/vim-cucumber'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/syntastic'
Plug 'ledger/vim-ledger'

" Arduino
Plug 'stevearc/vim-arduino'
Plug 'sudar/vim-arduino-syntax'

" Tools
Plug 'christoomey/vim-tmux-navigator'
Plug 'szw/vim-maximizer'
Plug 'benmills/vimux'
Plug 'bserem/vim-greek-spell'
Plug 'dbeniamine/cheat.sh-vim'

" HTML
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Groff
Plug 'Gavinok/vim-troff'

" Latex
Plug 'lervag/vimtex'
call plug#end()

"==============Vim Settings=====================
set ignorecase
set mouse=a
set nowrap
set relativenumber
set nu
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
set hidden
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}




"==============MAPS===========================
nmap spg :set spell spelllang=el<CR>
nmap spu :set spell spelllang=en<CR>
nmap spn :set nospell<CR>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
inoremap jk <ESC>
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-l> <Plug>(coc-snippets-expand)
nnoremap <silent> <leader>r  :<C-u>CocListResume<CR>
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>a  :<C-u>CocAction<cr>
"search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
xmap <silent> <C-d> <Plug>(coc-range-select)
nmap <silent> <C-d> <Plug>(coc-range-select)
omap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
xmap if <Plug>(coc-funcobj-i)
" Create mappings for function text object, requires document symbols feature of languageserver.
nmap <leader>qf  <Plug>(coc-fix-current)
"nmap <leader>ac  <Plug>(coc-codeaction)
" Remap for do codeAction of current line
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"xmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
nmap <leader><CR>  :call CocAction('format')<CR>
xmap <leader><CR>  :call CocAction('format')<CR>
" Remap for format selected region
nmap <F2> <Plug>(coc-rename)
" Remap for rename current word
inoremap <silent><expr> <C-Space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gd <Plug>(coc-definition)
" Remap keys for gotos
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Remap <C-f> and <C-b> for scroll float windows/popups.
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
map <silent> <M-/> :let @/=""<CR>
map <silent> <M-n> :tabnew<CR>
map <silent> _ :resize -5<CR>
map <silent> + :resize +5<CR>
map <silent> - :vertical resize -5<CR>
map <silent> = :vertical resize +5<CR>
nnoremap <silent> <leader>p :Telescope git_files<CR>
nmap <M-e> :NERDTreeToggle<CR>
nmap <leader>m :MaximizerToggle<CR>
nmap <leader>z :tabe %<CR>:VenterToggle<CR>

"===========VimSpector==============
"nmap <leader>vb :call vimspector#ToggleBreakpoint()<CR>
"nmap <leader>vc :call vimspector#Continue()<CR>
"nmap <leader>vr :VimspectorReset<CR>
"nmap <leader>vd :CocCommand java.debug.vimspector.start<CR>
noremap <leader>t :vimgrep /TODO/j lib/**<CR>:cw<CR>
map <leader>x :w! \| !compiler "<c-r>%"<CR>


"============Arduino config=======================
let g:arduino_cmd = '/usr/bin/arduino'
let g:arduino_dir = '/usr/share/arduino'
let g:arduino_home_dir = $HOME . "/.arduino15"

function! MyStatusLine()
  let port = arduino#GetPort()
  let line = '[' . g:arduino_board . '] [' . g:arduino_programmer . ']'
  if !empty(port)
    let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
  endif
  return line
endfunction

autocmd BufNewFile,BufRead *.ino let g:airline_section_x='%{MyStatusLine()}'
autocmd FileType arduino nnoremap <leader>q :bd!<CR>
autocmd FileType arduino nnoremap <leader>u :ArduinoUpload<CR>
autocmd FileType arduino nnoremap <leader>s :ArduinoSerial<CR>
autocmd FileType arduino nnoremap <leader>b :ArduinoChooseBoard<CR>
autocmd FileType arduino nnoremap <leader>p :ArduinoChoosePort<CR>


"============NerdTree config=======================
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",
    "\ "Modified"  : "#d9bf91",
    "\ "Renamed"   : "#51C9FC",
    "\ "Untracked" : "#FCE77C",
    "\ "Unmerged"  : "#FC51E6",
    "\ "Dirty"     : "#FFBD61",
    "\ "Clean"     : "#87939A",
    "\ "Ignored"   : "#808080"
    "\ }
let g:NERDTreeIgnore = ['^node_modules$']

"=================COC config=========================
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" \ 'coc-eslint',
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"
" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

"================Groff====================================
au! BufRead,BufNewFile *.grap setfiletype psf
au! BufRead,BufNewFile *.ms noremap <leader>v :!setsid zathura "%:p:r.pdf"<CR>
au! BufRead,BufNewFile *.ms set makeprg=compiler\ %
autocmd BufWritePost *.ms !compiler %
"!groff -Geptk -ms -Tps "%:p" > "%:p:r.ps" && ps2pdf "%:p:r.ps" > "%:p:r.pdf" && rm "%:p:r.ps" > /dev/null

autocmd BufWritePost *.mom !pdfmom "%:p" > "%:p:r.pdf"
au! BufRead,BufNewFile *.mom    setfiletype mom


au! BufRead,BufNewFile *.dart  source ~/.config/nvim/flutter_macros.vim
au BufNewFile,BufRead *.ts setlocal filetype=typescript


"==========================Functions=========================
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"==========================Python=========================
au BufNewFile,BufRead *.py map <F5> :CocCommand python.execInTerminal<CR>
"
"==========================Bash=========================
au BufNewFile,BufRead *.sh map <F5> :w<CR>:!bash %<CR>
au BufNewFile,BufRead *.bash map <F5> :w<CR>:!bash %<CR>

"=================DWM Blocs====================
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }

"=================Latex====================
let g:tex_flavor = 'latex'
au! BufRead,BufNewFile *.tex noremap <F12> :!setsid zathura "%:r.pdf"<CR>
au! BufRead,BufNewFile *.tex set makeprg=make
autocmd BufWritePost *.tex make

"==========================Python=========================
au BufNewFile,BufRead *.py map <F5> :CocCommand python.execInTerminal<CR>

"=========================C++=========================
au BufNewFile,BufRead *.cpp map <M-c> :!g++ -o  %:r.out %<CR>
au BufNewFile,BufRead *.cpp map <M-x> :!./%:r.out<CR>

"========================Java=========================
au BufNewFile,BufRead *.java nmap <leader>jc :w<CR>:!javac %<CR>
au BufNewFile,BufRead *.java nmap <leader>jd :w<CR>:VimuxRunCommand "javac ".expand("%")." && jrc ".expand("%:t:r")<CR>
au BufNewFile,BufRead *.java nmap <leader>jr :w<CR>:VimuxRunCommand "javac ".expand("%")." && java ".expand("%:t:r")<CR>

"======================Markdown=========================
au BufNewFile,BufRead *.md map <M-CR> :w<CR> :!pandoc % --pdf-engine=xelatex -V mainfont="Linux Libertine O" -o %:r.pdf<CR>

"======================Vener=========================
let g:venter_width = &columns/6

"==========================Emmet=========================
"let g:user_emmet_leader_key = ','

"=======================Greek Stuff============================
" always edit in utf-8:
set encoding=utf-8
" but be ready to change encoding with a couple of shortcuts:
map _u :set encoding=utf-8
map _1 :set encoding=iso-8859-1
map _7 :set encoding=iso-8859-7
" assign keyboard commands while using the greek keyboard:
map Α A
map Β B
map Ψ C
map Δ D
map Ε E
map Φ F
map Γ G
map Η H
map Ι I
map Ξ J
map Κ K
map Λ L
map Μ M
map Ν N
map Ο O
map Π P
map Q Q
map Ρ R
map Σ S
map Τ T
map Θ U
map Ω V
map W W
map Χ X
map Υ Y
map Ζ Z
map α a
map β b
map ψ c
map δ d
map ε e
map φ f
map γ g
map η h
map ι i
map ξ j
map κ k
map λ l
map μ m
map ν n
map ο o
map π p
map q q
map ρ r
map σ s
map τ t
map θ u
map ω v
map ς w
map χ x
map υ y
map ζ z
map γ; gq
map ψις ciw
