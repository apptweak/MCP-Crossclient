# AppTweak MCP for Codex

Connect Codex to the AppTweak API documentation and execution tools via MCP.

This plugin also includes the `apptweak-dashboard-builder` skill for building dashboards that pair live AppTweak data with other sources.

## Prerequisites

- An AppTweak account

## Option A — Install the official plugin (recommended)

1. Install the plugin from Codex Marketplace: [codex-marketplace.com](https://www.codex-marketplace.com/).
2. Select **Authenticate** for `apptweak-api`, or run `codex mcp login apptweak-api`.
3. Sign in to AppTweak in the browser and approve access.
4. Start a new Codex session.

Plugin package: `plugins/codex`

Marketplace file: `.agents/plugins/marketplace.json`

## Option B — CLI setup

```bash
codex mcp add apptweak-api --url https://app.apptweak.com/api/mcp
codex mcp login apptweak-api
```

## Option C — Manual TOML

Add to `~/.codex/config.toml`:

```toml
[mcp_servers.apptweak-api]
url = "https://app.apptweak.com/api/mcp"
auth = "oauth"
```

For project-scoped config, use `.codex/config.toml` in a **trusted** project.

After saving the configuration, run `codex mcp login apptweak-api` to authenticate.

## Verify setup

Start a new Codex session and verify `apptweak-api` is authenticated via `codex mcp list`, `/mcp`, or `/plugins`.

## Restart Codex

If authorization expires, run `codex mcp logout apptweak-api` followed by `codex mcp login apptweak-api`.

## Troubleshooting

See [troubleshooting.md](../../docs/troubleshooting.md).
