# NVIM Keymap

- Navigation
- Tools


Show keymap for mode: `:nmap` `:vmap` `:imap`




## Personal

| Action | Keymap |
| ------ | ------ |
| write  | `<C-s>` |
| quit all | `<S-q>` |
|   |   |
| write recording | `<leader>q` |
|   |   |




## Navigation


| Action | Keymap |
| ------ | ------ |
| left   | `h`    |
| down   | `j`    |
| up     | `k`    |
| right  | `l`    |
|        |        |
| next Word | `w` |
| prev Word | `b` |
|   |   |
| start of line | `0` |
| start of line-text | `_` |
| end of line | `$` |
|   |   |
| start of file | `gg` |
| end of file | `G` |
|   |   |
| forward to char | `f<char>` |
| backward to char | `F<char>` |
| repeat f | `;` `,` |
| forward to char (ex) | `t<char>`|
| backward to char (ex) | `T<char>` |
|   |   |
| half page up | `C-u` |
| half page down | `C-d` |
| next paragraph up | `{` |
| next paragraph down | `}` |
|   |   |
| go to line number | `:100` |
|   |   |




### Text Manipulation

| Action | Keymap |
| ------ | ------ |
| insert before | `i` |
| insert after | `a` |
| insert start of line | `I` |
| inster end of line | `A` |
|   |   |
| leave i-mode | `<C-c>` `<Esc>` |
|   |   |
| add newline below | `o` |
| add newline above | `O` |
|   |   |
| replace char | `r` |
|   |   |
| undo | `u` |
| redo | `<C-r>` |
|   |   |




### Text Man. Content

| Action | Keymap |
| ------ | ------ |
| yank/copy | `y` |
| yank line | `yy` |
| yank word | `yw` |
| yank to eol | `y$` |
|   |   |
| paste | `p` |
| paste before | `P` |
| paste sys-clip | `<C-S-v>` |
|   |   |
| delete/cut line | `dd` |
| delete word | `dw` |
| delete to eol | `D` |
| delete | `d` |
| cut + i | `c` |
|   |   |
| delete char | `x` |
| replace char | `r` |
|   |   |
| search string | `/<string>` |
| next result | `n` |
| prev result | `N` |
|   |   |




### Visual Mode

| Action | Keymap |
| ------ | ------ |
| enter | `v` |
| enter linewise | `V` |
| enter blockmode | `<C-V>` |
|   |   |
| shift right | `>` |
| shift left | `<` |
|   |   |
| auto indent | `==` |
|   |   |
| select in between char | `vi<char>` |
| if !between, next in line |   |
| " and char | `va<char>` |
| highlight word | `viw` |
| high all word | `viW` |
|   |   |




## Plugins


### Debugger

| Action | Keymap |
| ------ | ------ |
| toggle breakpoint | `<leader>dt` |
| continue | `<leader>dc` |
|   |   |



### LSP

| Action | Keymap |
| ------ | ------ |
| Hover "n" | `K` |
| goto Def "n" | `<leader>gd` |
| goto Ref "n" | `<leader>gr` |
|   |   |
| Code-Action "n","v" | `<leader>ca` |
|   |   |




### Neo-Tree

- open filesystem: `<C-n>`
- toggle hidden files: `H`



### None-ls (null-ls)

- format: `<leader>gf`




### Telescope

- find files: `<C-p>`

- live-grep: `<leader>fg`




