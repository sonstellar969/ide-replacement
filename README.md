# Neovim IDE Replacement

An NvChad-based terminal IDE configuration for C and C++, with support for Python, Rust, JavaScript, TypeScript, and Lua.

## Features

- NvChad interface with file explorer, tabline, statusline, and terminal workflow
- clangd, pyright, rust-analyzer, ts_ls, and lua_ls through Mason
- nvim-cmp completion with LuaSnip snippets
- codelldb debugging for C and C++
- clang-format, Prettier, Black, and StyLua formatters
- Telescope file and text search
- Trouble diagnostics panel
- Tree-sitter syntax highlighting
- Gitsigns gutter markers

## Requirements

macOS with Neovim 0.10 or newer is recommended. Install the command-line tools and external programs used by the configuration:

```sh
xcode-select --install
brew install git ripgrep node python rust
```

## Installation

Back up an existing configuration before installing:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
```

Clone this repository and install the configuration:

```sh
git clone https://github.com/sonstellar969/ide-replacement.git ~/ide-replacement
cp -R ~/ide-replacement/nvim ~/.config/nvim
nvim
```

On the first launch, allow lazy.nvim to install plugins. Then restart Neovim and install the language servers, debugger, and formatters:

```vim
:MasonInstall clangd pyright rust-analyzer typescript-language-server lua-language-server codelldb clang-format prettier black stylua
```

Install or update Tree-sitter parsers:

```vim
:TSUpdate
:TSInstall c cpp python rust javascript typescript lua
```

## Daily workflow

Open a project from its directory so the explorer and tools use the project as their working directory:

```sh
cd ~/path/to/project
nvim .
```

Open or create a file directly:

```sh
nvim main.cpp
nvim script.py
```

Inside Neovim, use `i` to insert text, `Esc` to return to normal mode, and `:w` to save.

## Keybindings

The leader key is Space.

| Key | Action |
|---|---|
| `Space e` | Toggle the left file explorer |
| `Space t` | Toggle the bottom terminal |
| `Space f f` | Find files |
| `Space f g` | Search project text with live grep |
| `Space f b` | Switch open buffers |
| `Space x x` | Toggle the diagnostics panel |
| `Space b` | Toggle a debugger breakpoint |
| `Space d u` | Toggle the debugger UI |
| `F5` | Start or continue debugging |
| `F10` | Step over |
| `F11` | Step into |
| `g d` | Go to definition |
| `K` | Show symbol documentation |
| `Space r n` | Rename a symbol |
| `Space c a` | Show code actions |
| `Ctrl-Space` | Trigger completion |
| `Tab` | Select completion or expand a snippet |
| `Enter` | Accept the selected completion |

When the terminal has focus, press `Ctrl-\\` followed by `Ctrl-n` to return to Neovim normal mode. Then window navigation works normally with `Ctrl-w` commands.

## C and C++

Compile and run a simple project:

```sh
clang++ -std=c++20 -g -Wall -Wextra main.cpp -o main
./main
```

Or use one command:

```sh
clang++ -std=c++20 -g -Wall -Wextra main.cpp -o main && ./main
```

The `-g` flag includes debug information for codelldb. To debug, compile the executable, set a breakpoint with `Space b`, and press `F5`. If prompted for the executable, enter `./main`.

### clangd project flags

For a small project without a build system, create `compile_flags.txt` at the project root:

```text
-std=c++20
-Wall
-Wextra
```

This file configures clangd's completion, diagnostics, header lookup, and navigation. It does not compile the program.

For larger projects, create `compile_commands.json` with one exact compilation command per source file:

```json
[
  {
    "directory": "/Users/yourname/project",
    "command": "clang++ -std=c++20 -Wall -Wextra -c /Users/yourname/project/src/main.cpp -o /tmp/main.o",
    "file": "/Users/yourname/project/src/main.cpp"
  }
]
```

Keep this file at the project root. Check the active language server with:

```vim
:LspInfo
```

## Other languages

```sh
python3 script.py
cargo run
node script.js
lua script.lua
```

The configured language servers provide completion, diagnostics, navigation, rename, and code actions. Formatters run automatically when supported files are saved.

## Maintenance

Use these commands when needed:

```vim
:Lazy sync       " Install plugins or apply config changes
:Lazy update     " Update installed plugins
:Mason           " Open the Mason package manager
:MasonUpdate     " Update Mason package metadata
:TSUpdate        " Update Tree-sitter parsers
:checkhealth     " Run Neovim health checks
:LspInfo         " Inspect the language server for the current buffer
```

Update Homebrew tools from the macOS terminal:

```sh
brew update
brew upgrade
```

## Restore the previous configuration

If the migration needs to be reverted:

```sh
mv ~/.config/nvim ~/.config/nvim-nvchad
mv ~/.config/nvim.backup ~/.config/nvim
```
