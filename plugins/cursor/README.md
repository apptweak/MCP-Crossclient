# AppTweak MCP for Cursor

Connect Cursor to the AppTweak API documentation and execution tools via MCP.

## Prerequisites

- An [AppTweak API key](../../docs/get-api-key.md)

## Option A — Install the official plugin (recommended)

1. Install the plugin from Cursor Directory: [cursor.directory/plugins/apptweak-mcp-plugins](https://cursor.directory/plugins/apptweak-mcp-plugins).
2. In AppTweak (`app.apptweak.com`), copy the MCP setup curl command and run it in your terminal.
3. Restart Cursor.

Plugin package: `plugins/cursor`

## Option B — Run AppTweak curl setup

1. Go to AppTweak (`app.apptweak.com`) MCP setup.
2. Copy the generated curl command.
3. Paste and run it in your terminal.

### Manual JSON

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "apptweak-api": {
      "url": "https://developers.apptweak.com/mcp",
      "headers": {
        "X-Apptweak-Key": "YOUR_APPTWEAK_API_KEY"
      }
    }
  }
}
```

You can also skip curl and manually set `headers["X-Apptweak-Key"]` to your API key.

## Verify setup

Restart Cursor and confirm `apptweak-api` appears in MCP settings.

## Restart Cursor

Restart Cursor after changing MCP configuration. The server appears as **apptweak-api** in MCP settings.

## Troubleshooting

See [troubleshooting.md](../../docs/troubleshooting.md).
