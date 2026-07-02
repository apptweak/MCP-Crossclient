#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCOPE="${CODEX_MCP_SCOPE:-user}"
API_KEY="${APPTWEAK_API_KEY:-YOUR_APPTWEAK_API_KEY}"
SERVER_KEY='apptweak-api'
LEGACY_SERVER_KEY='apptweak api'

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
[mcp_servers.$SERVER_KEY]
command = "npx"
args = ["-y", "mcp-remote", "https://developers.apptweak.com/mcp", "--header", "X-Apptweak-Key: \${APPTWEAK_API_KEY}"]
env = { APPTWEAK_API_KEY = "$API_KEY" }
EOF
)

if [ -f "$CONFIG_PATH" ]; then
  cp "$CONFIG_PATH" "$CONFIG_PATH.backup.$(date +%s)"
  node -e "
    const fs = require('fs');
    const path = process.argv[1];
    const block = process.argv[2];
    const serverKey = process.argv[3];
    const legacyServerKey = process.argv[4];
    let content = fs.readFileSync(path, 'utf8');
    const legacyHeader = '[mcp_servers.\"' + legacyServerKey + '\"]';
    const legacyStart = content.indexOf(legacyHeader);
    if (legacyStart !== -1) {
      let legacyEnd = content.indexOf('\n[', legacyStart + 1);
      if (legacyEnd === -1) legacyEnd = content.length;
      content = content.slice(0, legacyStart) + content.slice(legacyEnd).replace(/^\n+/, '');
    }
    const header = '[mcp_servers.' + serverKey + ']';
    const start = content.indexOf(header);
    if (start === -1) {
      content = content.replace(/\s*$/, '') + '\n\n' + block + '\n';
    } else {
      let end = content.indexOf('\n[', start + 1);
      if (end === -1) end = content.length;
      content = content.slice(0, start) + block + '\n' + content.slice(end).replace(/^\n+/, '');
    }
    fs.writeFileSync(path, content);
  " "$CONFIG_PATH" "$BLOCK" "$SERVER_KEY" "$LEGACY_SERVER_KEY"
else
  printf '%s\n' "$BLOCK" > "$CONFIG_PATH"
fi

echo "AppTweak MCP configured at: $CONFIG_PATH (scope: $SCOPE)"
echo "Restart Codex to load the new MCP server."
