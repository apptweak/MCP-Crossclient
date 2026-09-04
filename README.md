[![Listed on ClaudePluginHub](https://www.claudepluginhub.com/badge/apptweak-apptweak-api-plugins-claude-code)](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code?ref=badge)

# AppTweak MCP

Official AppTweak MCP integrations for Cursor, Claude Code, and Codex.

Install this and your AI coding assistant can query **AppTweak** — the app store intelligence and App Store Optimization (ASO) platform — directly from your editor: keyword rankings and search volume, app metadata and category rankings, download and revenue estimates, ratings and reviews, and competitive intelligence across the **Apple App Store** and **Google Play**. Ask your agent a question in plain language and it pulls live data from the AppTweak API, then helps you turn it into dashboards, reports, and analyses.

This repository packages the plugins and configuration examples for each supported client. It uses the [Model Context Protocol (MCP)](https://modelcontextprotocol.io), an open standard for connecting AI assistants to external tools and data.

## Quickstart (2 minutes)

1. **Install the AppTweak plugin** for your client:
   - Cursor: [cursor.directory/plugins/apptweak-mcp-plugins](https://cursor.directory/plugins/apptweak-mcp-plugins)
   - Claude Code: [claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code](https://www.claudepluginhub.com/plugins/apptweak-apptweak-api-plugins-claude-code)
   - Codex: [codex-marketplace.com](https://www.codex-marketplace.com/)
2. **Authenticate** when your client prompts you, then sign in to AppTweak and approve access.
3. **Confirm** the `apptweak-api` MCP server is connected in your client.

No API key, custom header, or setup script is required. See [OAuth authentication](docs/authentication.md) for client-specific sign-in commands.

## Documentation

| Topic | Guide |
|-------|-------|
| OAuth authentication | [docs/authentication.md](docs/authentication.md) |
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

- The MCP endpoint uses OAuth 2.1 and each user authorizes their own AppTweak account.
- Plugin configuration contains only the HTTPS endpoint; it does not contain API keys, static authorization headers, or setup scripts.
- The MCP client stores the OAuth credentials and sends the access token to AppTweak.
- Canonical config lives in `shared/spec/mcp-server.json`.

## Support

- Troubleshooting: [docs/troubleshooting.md](docs/troubleshooting.md)
- Issues: GitHub Issues on this repository

## License

Released under the [GNU General Public License v3.0](LICENSE).
