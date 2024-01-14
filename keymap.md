# NVIM Keymap

- Navigation
- Tools




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
| forward to char (ex) | `t<char>`|
| backward to char (ex) | `T<char>` |
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
|   |   |
| delete/cut line | `dd` |
| delete word | `dw` |
| delete to eol | `D` |
|   |   |
| delete char | `x` |
|   |   |
| search string | `/<string>` |
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




## Plugins


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




### None-ls (null-ls)

- format: `<leader>gf`




### Telescope

- find files: `<C-p>`

- live-grep: `<leader>fg`




