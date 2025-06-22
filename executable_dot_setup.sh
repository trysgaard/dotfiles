#!/bin/bash
set -eufo pipefail
echo "🚀  Setting up @trysgaard dotfiles."

# Check if Xcode command line tools are installed
if xcode-select -p &> /dev/null; then
  echo "✅  Xcode command line tools are already installed."
else
  echo "🔧  Installing Xcode command line tools..."
  xcode-select --install &> /dev/null
  echo "✅  Xcode command line tools installed successfully."
fi

# Check if Homebrew is installed
if which -s "brew"; then
  echo "✅  Homebrew is already installed."
else
  echo "🍺  Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅  Homebrew installed successfully."
fi

# Check if Oh My Zsh is installed
if [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo "✅  oh-my-zsh is already installed."
else
  echo "💻  Installing oh-my-zsh"
  yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "✅  oh-my-zsh installed successfully."
fi

# Check if chezmoi is installed
if which -s "chezmoi"; then
  echo "✅  Chezmoi is already installed."
else
  echo "⚪️  Installing Chezmoi"
  brew install chezmoi
fi

# Initialize or update chezmoi
if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "ℹ️  Chezmoi already initialized, pulling latest changes..."
  chezmoi update
  echo "✅  Chezmoi updated"
else
  echo "🔧  Initializing Chezmoi..."
  chezmoi init --apply trysgaard
  echo "✅  Chezmoi initialized and applied"
fi

echo "🎉  Setup complete! Your dotfiles are now configured." 