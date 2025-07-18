# Samarth's Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua, designed for productivity and aesthetic appeal. This configuration provides a complete IDE-like experience with LSP support, intelligent autocompletion, and beautiful UI enhancements.

## ✨ Features

### 🎨 **Beautiful UI**
- Multiple colorscheme options with live preview via **Themery**
- Customizable dashboard with **Alpha**
- Enhanced status line with **Lualine**
- Modern buffer/tab management with **Bufferline**
- Beautiful notifications and command palette with **Noice**

### 🔍 **Fuzzy Finding & Navigation**
- **Telescope** - Powerful fuzzy finder for files, text, and more
- **Flash.nvim** - Quick navigation with smart jump motions
- **File Explorer** - Built-in file management with Snacks.nvim

### 💻 **Development Tools**
- **LSP Support** - Full language server protocol integration
- **Smart Autocompletion** - Blink.cmp with snippet support
- **Syntax Highlighting** - TreeSitter for accurate code parsing
- **Code Formatting** - Conform.nvim with multiple formatter support
- **Git Integration** - Gitsigns and LazyGit for version control
- **GitHub Copilot** - AI-powered code suggestions

### 🛠️ **Productivity Features**
- **Session Management** - Auto-session for workspace persistence
- **Window Management** - Easy split and tab management
- **Project-wide Search & Replace** - Spectre for advanced find/replace
- **Todo Comments** - Highlight and navigate TODO/FIXME comments
- **Trouble** - Beautiful diagnostics and quickfix list

## 📦 Installation

### Prerequisites
- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for LSP servers)
- **Python** (for Python LSP support)
- A **Nerd Font** (recommended: Liga SFMono Nerd Font)

### Quick Setup

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install plugins** (automatic on first launch):
   - Lazy.nvim will automatically install all plugins
   - Wait for Mason to install LSP servers

5. **Setup language servers**:
   ```vim
   :Mason
   ```
   Install additional language servers as needed.

## 🎨 Colorschemes

This configuration includes multiple beautiful colorschemes:

- **Solarized Osaka** (default)
- **Gruvbox Material**
- **Bamboo**
- **Vesper**
- **Ashen**
- **Dark Earth**

Switch between themes instantly using `<leader>th` to open **Themery**.

## ⌨️ Key Mappings

### General
| Key | Action |
|-----|--------|
| `<leader>` | Space (leader key) |
| `<leader>nh` | Clear search highlights |
| `<leader>+` / `<leader>-` | Increment/decrement numbers |

### Window Management
| Key | Action |
|-----|--------|
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make splits equal size |
| `<leader>sx` | Close current split |
| `<C-Shift-Arrow>` | Navigate between windows |

### Tabs
| Key | Action |
|-----|--------|
| `<C-t>` | Open new tab |
| `<C-x>` | Close current tab |
| `<C-Left/Right>` | Navigate tabs |

### File Operations
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>ff` | Find files (opens in new tab) |
| `<leader>fs` | Find text in project |
| `<leader>fr` | Find recent files (opens in new tab) |
| `<C-p>` | Git files (opens in new tab) |

### LSP Features
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `K` | Show hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>rs` | Restart LSP |

### Git
| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `]h` / `[h` | Next/previous hunk |

### Diagnostics & Trouble
| Key | Action |
|-----|--------|
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xt` | Todo comments |

### Session Management
| Key | Action |
|-----|--------|
| `<leader>wr` | Restore session |
| `<leader>ws` | Save session |

## 🔧 Language Support

### Currently Configured Languages:
- **TypeScript/JavaScript** (ts_ls, eslint)
- **Python** (pyright)
- **C/C++** (clangd)
- **Lua** (lua_ls)
- **HTML/CSS** (html, cssls)
- **JSON** (jsonls)
- **Tailwind CSS** (tailwindcss)
- **Emmet** (emmet_ls)

### Adding New Languages:
1. Edit [`lua/samarth/plugins/lsp.lua`](lua/samarth/plugins/lsp.lua)
2. Add the language server to `ensure_installed`
3. Configure server-specific settings if needed
4. Restart Neovim and run `:Mason` to install

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin version lock
└── lua/samarth/
    ├── lazy.lua               # Plugin manager setup
    ├── core/                  # Core configuration
    │   ├── init.lua
    │   ├── options.lua        # Neovim options
    │   ├── keymaps.lua        # Key mappings
    │   └── autocmds.lua       # Auto commands
    └── plugins/               # Plugin configurations
        ├── alpha.lua          # Dashboard
        ├── blink.lua          # Autocompletion
        ├── colorscheme.lua    # Color schemes
        ├── lsp.lua            # Language servers
        ├── telescope.lua      # Fuzzy finder
        └── ... (other plugins)
```

## 🚀 Performance

This configuration is optimized for performance:
- **Lazy loading** - Plugins load only when needed
- **Fast startup** - Optimized plugin loading order
- **Efficient LSP** - Smart server management with Mason
- **Minimal overhead** - Carefully selected plugins

## 🛠️ Customization

### Adding Plugins
1. Create a new file in `lua/samarth/plugins/`
2. Follow the existing plugin structure
3. Restart Neovim - Lazy will auto-detect the new plugin

### Changing Settings
- **Core settings**: Edit files in `lua/samarth/core/`
- **Plugin settings**: Edit respective files in `lua/samarth/plugins/`
- **Keymaps**: Modify `lua/samarth/core/keymaps.lua`

### For C++ Development
For optimal C++ experience:
1. Create a `compile_commands.json` in your project root, or
2. Create a `.clangd` file with your include paths:
   ```yaml
   CompileFlags:
     Add:
       - -std=c++17
       - -I/path/to/your/includes
   ```

## 🐛 Troubleshooting

### Common Issues:

**LSP not working:**
```vim
:LspInfo          " Check LSP status
:LspRestart       " Restart LSP servers
:Mason            " Check installed servers
```

**Plugins not loading:**
```vim
:Lazy sync        " Sync all plugins
:Lazy health      " Check plugin health
```

**Completion not working:**
- Ensure LSP server is running (`:LspInfo`)
- Check if blink.cmp is loaded (`:Lazy`)
- Verify language server is installed (`:Mason`)

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have improvements or bug fixes, pull requests are welcome.

## 📝 License

This configuration is open source and available under the MIT License.

---

**Enjoy coding with this beautiful and powerful Neovim setup! 🚀**