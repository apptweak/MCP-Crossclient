[![Listed on ClaudePluginHub](https://www.claudepluginhub.com/badge/apptweak-apptweak-api-plugins-claude-code)](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code?ref=badge)

# AppTweak MCP for Claude Code

Connect Claude Code to the AppTweak API documentation and execution tools via MCP.

This plugin also includes the `apptweak-dashboard-builder` skill for building dashboards that pair live AppTweak data with other sources.

## Prerequisites

- An [AppTweak API key](../../docs/get-api-key.md)

## Option A — Install the official plugin (recommended)

1. Install the plugin from Claude Plugin Hub: [claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code).
2. In AppTweak (`app.apptweak.com`), copy the MCP setup curl command and run it in your terminal.
3. Enable the plugin if it ships with `defaultEnabled: false`, then restart Claude Code.

Plugin package: `plugins/claude-code`

For local testing, point Claude Code at the plugin folder or use `claude mcp add` with the shared config.

## Option B — CLI setup

```bash
claude mcp add-json apptweak-api '{"type":"http","url":"https://developers.apptweak.com/mcp","headers":{"X-Apptweak-Key":"YOUR_APPTWEAK_API_KEY"}}'
```

## Option C — Run AppTweak curl setup

1. Go to AppTweak (`app.apptweak.com`) MCP setup.
2. Copy the generated curl command.
3. Paste and run it in your terminal.

## Option D — Manual JSON

### User scope (`~/.claude.json`)

```json
{
  "mcpServers": {
    "apptweak-api": {
      "type": "http",
      "url": "https://developers.apptweak.com/mcp",
      "headers": {
        "X-Apptweak-Key": "YOUR_APPTWEAK_API_KEY"
      }
    }
  }
}
```

### Project scope (`.mcp.json` at repo root)

Use the same `mcpServers` block. Project-scoped servers require one-time approval — run `/mcp` to approve.

You can also skip curl and manually set `headers["X-Apptweak-Key"]` to your API key.

## Verify setup

Start a new Claude Code session and run `/mcp` to confirm `apptweak-api` is connected.

## Restart Claude Code

Start a new Claude Code session after changing MCP configuration. Run `/mcp` to verify the server is connected.

## Troubleshooting

See [troubleshooting.md](../../docs/troubleshooting.md).
