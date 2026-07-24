# AppTweak MCP for Codex

Connect Codex to the AppTweak API documentation and execution tools via MCP.

This plugin also includes the `apptweak-dashboard-builder` skill for building dashboards that pair live AppTweak data with other sources.

## Prerequisites

- An [AppTweak API key](../../docs/get-api-key.md)

## Option A — Install the official plugin (recommended)

1. Install the plugin from Codex Marketplace: [codex-marketplace.com](https://www.codex-marketplace.com/).
2. In AppTweak (`app.apptweak.com`), copy the MCP setup curl command and run it in your terminal.
3. Restart Codex.

Plugin package: `plugins/codex`

Marketplace file: `.agents/plugins/marketplace.json`

## Option B — CLI setup

```bash
codex mcp add apptweak-api --url https://developers.apptweak.com/mcp
```

## Option C — Run AppTweak curl setup

1. Go to AppTweak (`app.apptweak.com`) MCP setup.
2. Copy the generated curl command.
3. Paste and run it in your terminal.

## Option D — Manual TOML

Add to `~/.codex/config.toml`:

```toml
[mcp_servers.apptweak-api]
url = "https://developers.apptweak.com/mcp"
http_headers = { "X-Apptweak-Key" = "YOUR_APPTWEAK_API_KEY" }
```

For project-scoped config, use `.codex/config.toml` in a **trusted** project.

You can also skip curl and manually set `http_headers["X-Apptweak-Key"]` to your API key.

## Verify setup

Restart Codex and verify `apptweak-api` appears via `codex mcp list` or `/plugins`.

## Restart Codex

Restart Codex after changing MCP configuration. Verify with `codex mcp list` or `/plugins`.

## Troubleshooting

See [troubleshooting.md](../../docs/troubleshooting.md).
