" ------------------------------------------------------------------------------
"
" Archivo:  ~/.vimrc
" Descrip:  Mi archivo personal de configuración de Vim
"
" Autor:    Gregorio Espadas <gregorio@gespadas.com>
" Social:   @GregorioEspadas (Twitter) y +GregorioEspadas (Google+)
"
" Notas:    Cada opción viene acompañada con una breve descripción, recomiendo
"           consultar la ayuda (:help mi-duda) para comprender a detalle la
"           finalidad y alcance de cada una de ellas.
"
"           Última fecha de modificación: 2013-11-23
"
" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
" Color:    Solarized
" Enlace:   https://github.com/altercation/vim-colors-solarized
" Nota:     No es necesario habilitar t_Co=256 para Vim dentro de URxvt pues
"           se usará la paleta personalizada de Solarized en ~/.Xresources.
" ------------------------------------------------------------------------------

filetype plugin on                " Habilitar la detección del tipo de archivo
syntax enable                     " Habilitar el resaltado de sintaxis
set background=dark               " Fondo oscuro (usar 'light' según gustos)

if &term =~? 'linux'              " Si se usa TTY, entonces:
  set t_Co=16                     "    - Establecer 16 colores
  let g:solarized_termcolors= 16  "    - Ajustar el tema de colores para TTY
endif                             " Fin Si

let g:solarized_termtrans = 0     " ¿Fondo transparente? 0 = false, 1 = true
let g:solarized_bold = 1          " ¿Uso de negritas?    0 = false, 1 = true
let g:solarized_underline = 1     " ¿Uso de subrayado?   0 = false, 1 = true
let g:solarized_italic = 1        " ¿Uso de cursivas?    0 = false, 1 = true

colorscheme solarized             " Habilitar el tema de colores


" ------------------------------------------------------------------------------
" Fuente:   Terminus
" Enlace:   http://terminus-font.sourceforge.net/
" Paquete:  terminus-font (disponible en [community] de ArchLinux)
" Nota:     Esta configuración sólo aplica para Gvim. Para establecer Terminus
"           como la fuente para Vim en:
"           - URxvt » Usar ~/.Xresources.
"           - TTY   » Usar /etc/vconsole.conf
" ------------------------------------------------------------------------------

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Terminus\ 18
  elseif has("gui_photon")
    set guifont=Terminus:s18
  elseif has("gui_kde")
    set guifont=Terminus/18/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-terminus-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Terminus:h18:cDEFAULT
  endif
endif


" ------------------------------------------------------------------------------
" Configuración del comportamiento general de Vim
" ------------------------------------------------------------------------------

set nocompatible                  " No usar la vieja configuración de vi
set encoding=utf-8                " Establecer la codificación de texto
set modelines=0                   " Prevención de agujeros de seguridad
set wildignorecase                " Completado de archivos 'case-insensitive'
set autoread                      " Recargar archivo si ha cambiado externamente
set scrolloff=1                   " Margen de líneas en desplazamiento vertical
set showmode                      " Mostrar el modo actual en la parte inferior
set showcmd                       " Mostrar comandos parciales en parte inferior
set hidden                        " No libera los buffers que no estén visibles
set wildmenu                      " Mejor completado en la línea de comandos
set wildmode=full                 " Tipo de completado en la línea de comandos
set visualbell                    " Usar una alerta visual en vez del 'beep'
set ttyfast                       " Mejor renderizado de texto en TTY
set ruler                         " Mostrar línea y columna del cursor
set laststatus=2                  " Siempre mostrar línea de estado en ventanas
set number                        " Mostrar número de líneas
set undofile                      " Habilita el 'deshacer' persistente 
set splitbelow                    " Nuevas ventanas abajo de la actual
set splitright                    " Nuevas ventanas a la derecha de la actual
set mouse=a                       " Soporte completo para el mouse
set clipboard=unnamedplus         " Registro '+' como alias del registro unnamed
set history=100                   " Cantidad de elementos en el historial


" ------------------------------------------------------------------------------
" Configuración de las tabulaciones e indentación
" ------------------------------------------------------------------------------

filetype indent on                " Indentación dependiente del lenguaje
set backspace=indent,eol,start    " Comportamiento de la tecla retroceso
set smartindent                   " Indentación inteligente
set autoindent                    " Indentación automática
set tabstop=4                     " Espacios usados por <Tab>
set shiftwidth=4                  " Espacios usados por la auto indentación
set softtabstop=4                 " Espacios contados por <Tab> en ediciones
set expandtab                     " Usa espacios en lugar de <Tab>s


" ------------------------------------------------------------------------------
" Configuración de líneas largas
" ------------------------------------------------------------------------------

set wrap             " Ajuste de línea dinámico (no modifica el texto)
set textwidth=0      " Ancho máximo del texto al escribir (modifica el texto)
set wrapmargin=0     " Margen en caracteres en el extremo derecho de la ventana
set formatoptions=ro " Inserta la marca de comentario luego de <CR> y o/O
set colorcolumn=80   " Muestra una columna coloreada en la posición indicada


" ------------------------------------------------------------------------------
" Opciones de búsquedas
" ------------------------------------------------------------------------------

set ignorecase       " Búsquedas 'case-insensitive'
set smartcase        " Ignora lo anterior si en patrón de búsqueda hay mayśculas
set incsearch        " Muestra el resultado de la búsqueda mientras se escribe
set showmatch        " Muestra la pareja de paréntesis, llaves o brackets
set hlsearch         " Habilita el resaltado de texto en las búsquedas


" ------------------------------------------------------------------------------
" Mapeos de acciones de uso frecuente
" ------------------------------------------------------------------------------

" Cambiando la tecla <leader> (el valor predeterminado es '\')
let mapleader = ","

" Crea un nuevo buffer (vacío, sin nombre)
nmap <leader>n :enew<cr>

" Guarda fácilmente el buffer actual
nmap <leader>w :write<cr>

" Cerrar fácilmente el buffer actual, guardando los cambios previamente
map <leader>d :write<cr>:bdelete<cr>

" Salir de vim fácilmente, guardando los cambios en todos los buffers abiertos
nmap <leader>q :wall<cr>:quit<cr>

" Aplica ':source' al archivo actual, guardando los cambios previamente
nmap <leader>s :write<cr>:source %<cr>

" Descarta fácilmente el resaltado luego de una búsqueda.
nnoremap <leader><space> :nohlsearch<CR> 

" Oculta y muestra (alterna) el resaltado luego de una búsqueda
nnoremap <F3> :set hlsearch!<CR>

" Elimina palabras duplicadas en todo el buffer actual
nmap <leader>x :%s/\v<(\w+)\_s+\1>/\1/<CR>

" Busca el texto seleccionado
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Cambiar al siguiente buffer con <Tab>, guardando el buffer si tiene cambios
nnoremap <silent>   <tab> :if &ma && !&ro && &mod <CR> :w<CR> :endif<CR>:bn<CR>
nnoremap <silent> <s-tab> :if &ma && !&ro && &mod <CR> :w<CR> :endif<CR>:bp<CR>

" Atajo (para la línea de comandos) de la ruta (directorio) del buffer actual
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Tratar las líneas largas (con ajuste dinámico) como líneas reales
map j gj
map k gk

" Moverse fácilmente entre ventanas 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" ------------------------------------------------------------------------------
" Rutas para buscar archivos con :find y :vimgrep
" ------------------------------------------------------------------------------

set path+=/srv/http/**
set path+=/media/datos/Dropbox/notas/**
set path+=~/.config/openbox/**


" ------------------------------------------------------------------------------
" Abreviaciones
" ------------------------------------------------------------------------------

" Abreviaciones para HTML
iab <a <a href="" title=""></a><ESC>4F"a<C-R>=Eatchar('\s')<CR>
iab <p <p></p><ESC>3hi<C-R>=Eatchar('\s')<CR>

" Abreviaciones para PHP
iab /** /**<CR><CR><BS>/<Up><Space>


" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

" Pathogen - https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Markdown Vim Mode - https://github.com/plasticboy/vim-markdown
let g:vim_markdown_initial_foldlevel=2


" ------------------------------------------------------------------------------
" Funciones personalizadas
" ------------------------------------------------------------------------------

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

