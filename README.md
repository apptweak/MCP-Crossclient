# MCP-Crossclient

Official AppTweak MCP integrations for Cursor, Claude Code, and Codex.

This repo packages cross-client plugin assets and setup tooling. **Hosted ReadMe is the canonical documentation source** — this README is a thin quickstart with links.

## Quickstart (2 minutes)

1. **Get your API key** from the AppTweak API dashboard (Rails tool → API section).
2. **Pick your client** and run the setup script or install the plugin.
3. **Restart** your AI tool.
4. **Confirm** the `apptweak api` MCP server appears in your client.

```bash
# Example: Cursor on Linux/macOS
APPTWEAK_API_KEY=your-key ./clients/cursor/setup-apptweak-mcp.sh
```

## Documentation (ReadMe)

| Topic | Source in this repo | Hosted ReadMe |
|-------|---------------------|---------------|
| Get API key | [docs/readme/get-api-key.md](docs/readme/get-api-key.md) | https://developers.apptweak.com/reference/mcp-1 |
| Cursor | [docs/readme/cursor.md](docs/readme/cursor.md) | (publish from repo) |
| Claude Code | [docs/readme/claude-code.md](docs/readme/claude-code.md) | (publish from repo) |
| Codex | [docs/readme/codex.md](docs/readme/codex.md) | (publish from repo) |
| Troubleshooting | [docs/readme/troubleshooting.md](docs/readme/troubleshooting.md) | (publish from repo) |

## Repository layout

```
plugins/          Official plugin packages (Cursor, Claude Code, Codex)
clients/          Manual setup scripts and config examples
shared/spec/      Canonical MCP server config
docs/readme/      ReadMe doc sources (canonical content)
```

## Plugin packages

| Client | Plugin path | Marketplace |
|--------|-------------|-------------|
| Cursor | `plugins/cursor` | `.cursor-plugin/marketplace.json` |
| Claude Code | `plugins/claude-code` | Claude plugin marketplace (when published) |
| Codex | `plugins/codex` | `.agents/plugins/marketplace.json` |

## Auth model

- **BYOK v1**: per-user `APPTWEAK_API_KEY` from the AppTweak API dashboard.
- Sent as HTTP header `X-Apptweak-Key` via `npx mcp-remote`.
- Canonical config lives in `shared/spec/mcp-server.json`.

## Support

- Troubleshooting: [docs/readme/troubleshooting.md](docs/readme/troubleshooting.md)
- Issues: GitHub Issues on this repository

## Visibility

This repo starts **private** during development. It can be made public later for marketplace applications.
