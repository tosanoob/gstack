#!/usr/bin/env bash
# gstack-bootstrap — The unified installer for Gemini CLI Skill Pack
# Usage: curl -fsSL https://raw.githubusercontent.com/garrytan/gstack/main/bootstrap.sh | bash

set -e

# --- CONFIGURATION ---
DEFAULT_INSTALL_DIR="$HOME/.gemini/skills/gstack"
REPO_URL="https://github.com/tosanoob/gstack.git"

echo "🚀 Bootstrapping gstack — Your Agentic Productivity Suite..."

# 1. Dependency Check: git
if ! command -v git >/dev/null 2>&1; then
  echo "❌ Error: git is not installed. Please install git and try again."
  exit 1
fi

# 2. Dependency Check: Bun (Required for the gstack engine)
if ! command -v bun >/dev/null 2>&1; then
  echo "📦 Bun not found. Installing Bun..."
  curl -fsSL https://bun.sh/install | bash
  # Export Bun to the current path for this script
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# 3. Strategic Installation
if [ ! -d "$DEFAULT_INSTALL_DIR" ]; then
  echo "📂 Creating installation directory at $DEFAULT_INSTALL_DIR..."
  mkdir -p "$(dirname "$DEFAULT_INSTALL_DIR")"
  git clone "$REPO_URL" "$DEFAULT_INSTALL_DIR"
else
  echo "🔄 gstack already exists. Updating to the latest version..."
  cd "$DEFAULT_INSTALL_DIR" && git pull origin main
fi

# 4. Hermetic Build & Setup
cd "$DEFAULT_INSTALL_DIR"
echo "🛠️  Building gstack binaries and browser..."
./setup

# 5. Final Activation Fact
echo ""
echo "===================================================================="
echo "🎉 GSTACK IS READY TO WORK FOR YOU"
echo "===================================================================="
echo "To activate these skills in any Gemini CLI session, paste this:"
echo ""
echo "  Please use 'save_memory' to remember: My gstack skills are"
echo "  located at $DEFAULT_INSTALL_DIR. You are now authorized"
echo "  to use the /review, /qa, /plan-ceo-review, and /ship workflows"
echo "  from that directory in any project I work on."
echo ""
echo "Location: $DEFAULT_INSTALL_DIR"
echo "Version: $(cat VERSION 2>/dev/null || echo '0.x.x')"
echo "===================================================================="
echo "Boil the lake. Ship with confidence."
