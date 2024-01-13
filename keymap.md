# NVIM Keymap

- Navigation
- Tools


## Navigation


left: 'h'
down: 'j'

up: 'k'
right: 'l'


next Word: 'w'
prev Word: 'b'

start of line: '0'
start of line-text: '_'
end of line: '$'

start of file: 'gg'
end of file: 'G'


go forward to next char: 'f<char>'
go to char: 'ft<char>'



### Text Manipulation

insert before: 'i'
insert after: 'a'
insert start of line: 'I'
insert end of line: 'A'

leave instert mode: '<C-c>' or '<Esc>'

add newline below: 'o'
add newline above: 'O'

replace char: 'r'

undo: 'u'
redo: '<ctrl>'


### Text Man. Content

yank/copy: 'y'
yank line: 'yy'
yank word: 'yw'
yank to end of line: 'y$'

paste: 'p'
paste before: 'P'

delete/cut line: 'dd'
del word: 'dw'
del to end of line: 'D'

del char: 'x'

search string: '/<string>'



### Visual Mode

enter: 'v'
enter linewise: 'V'
enter blockmode: 'Ctrl'

shift right: '<'
shift left: '>'

shift left shiftwidth: '>>'
shift right shiftwidth: '<<'

auto-indent line: '=='




## Tools


### LSP

Hover (n): 'K'
goto Def(n): '<leader>gd'
goto Ref(n): '<leader>gr'

Code-Action(n,v): '<leader>ca'


### Neo-Tree

filesystem: '<C-n>'


### None-ls (null-ls)

format: '<leader>gf'


### Telescope

find files: '<C-p>'

live-grep: '<leader>fg'


