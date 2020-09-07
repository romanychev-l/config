scriptencoding utf-8

set term=xterm
set backspace=2 " make backspace work like most other apps
set t_Co=256

set number      " �~]�~Cме�~@а�~Fи�~O �~A�~B�~@ок                              
set ruler       " line and column where I have the cursor                        
set linebreak   " �~_е�~@ено�~A �~A�~B�~@ок                                    
set smartindent " �~Pв�~Bома�~Bи�~Gе�~Aкое �~R�~K�~@авнивание  ие  
set laststatus=2                                                                 
                                                                                 
set statusline =%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P                                
                                                                                 
" �~]а�~A�~B�~@ойка о�~B�~A�~B�~Cпов                                        
set tabstop=4                                                                    
set shiftwidth=4                                                                 
set smarttab                                                                     
set expandtab

"history                                                                         
set noswapfile                                                                   
set nobackup                                                                     
set nowritebackup                                                                
                                                                                 
set undofile                                                                     
set undodir=$HOME/.vim/undo                                                      
set undolevels=1000                                                              
set undoreload=10000

execute pathogen#infect()

let g:ctrlp_map = '<C-f>'
nnoremap \b :CtrlPBuffer<CR> 

let g:NERDTreeHighlightCursorline = 1                                            
let g:nerdtree_sync_cursorline = 1

nnoremap <silent> \\ :NERDTreeToggle <CR>

set exrc
set secure

function! s:EditCppHeader()                                                      
    if (filereadable(expand("%:r") . ".h"))                                      
        edit %:r.h                                                               
    else                                                                         
        edit %:r.hpp                                                             
    endif                                                                        
endfunction                                                                      
                                                                                 
function! s:EditCppSource()                                                      
    if (filereadable(expand("%:r") . ".cpp"))                                    
        edit %:r.cpp                                                             
    else                                                                         
        edit %:r.c                                                               
    endif                                                                        
endfunction                                                                      
                                                                                 
function! s:SwitchSourceHeader()                                                 
    if (expand("%:e") == "cpp")                                                  
        call s:EditCppHeader()                                                   
    elseif (expand("%:e") == "c")                                                
        call s:EditCppHeader()                                                   
    else                                                                         
        call s:EditCppSource()                                                   
    endif                                                                        
endfunction                                                                      
                                                                                 
function! s:SplitSwitchSourceHeader()                                            
    split                                                                        
    wincmd w                                                                     
    call s:SwitchSourceHeader()                                                  
endfunction                                                                      
                                                                                 
function! s:VSplitSwitchSourceHeader()                                           
    vsplit                                                                       
    wincmd w                                                                     
    call s:SwitchSourceHeader()                                                  
endfunction                                                                      
                                                                                 
command! -nargs=0 SwitchSourceHeader       call s:SwitchSourceHeader()           
command! -nargs=0 SplitSwitchSourceHeader  call s:SplitSwitchSourceHeader()      
command! -nargs=0 VSplitSwitchSourceHeader call s:VSplitSwitchSourceHeader()     
                                                                                 
au FileType c,cpp map \h :SwitchSourceHeader<CR>                                 
au FileType c,cpp map \s :SplitSwitchSourceHeader<CR>                            
au FileType c,cpp map \v :VSplitSwitchSourceHeader<CR> 

set wildmode=longest,list,full                                                   
set wildmenu  


command DelExtraWhitespace %s/\s\+$//e
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=Blue
autocmd BufWritePre * :DelExtraWhitespace
highlight ExtraWhitespace ctermbg=Blue

set hlsearch    
nnoremap <F3>  :nohlsearch<CR>

set colorcolumn=81
