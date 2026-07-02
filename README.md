# AppTweak MCP

Official AppTweak MCP integrations for Cursor, Claude Code, and Codex.

Install this and your AI coding assistant can query **AppTweak** — the app store intelligence and App Store Optimization (ASO) platform — directly from your editor: keyword rankings and search volume, app metadata and category rankings, download and revenue estimates, ratings and reviews, and competitive intelligence across the **Apple App Store** and **Google Play**. Ask your agent a question in plain language and it pulls live data from the AppTweak API, then helps you turn it into dashboards, reports, and extraction scripts.

This repository packages the plugins and setup tooling for each supported client. It uses the [Model Context Protocol (MCP)](https://modelcontextprotocol.io), an open standard for connecting AI assistants to external tools and data.

## Quickstart (2 minutes)

1. **Get your API key** from your AppTweak account — see [Get your API key](docs/readme/get-api-key.md).
2. **Pick your client** and run the setup script or install the plugin.
3. **Restart** your AI tool.
4. **Confirm** the `apptweak api` MCP server appears in your client.

```bash
# Example: Cursor on Linux/macOS
APPTWEAK_API_KEY=your-key ./clients/cursor/setup-apptweak-mcp.sh
```

## Documentation

| Topic | Guide |
|-------|-------|
| Get your API key | [docs/readme/get-api-key.md](docs/readme/get-api-key.md) |
| Cursor | [docs/readme/cursor.md](docs/readme/cursor.md) |
| Claude Code | [docs/readme/claude-code.md](docs/readme/claude-code.md) |
| Codex | [docs/readme/codex.md](docs/readme/codex.md) |
| Troubleshooting | [docs/readme/troubleshooting.md](docs/readme/troubleshooting.md) |

Full API reference: [developers.apptweak.com](https://developers.apptweak.com).

## Repository layout

```
plugins/          Official plugin packages (Cursor, Claude Code, Codex)
clients/          Manual setup scripts and config examples
shared/spec/      Canonical MCP server config
docs/readme/      Setup and usage documentation
```

## Plugin packages

| Client | Plugin path | Marketplace |
|--------|-------------|-------------|
| Cursor | `plugins/cursor` | `.cursor-plugin/marketplace.json` |
| Claude Code | `plugins/claude-code` | Claude plugin marketplace (when published) |
| Codex | `plugins/codex` | `.agents/plugins/marketplace.json` |

## Authentication

- **Bring Your Own Key (BYOK)**: each user supplies their own `APPTWEAK_API_KEY`.
- Sent as the HTTP header `X-Apptweak-Key` via `npx mcp-remote`.
- Canonical config lives in `shared/spec/mcp-server.json`.

## Support

- Troubleshooting: [docs/readme/troubleshooting.md](docs/readme/troubleshooting.md)
- Issues: GitHub Issues on this repository

## License

Released under the [GNU General Public License v3.0](LICENSE).
