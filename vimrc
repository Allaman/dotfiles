" Plugin Management {{{
if ! filereadable(system('echo -n "$HOME/.vim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $HOME/.vim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin()
" Tmux
Plug 'preservim/vimux'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
" Whitespace
Plug 'ntpeters/vim-better-whitespace'
" Repeat
Plug 'tpope/vim-repeat'
" Expand region
Plug 'terryma/vim-expand-region'
" 100+ lazy loading syntax
"Plug 'sheerun/vim-polyglot'
" fzf integration
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" float term
Plug 'voldikss/vim-floaterm'
" Color preview
Plug 'ap/vim-css-color'
" Fast movement in vim
Plug 'easymotion/vim-easymotion'
" Linting
Plug 'dense-analysis/ale'
" Aligment
Plug 'junegunn/vim-easy-align'
" Outliner for structured text
" Plug 'vim-voom/VOoM'
" Visualize undo tree
Plug 'mbbill/undotree'
" Vim prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['json', 'markdown', 'yaml', 'html', 'javascript', 'css'] }
" Statusline
Plug 'itchyny/lightline.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Surround
 Plug 'tpope/vim-surround'
" Tags
Plug 'majutsushi/tagbar'
" TOML
Plug 'cespare/vim-toml'
" Markdown
Plug 'plasticboy/vim-markdown'
" Plug 'nelstrom/vim-markdown-folding'
" For formating md tables
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
" Ansible
Plug 'pearofducks/ansible-vim'
" Docker
Plug 'ekalinin/Dockerfile.vim'
" Go support
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" wrapper of Terminal and REPL
" Plug 'kassio/neoterm'
" Commenting
Plug 'scrooloose/nerdcommenter'
" Distraction free writing
Plug 'junegunn/goyo.vim'
" Dimm and highlight cursor line
Plug 'junegunn/limelight.vim'
" Latex
" Plug 'vim-latex/vim-latex'
" Better % matching
Plug 'andymass/vim-matchup'
" Key mapping menu
" Plug 'liuchengxu/vim-which-key'
" Rainbow Paranthesis
" Plug 'luochen1990/rainbow'
" Find and Replace
" Plug 'brooth/far.vim'
" bufkill
Plug 'qpkorr/vim-bufkill'
" Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
"Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" CSV
Plug 'chrisbra/csv.vim'
" Better f F t T
Plug 'unblevable/quick-scope'
" python
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-python/python-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
call plug#end()
" }}}
" UI {{{
" Space above/beside cursor from screen edges
set wildmenu wildmode=full
set showmatch           " highlight matching [{()}]
" }}}
" Misc {{{
set nocompatible
" Disables automatic commenting on newline
" Prevent wrong syntax redering - may slow down
"autocmd BufEnter * :syntax sync fromstart
" }}}
" Search {{{
" highlight last inserted text
nnoremap gV `[v`]
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
" }}}
" Default Mappings {{{
let mapleader=" "
" write file with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" move vertically by visual line when used withput count
" and move by physical line when used with count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" Visually move lines
vmap J :m +1<CR>gv
vmap K :m -2<CR>gv
" change dire to current buufer
nnoremap <Leader>cd :cd %:p:h<cr>
" open previously opened file
nnoremap <Leader><tab> :e#<CR>
" duplicate file
nnoremap <silent> <Leader>fd :clear<bar>silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<bar>redraw<bar>echo "Copied " . expand('%:t') . ' to ' . expand('%:t:r') . '-copy.' . expand('%:e')<cr>
" Change behaviour of Y similar to C and D
nnoremap Y y$
" Cancel search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Toogle whitespace
nnoremap <Leader>tw :set list!<CR>
" Buffer handling
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bd :BD<CR>
nnoremap <Leader>bk :BD!<CR>
nnoremap <leader>bs :w<CR>
" Redo remap
nnoremap U <C-r>
" Undotree
nmap <leader>u :UndotreeShow<CR>
" Substitute in current file
if has("nvim")
    set inccommand=nosplit
endif
nnoremap <Leader>r :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//g<left><Left>
xnoremap <Leader>r "sy:%s/<C-r>s//g<left><Left>
" insert mode completion mappings
" project tags
inoremap <C-t>     <C-x><C-]>
" language and context aware
inoremap <C-Space> <C-x><C-o>
" current buffer
inoremap <C-b>     <C-x><C-p>
" dictionary
inoremap <C-d>     <C-x><C-k>
" file path
inoremap <C-f>     <C-x><C-f>
" whole line
inoremap <C-l>     <C-x><C-l>
" Bash readline mappings
inoremap <C-a>  <C-o>^
inoremap <C-e>  <C-o>$
inoremap <A-b>  <C-Left>
inoremap <A-f>  <C-Right>
inoremap <A-BS> <C-w>
inoremap <A-d>  <C-o>dw
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <A-b>  <C-Left>
cnoremap <A-f>  <C-Right>
cnoremap <A-BS> <C-w>
cnoremap <A-d>  <C-Right><C-w>
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=2      " 10 nested fold max
" }}}
" Indenting {{{
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
" }}}
" Whitespace {{{
" Better Whitespace
" highlighting for the current line in normal mode can be disabled
let g:current_line_whitespace_disabled_soft=1
" strip all trailing whitespace everytime you save
let g:strip_whitespace_on_save = 1
" Do not ask for comfirmation
let g:strip_whitespace_confirm=0
" Strip whitelines at end of file
let g:strip_whitelines_at_eof=1
" characters for whitespaces
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" }}}
" Windows handling {{{
" only show focused window
nnoremap <leader>on :on<CR>
"" Terminal mode:
"tnoremap <C-h> <c-\><c-n><c-w>h
"tnoremap <C-j> <c-\><c-n><c-w>j
"tnoremap <C-k> <c-\><c-n><c-w>k
"tnoremap <C-l> <c-\><c-n><c-w>l
"" Insert mode:
"inoremap <c-h> <esc><c-w>h
"imap <c-j> <esc><c-w>j
"inoremap <c-k> <esc><c-w>k
"inoremap <c-l> <esc><c-w>l
"" Visual mode:
"vnoremap <C-h> <Esc><c-w>h
"vmap <C-j> <Esc><c-w>j
"vnoremap <C-k> <Esc><c-w>k
"vnoremap <C-l> <Esc><c-w>l
"" Normal mode:
"nnoremap <C-h> <c-w>h
"nmap <C-j> <c-w>j
"nnoremap <C-k> <c-w>k
"nnoremap <C-l> <c-w>l
" Resizing
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" New
nnoremap <silent> <Leader>t :$tabnew<CR>
" close
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>q :close<CR>
" }}}
" Lightline {{{
set noshowmode " do not show mode because it is shown in the status line
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'spell' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ }
      \ }
function! LightlineFilename()
  return expand('%:p')
endfunction" }}}
" Goyo and limelight {{{
" Goyo and limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Limelight Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Limelight Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" }}}
" Snippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END
" }}}
" Gitgutter {{{
let g:gitgutter_map_keys = 0
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hp <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)
" }}}
" FZF {{{
nnoremap <C-p> :Files<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>fr :History<CR>
"nnoremap <leader>w :Windows<CR>
nnoremap <leader>; :BLines<CR>
nnoremap <leader>: :BTags<CR>
"nnoremap <leader>c :Commits<CR>
nnoremap <leader>ft :Filetypes<CR>
"nnoremap <leader>s :Snippets<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment', 'border': 'rounded' } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  "autocmd Filetype fzf noremap <buffer> <C-j> <nop>
  "autocmd Filetype fzf noremap <buffer> <C-k> <nop>
endif
" }}}
" EasyMotion {{{
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
" emulate vim-sneak
nmap <leader>S <Plug>(easymotion-s2)
" }}}
" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" FLoaterm {{{
"let g:floaterm_keymap_toggle = '<leader>f'
"nnoremap <silent> <leader>fs :FloatermSend<CR>
let g:floaterm_gitcommit = 'split'
"command! VF FloatermNew vifm
command! LF FloatermNew lf
nnoremap <leader>lf :LF<CR>
" }}}
" Tmux {{{
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <leader>l :TmuxNavigatePrevious<cr>
map <Leader>tp :VimuxPromptCommand<CR>
map <Leader>tl :VimuxRunLastCommand<CR>
map <Leader>ti :VimuxInspectRunner<CR>
map <leader>tz :VimuxZoomRunner<CR>
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()
" }}}
" Terrafrom {{{
" (Optional)Remove Info(Preview) window
set completeopt-=preview
" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
" }}}
" Markdown {{{
" Indet lists with 2 spaces
let g:vim_markdown_new_list_item_indent = 0
" Open files followed by link in new tab
let g:vim_markdown_edit_url_in = 'tab'
let g:markdown_fenced_languages = ['bash=sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'xml', 'dockerfile', 'terraform', 'java']
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" }}}
" Quickscope {{{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_buftype_blacklist = ['terminal', 'nofile']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" }}}
" Python {{{
au FileType python setl shiftwidth=4 tabstop=4
let g:python_highlight_all = 1
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Ignore line length linting
let g:ale_python_flake8_options = '--ignore=E501'
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction
" }}}
" Bash {{{
au FileType sh setl shiftwidth=2 tabstop=2
nmap <buffer> <leader>eb <Esc>:w<CR>:!clear;bash %<CR>
" }}}
" YAML {{{
" }}}
" JSON {{{
let g:vim_json_syntax_conceal = 0
" }}}
" JavaScript {{{
" }}}
" Fugitive {{{
" Conflict Resolution
nnoremap <leader>gc :Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" }}}
" Indentline {{{
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'nv'
"let g:indentLine_conceallevel = 2
" }}}
" Ale {{{
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 0
" }}}
" Golang {{{
au FileType go setl shiftwidth=2 tabstop=2
au filetype go inoremap <buffer> . .<C-x><C-o>
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
autocmd FileType go nmap <leader>e <Plug>(go-run)
autocmd FileType go nmap <leader>d <Plug>(go-describe)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>j :GoDeclsDir<cr>
autocmd FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
au Filetype go nmap <leader>ta <Plug>(go-alternate-edit)
au Filetype go nmap <leader>tah <Plug>(go-alternate-split)
au Filetype go nmap <leader>tav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gc :GoCoverageToggle -short<cr>
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
let g:go_bin_path = $HOME."/go/bin"
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
set updatetime=300
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" vim:foldmethod=marker:foldlevel=0
