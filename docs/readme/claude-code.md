# AppTweak MCP for Claude Code

Connect Claude Code to the AppTweak API documentation and execution tools via MCP.

## Prerequisites

- Node.js 18+ with `npx`
- An [AppTweak API key](get-api-key.md)

## Option A — Install the official plugin (recommended)

1. Install the **AppTweak API** plugin from the Claude Code plugin marketplace (when published).
2. When prompted, enter your API key as `APPTWEAK_API_KEY`.
3. Enable the plugin if it ships with `defaultEnabled: false`.

Plugin package: `plugins/claude-code`

For local testing, point Claude Code at the plugin folder or use `claude mcp add` with the shared config.

## Option B — CLI setup

```bash
claude mcp add --scope user apptweak-api \
  --env APPTWEAK_API_KEY=your-key \
  -- npx -y mcp-remote https://developers.apptweak.com/mcp \
  --header "X-Apptweak-Key: ${APPTWEAK_API_KEY}"
```

## Option C — Setup script

```bash
# User scope (~/.claude.json)
APPTWEAK_API_KEY=your-key ./clients/claude-code/setup-apptweak-mcp.sh

# Project scope (.mcp.json in repo root)
CLAUDE_MCP_SCOPE=project APPTWEAK_API_KEY=your-key ./clients/claude-code/setup-apptweak-mcp.sh
```

## Option D — Manual JSON

### User scope (`~/.claude.json`)

```json
{
  "mcpServers": {
    "apptweak-api": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-remote",
        "https://developers.apptweak.com/mcp",
        "--header",
        "X-Apptweak-Key: ${APPTWEAK_API_KEY}"
      ],
      "env": {
        "APPTWEAK_API_KEY": "YOUR_APPTWEAK_API_KEY"
      }
    }
  }
}
```

### Project scope (`.mcp.json` at repo root)

Use the same `mcpServers` block. Project-scoped servers require one-time approval — run `/mcp` to approve.

## Verify setup

Start a new Claude Code session and run `/mcp` to confirm `apptweak-api` is connected.

## Restart Claude Code

Start a new Claude Code session after changing MCP configuration. Run `/mcp` to verify the server is connected.

## Troubleshooting

See [troubleshooting.md](troubleshooting.md).
