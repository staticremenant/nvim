## :key: Hotkeys config

:warning: Not all hotkeys are listed here, but the most useful ones are.

`leader` = `space`

### :mag_right: Code / Navigation

| Shortcut     | Action                                             |
|--------------|----------------------------------------------------|
| `gd`         | go to definition                                   |
| `gr`         | go to references                                   |
| `gD`         | go to declarations                                 |
| `gi`         | go to implementations                              |
| `K`          | lsp buf hover                                      |
| `<leader>e`  | diagnostic open float window                       |
| `<leader>ff` | find files                                         |
| `<leader>fa` | find all hidden files                              |
| `<leader>fw` | find by word                                       |
| `<C-q>`      | quote telescope prompt                             |
| `<C-i>`      | quote telescope prompt with postfix " --iglob "    |
| `<C-d>`      | quote telescope prompt with postfix " --iglob **/" |
| `<leader>gf` | format code                                        |
| `<leader>h`  | toggle horizontal terminal                         |
| `<leader>i`  | toggle float terminal                              |
| `<C-h>`      | toggle horizontal terminal (t mode)                |
| `<C-i>`      | toggle float terminal (t mode)                     |
| `C-n`        | toggle file-tree                                   |
| `<leader>rn` | lsp rename                                         |
| `<leader>ca` | code actions                                       |
| `<leader>fz` | find in current buffer                             |
| `<leader>ds` | document symbols (slow)                            |
| `<leader>fb` | find buffers                                       |
| `d`          | delete telscope buffer                             |
| `<leader>u`  | toggle undotree                                    |
| `<leader>a`  | harpoon add file                                   |
| `<leader>m`  | harpoon menu                                       |
| `<leader>1-5`| harpoon jump to saved buffer                       |
| `<leader>en` | jump to next error                                 |
| `<leader>ep` | jump to previous error                             |
| `<leader>tw` | trouble error list for workspace                   |
| `<leader>tb` | trouble error list for buffer                      |

### :gear: Debug

| Shortcut      | Action                        |
|---------------|-------------------------------|
| `<leader>db`  | debug toggle breakpoint       |
| `<leader>dc`  | debug start/continue          |
| `<leader>du`  | debug show sidebar            |
| `<leader>dq`  | debug quit                    |

### :octocat: Git

| Shortcut     | Action                             |
|--------------|------------------------------------|
| `<leader>gt` | telescope git status               |
| `<leader>cm` | git commits list                   |
| `<leader>gp` | git push                           |
| `<leader>gc` | git commit changes                 |
| `<leader>gl` | git pull                           |
| `<leader>ga` | git add all changed files          |
| `<leader>gds`| git diff split (resolve conflicts) |
| `<leader>ggr`| git get right (conflict)           |
| `<leader>ggl`| git get left (conflict)            |
| `<leader>gb` | git blame line                     |
| `<leader>ggb`| git blame buffer                   |
| `<leader>ph` | git preview hunk                   |
| `<leader>td` | git toggle deleted lines           |
| `<leader>rh` | git reset hunk                     |
| `[h`         | git jump to previous hunk          |
| `]h`         | git jump to next hunk              |

### :wrench: Additional shortcuts

| Shortcut     | Action                             |
|--------------|------------------------------------|
| `<C-w>+-`    | vertical resize                    |
| `<C-w>,.`    | horizontal resize                  |
| `<leader>cp` | copy buffer relative path          |
| `<leader>ls` | load session for current directory |
| `<leader>qs` | don't save session on exit         |
| `<leader>pr` | show vim motions hints             |
