```markdown
# My Neovim TypeScript Development Configuration

A powerful Neovim setup optimized for TypeScript development, built on top of NvChad.

## Features

- 🚀 Modern TypeScript/JavaScript support with ts_ls
- 🎨 Beautiful UI with NvChad
- 🔍 Advanced search and navigation with Telescope
- 📝 Git integration with Fugitive and Gitsigns  
- ✨ Multi-cursor editing and advanced text manipulation
- 🔧 Auto-formatting and linting
- 💾 Session management for project continuity

## Installation

1. **Backup existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim and let plugins install:**
   ```bash
   nvim
   ```

4. **Install language servers:**
   ```
   :MasonInstall typescript-language-server prettier eslint_d
   ```

## Key Bindings

See [KEYBINDINGS.md](./KEYBINDINGS.md) for complete keybinding reference.

## Customization

- `lua/configs/` - LSP and tool configurations
- `lua/plugins/init.lua` - Plugin specifications
- `lua/mappings.lua` - Custom keybindings
- `lua/chadrc.lua` - NvChad configuration

## Requirements

- Neovim 0.9+
- Node.js (for TypeScript language server)
- ripgrep (for telescope live_grep)
- Git

## Troubleshooting

Run `:checkhealth` to diagnose any issues.
```

### Create Additional Documentation
```bash
# Extract your keybindings to a separate file
nvim KEYBINDINGS.md
```

Copy the keybindings section from your Obsidian cheat sheet into this file.

### Add Installation Script
```bash
nvim install.sh
```

```bash
#!/bin/bash

echo "🚀 Installing Neovim TypeScript Development Configuration..."

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim is not installed. Please install Neovim first."
    exit 1
fi

# Check dependencies
echo "🔍 Checking dependencies..."

if ! command -v node &> /dev/null; then
    echo "⚠️  Node.js not found. TypeScript features may not work."
fi

if ! command -v rg &> /dev/null; then
    echo "⚠️  ripgrep not found. Install with: brew install ripgrep"
fi

# Backup existing config
if [ -d ~/.config/nvim ]; then
    backup_name="nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo "📦 Backing up existing config to ~/.config/$backup_name"
    mv ~/.config/nvim ~/.config/$backup_name
fi

# Clone configuration
echo "📥 Installing configuration..."
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

echo "✅ Configuration installed!"
echo "🎯 Next steps:"
echo "   1. Run 'nvim' to start installation"
echo "   2. Wait for plugins to install"
echo "   3. Run ':MasonInstall typescript-language-server prettier eslint_d'"
echo "   4. Enjoy your new setup! 🎉"
```
