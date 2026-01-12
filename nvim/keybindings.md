# Neovim Keybindings

> **Leader key:** `\` (default) — check with `:echo mapleader`

## Telescope (Fuzzy Finder)

| Action | Keys |
|:-------|:-----|
| Find files | `<leader>` `f` `f` |
| Find files (include ignored) | `<leader>` `f` `F` |
| Live grep | `<leader>` `f` `g` |
| Buffers | `<leader>` `f` `b` |
| Help tags | `<leader>` `f` `h` |
| Fuzzy find in buffer | `//` |

## LSP

| Action | Keys |
|:-------|:-----|
| Go to definition | `gd` |
| Go to declaration | `gD` |
| Go to implementation | `gi` |
| Find references | `gr` |
| Hover docs | `K` |
| Rename symbol | `<leader>` `r` `n` |
| Code actions | `<leader>` `c` `a` |

## Diagnostics

| Action | Keys |
|:-------|:-----|
| Show diagnostic float | `gl` |
| Next diagnostic | `]d` |
| Previous diagnostic | `[d` |
| Diagnostics to loclist | `<leader>` `q` |

## Git (gitsigns)

| Action | Keys |
|:-------|:-----|
| Next change | `]c` |
| Previous change | `[c` |
| Stage hunk | `<leader>` `h` `s` |
| Reset hunk | `<leader>` `h` `r` |
| Stage buffer | `<leader>` `h` `S` |
| Undo stage hunk | `<leader>` `h` `u` |
| Reset buffer | `<leader>` `h` `R` |
| Preview hunk | `<leader>` `h` `p` |
| Blame line | `<leader>` `h` `b` |
| Diff against index | `<leader>` `h` `d` |
| Diff against last commit | `<leader>` `h` `D` |
| Toggle line blame | `<leader>` `t` `b` |
| Toggle deleted inline | `<leader>` `t` `D` |

## Folding

| Action | Keys |
|:-------|:-----|
| Toggle fold | `<leader>` `z` |
| Open all folds | `<leader>` `z` `o` |
| Close all folds | `<leader>` `z` `c` |

## Comment.nvim

| Action | Keys |
|:-------|:-----|
| Toggle line comment | `gcc` |
| Toggle block comment | `gbc` |
| Comment (visual) | `gc` |
| Block comment (visual) | `gb` |

## nvim-surround

| Action | Keys |
|:-------|:-----|
| Add surround | `ys` `{motion}` `{char}` |
| Delete surround | `ds` `{char}` |
| Change surround | `cs` `{old}` `{new}` |

**Examples:**
- `ysiw"` — surround word with `"`
- `ds'` — delete surrounding `'`
- `cs"'` — change `"` to `'`
- `yss)` — surround entire line with `()`

## Leader Key Pattern

| Prefix | Context |
|:-------|:--------|
| `<leader>f` | **F**ind (Telescope) |
| `<leader>h` | Git **h**unk operations |
| `<leader>t` | **T**oggles |
| `<leader>z` | Folds |
| `<leader>r` | **R**efactor (rename) |
| `<leader>c` | **C**ode actions |
| `g` | **G**o to / LSP navigation |
