[![Listed on ClaudePluginHub](https://www.claudepluginhub.com/badge/apptweak-apptweak-api-plugins-claude-code)](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code?ref=badge)

# AppTweak MCP for Claude Code

Connect Claude Code to the AppTweak API documentation and execution tools via MCP.

This plugin also includes the `apptweak-dashboard-builder` skill for building dashboards that pair live AppTweak data with other sources.

## Prerequisites

- An AppTweak account

## Option A — Install the official plugin (recommended)

1. Install the plugin from Claude Plugin Hub: [claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code).
2. Start a new Claude Code session and run `/mcp`.
3. Authenticate `apptweak-api`, then sign in to AppTweak and approve access in the browser.

Plugin package: `plugins/claude-code`

For local testing, point Claude Code at the plugin folder or use `claude mcp add` with the shared config.

## Option B — CLI setup

```bash
claude mcp add --transport http --scope user apptweak-api https://app.apptweak.com/api/mcp
claude mcp login apptweak-api
```

## Option C — Manual JSON

### User scope (`~/.claude.json`)

```json
{
  "mcpServers": {
    "apptweak-api": {
      "type": "http",
      "url": "https://app.apptweak.com/api/mcp"
    }
  }
}
```

### Project scope (`.mcp.json` at repo root)

Use the same `mcpServers` block. Project-scoped servers require one-time approval — run `/mcp` to approve.

After approving a project-scoped server, authenticate it from `/mcp` or run `claude mcp login apptweak-api`.

## Verify setup

Start a new Claude Code session and run `/mcp` to confirm `apptweak-api` is connected and authenticated.

## Restart Claude Code

If authorization expires, run `claude mcp logout apptweak-api` followed by `claude mcp login apptweak-api`.

## Troubleshooting

See [troubleshooting.md](../../docs/troubleshooting.md).
