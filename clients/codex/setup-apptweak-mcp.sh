#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCOPE="${CODEX_MCP_SCOPE:-user}"
API_KEY="${APPTWEAK_API_KEY:-YOUR_APPTWEAK_API_KEY}"

if [ "$API_KEY" = "YOUR_APPTWEAK_API_KEY" ]; then
  echo "Set APPTWEAK_API_KEY before running this script."
  echo "Example: APPTWEAK_API_KEY=your-key $0"
  exit 1
fi

case "$SCOPE" in
  user)
    CONFIG_PATH="${CODEX_CONFIG:-$HOME/.codex/config.toml}"
    ;;
  project)
    CONFIG_PATH="${CODEX_PROJECT_CONFIG:-.codex/config.toml}"
    ;;
  *)
    echo "Unknown scope: $SCOPE (use user or project)"
    exit 1
    ;;
esac

mkdir -p "$(dirname "$CONFIG_PATH")"

BLOCK=$(cat <<EOF
[mcp_servers."apptweak api"]
command = "npx"
args = ["-y", "mcp-remote", "https://developers.apptweak.com/mcp", "--header", "X-Apptweak-Key: \${APPTWEAK_API_KEY}"]
env = { APPTWEAK_API_KEY = "$API_KEY" }
EOF
)

if [ -f "$CONFIG_PATH" ]; then
  cp "$CONFIG_PATH" "$CONFIG_PATH.backup.$(date +%s)"
  if grep -q '\[mcp_servers\."apptweak api"\]' "$CONFIG_PATH"; then
    node -e "
      const fs = require('fs');
      const path = process.argv[1];
      const block = process.argv[2];
      let content = fs.readFileSync(path, 'utf8');
      const start = content.indexOf('[mcp_servers.\"apptweak api\"]');
      if (start === -1) process.exit(1);
      let end = content.indexOf('\n[', start + 1);
      if (end === -1) end = content.length;
      content = content.slice(0, start) + block + '\n' + content.slice(end).replace(/^\n+/, '');
      fs.writeFileSync(path, content);
    " "$CONFIG_PATH" "$BLOCK"
  else
    printf '\n%s\n' "$BLOCK" >> "$CONFIG_PATH"
  fi
else
  printf '%s\n' "$BLOCK" > "$CONFIG_PATH"
fi

echo "AppTweak MCP configured at: $CONFIG_PATH (scope: $SCOPE)"
echo "Restart Codex to load the new MCP server."
