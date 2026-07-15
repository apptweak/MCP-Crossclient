[![Listed on ClaudePluginHub](https://www.claudepluginhub.com/badge/apptweak-apptweak-api-plugins-claude-code)](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code?ref=badge)

# AppTweak MCP

Official AppTweak MCP integrations for Cursor, Claude Code, and Codex.

Install this and your AI coding assistant can query **AppTweak** — the app store intelligence and App Store Optimization (ASO) platform — directly from your editor: keyword rankings and search volume, app metadata and category rankings, download and revenue estimates, ratings and reviews, and competitive intelligence across the **Apple App Store** and **Google Play**. Ask your agent a question in plain language and it pulls live data from the AppTweak API, then helps you turn it into dashboards, reports, and extraction scripts.

This repository packages the plugins and configuration examples for each supported client. It uses the [Model Context Protocol (MCP)](https://modelcontextprotocol.io), an open standard for connecting AI assistants to external tools and data.

## Quickstart (2 minutes)

1. **Get your API key** from your AppTweak account — see [Get your API key](docs/get-api-key.md).
2. **Install the AppTweak plugin** for your client:
   - Cursor: [cursor.directory/plugins/apptweak-mcp-plugins](https://cursor.directory/plugins/apptweak-mcp-plugins)
   - Claude Code: [claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code)
   - Codex: [codex-marketplace.com](https://www.codex-marketplace.com/)
3. **From AppTweak (`app.apptweak.com`) copy and run the curl setup command** to patch only `X-Apptweak-Key` in the existing AppTweak MCP entry.
4. **Restart** your AI tool.
5. **Confirm** the `apptweak-api` MCP server appears in your client.

If you prefer, skip the script and manually add your API key in client config (`headers["X-Apptweak-Key"]` / `http_headers["X-Apptweak-Key"]`).

## Documentation

| Topic | Guide |
|-------|-------|
| Get your API key | [docs/get-api-key.md](docs/get-api-key.md) |
| Cursor | [plugins/cursor/README.md](plugins/cursor/README.md) |
| Claude Code | [plugins/claude-code/README.md](plugins/claude-code/README.md) |
| Codex | [plugins/codex/README.md](plugins/codex/README.md) |
| Troubleshooting | [docs/troubleshooting.md](docs/troubleshooting.md) |

Full API reference: [developers.apptweak.com](https://developers.apptweak.com).

## Repository layout

```
plugins/          Official plugin packages (Cursor, Claude Code, Codex)
clients/          Manual configuration examples
shared/spec/      Canonical MCP server config
docs/             Setup and usage documentation
```

## Plugin packages

| Client | Plugin path | Marketplace |
|--------|-------------|-------------|
| Cursor | `plugins/cursor` | `.cursor-plugin/marketplace.json` |
| Claude Code | `plugins/claude-code` | Claude plugin marketplace |
| Codex | `plugins/codex` | `.agents/plugins/marketplace.json` |

## Authentication

- **Bring Your Own Key (BYOK)**: each user supplies their own `APPTWEAK_API_KEY`.
- Sent as the HTTP header `X-Apptweak-Key` directly over HTTPS.
- Canonical config lives in `shared/spec/mcp-server.json`.

## Support

- Troubleshooting: [docs/troubleshooting.md](docs/troubleshooting.md)
- Issues: GitHub Issues on this repository

## License

Released under the [GNU General Public License v3.0](LICENSE).
