#!/bin/bash
# racoon-bootstrap.sh — one-time setup for Racoon.vim
# Installs the LSP servers and the formatters referenced in the vimrc.

echo "Installing LSP servers and formatters for Racoon.vim..."

# TypeScript / JavaScript
if ! command -v typescript-language-server &> /dev/null; then
  echo "  → TypeScript LSP..."
  npm i -g typescript-language-server typescript
fi

# CSS / HTML / JSON
if ! command -v vscode-langservers-extracted &> /dev/null; then
  echo "  → CSS/HTML/JSON LSP..."
  npm i -g vscode-langservers-extracted
fi

# Bash
if ! command -v bash-language-server &> /dev/null; then
  echo "  → Bash LSP..."
  npm i -g bash-language-server
fi

# Prettier (ALE fixer for js/ts/css/html/json)
# shfmt is also used by ALE, but is not installed here.
# See the README for how to get it.
if ! command -v prettier &> /dev/null; then
  echo "  → Prettier..."
  npm i -g prettier
fi

echo "Done! Open Vim and LSP will just work."
