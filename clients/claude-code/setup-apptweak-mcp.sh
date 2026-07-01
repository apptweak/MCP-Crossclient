#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCOPE="${CLAUDE_MCP_SCOPE:-user}"
API_KEY="${APPTWEAK_API_KEY:-YOUR_APPTWEAK_API_KEY}"
SERVER_KEY='apptweak api'

if [ "$API_KEY" = "YOUR_APPTWEAK_API_KEY" ]; then
  echo "Set APPTWEAK_API_KEY before running this script."
  echo "Example: APPTWEAK_API_KEY=your-key $0"
  exit 1
fi

NEW_SERVER_JSON=$(node -e "
  const spec = require('$REPO_ROOT/shared/spec/mcp-server.json');
  const server = structuredClone(spec.mcpServers['apptweak api']);
  server.env.APPTWEAK_API_KEY = process.argv[1];
  process.stdout.write(JSON.stringify(server));
" "$API_KEY")

case "$SCOPE" in
  user|local)
    CONFIG_PATH="${CLAUDE_MCP_CONFIG:-$HOME/.claude.json}"
    mkdir -p "$(dirname "$CONFIG_PATH")"
    if [ -f "$CONFIG_PATH" ]; then
      cp "$CONFIG_PATH" "$CONFIG_PATH.backup.$(date +%s)"
    fi
    node -e "
      const fs = require('fs');
      const target = process.argv[1];
      const serverKey = process.argv[2];
      const newServer = JSON.parse(process.argv[3]);
      let config = {};
      if (fs.existsSync(target)) {
        try { config = JSON.parse(fs.readFileSync(target, 'utf8')); } catch { config = {}; }
      }
      if (!config.mcpServers) config.mcpServers = {};
      config.mcpServers[serverKey] = newServer;
      fs.writeFileSync(target, JSON.stringify(config, null, 2) + '\n');
    " "$CONFIG_PATH" "$SERVER_KEY" "$NEW_SERVER_JSON"
  ;;
  project)
    CONFIG_PATH="${CLAUDE_PROJECT_MCP_CONFIG:-.mcp.json}"
    node -e "
      const fs = require('fs');
      const target = process.argv[1];
      const serverKey = process.argv[2];
      const newServer = JSON.parse(process.argv[3]);
      let config = { mcpServers: {} };
      if (fs.existsSync(target)) {
        try { config = JSON.parse(fs.readFileSync(target, 'utf8')); } catch { config = { mcpServers: {} }; }
      }
      if (!config.mcpServers) config.mcpServers = {};
      config.mcpServers[serverKey] = newServer;
      fs.writeFileSync(target, JSON.stringify(config, null, 2) + '\n');
    " "$CONFIG_PATH" "$SERVER_KEY" "$NEW_SERVER_JSON"
  ;;
  *)
    echo "Unknown scope: $SCOPE (use user, local, or project)"
    exit 1
  ;;
esac

echo "AppTweak MCP configured at: $CONFIG_PATH (scope: $SCOPE)"
echo "Restart Claude Code to load the new MCP server."
