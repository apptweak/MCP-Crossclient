# AppTweak MCP for Cursor

Connect Cursor to the AppTweak API documentation and execution tools via MCP.

This plugin also includes the `apptweak-dashboard-builder` skill for building dashboards that pair live AppTweak data with other sources.

## Prerequisites

- An AppTweak account

## Option A — Install the official plugin (recommended)

1. Install the plugin from Cursor Directory: [cursor.directory/plugins/apptweak-mcp-plugins](https://cursor.directory/plugins/apptweak-mcp-plugins).
2. Open Cursor's MCP settings and authenticate `apptweak-api`.
3. Sign in to AppTweak in the browser and approve access.

Plugin package: `plugins/cursor`

## Option B — Manual JSON

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "apptweak-api": {
      "url": "https://app.apptweak.com/api/mcp"
    }
  }
}
```

After saving the configuration, open Cursor's MCP settings and authenticate `apptweak-api`.

## Verify setup

Confirm `apptweak-api` appears as connected and authenticated in MCP settings.

## Restart Cursor

Restart Cursor if it does not reload the MCP configuration automatically.

## Troubleshooting

See [troubleshooting.md](../../docs/troubleshooting.md).
