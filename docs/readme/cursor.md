# AppTweak MCP for Cursor

Connect Cursor to the AppTweak API documentation and execution tools via MCP.

## Prerequisites

- Node.js 18+ with `npx`
- An [AppTweak API key](get-api-key.md)

## Option A — Install the official plugin (recommended)

1. Add this repository as a Cursor plugin marketplace source.
2. Install the **AppTweak API** plugin from the marketplace.
3. When prompted, enter your API key as `APPTWEAK_API_KEY`.

Plugin package: `plugins/cursor`

## Option B — Manual setup

### Linux / macOS

```bash
APPTWEAK_API_KEY=your-key ./clients/cursor/setup-apptweak-mcp.sh
```

### Windows (PowerShell)

```powershell
$env:APPTWEAK_API_KEY = "your-key"
.\clients\cursor\setup-apptweak-mcp.ps1
```

### Manual JSON

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "apptweak api": {
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

## Verify setup

Restart Cursor and confirm `apptweak api` appears in MCP settings.

## Restart Cursor

Restart Cursor after changing MCP configuration. The server appears as **apptweak api** in MCP settings.

## Troubleshooting

See [troubleshooting.md](troubleshooting.md).
