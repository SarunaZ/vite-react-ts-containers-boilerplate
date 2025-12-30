#!/bin/bash
set -e

echo "📦 Setting up dev container..."

# Setup SSH keys for git signing
if [ -f "/root/.ssh/id_rsa.pub" ]; then
  echo "🔑 Found RSA SSH key"
  
  # Copy keys to a writable location with correct permissions
  mkdir -p /root/.ssh-signing
  cp /root/.ssh/id_rsa /root/.ssh-signing/ 2>/dev/null || true
  cp /root/.ssh/id_rsa.pub /root/.ssh-signing/ 2>/dev/null || true
  chmod 700 /root/.ssh-signing
  chmod 600 /root/.ssh-signing/id_rsa 2>/dev/null || true
  chmod 644 /root/.ssh-signing/id_rsa.pub 2>/dev/null || true
  
  echo "⚙️  Configuring git for SSH commit signing..."
  git config --global gpg.format ssh
  git config --global user.signingkey /root/.ssh-signing/id_rsa.pub
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
  git config --global core.sshCommand "ssh -i /root/.ssh-signing/id_rsa -o IdentitiesOnly=yes"
  echo "✓ Git configured for SSH signing with RSA key"
else
  echo "⚠️  No SSH keys found at /root/.ssh/"
  echo "   Expected id_rsa.pub or id_ed25519.pub"
  echo "   Commits will not be signed"
  git config --global commit.gpgsign false
fi
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global gpg.format ssh
echo "✓ Git configured for SSH signing"

# Install dependencies
echo "📥 Installing dependencies..."
yarn install --immutable

# Setup Yarn SDKs for VS Code
echo "🔧 Setting up Yarn SDKs..."
yarn setup:sdks

echo "✅ Dev container setup complete!"

