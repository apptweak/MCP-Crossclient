# AppTweak MCP troubleshooting

Common issues when setting up AppTweak MCP across Cursor, Claude Code, and Codex.

## Error reference

| Symptom | Fix |
|---------|-----|
| Authentication is required | Start the OAuth flow from the client's MCP settings. For Claude Code or Codex, run the client-specific `mcp login apptweak-api` command. |
| The browser does not open | Retry authentication from the client and check that local browser callbacks are not blocked by a firewall or browser setting. |
| Login succeeds but the server still returns HTTP 401 | Log out or disconnect `apptweak-api`, then authenticate again. Remove any old API-key headers from manual MCP configuration. |
| HTTP 403 or permission denied | Re-authenticate with the intended AppTweak account. Verify that the account can access the requested AppTweak product or data. |
| HTTP 429 or requests are throttled | Wait and retry. Reduce MCP tool call frequency. |
| The client cannot reach the MCP server | Check internet and endpoint `https://app.apptweak.com/api/mcp`. Verify firewalls/proxies allow HTTPS to this host. |

## Client-specific issues

### Cursor

- **Invalid server name**: Cursor requires MCP server names to match `^[a-zA-Z0-9_-]+$`. Use `apptweak-api`, not `apptweak api`.
- **Authentication action missing**: Remove legacy `headers` from the AppTweak MCP entry, restart Cursor, and open MCP settings again.
- **Server not appearing**: Restart Cursor after editing `~/.cursor/mcp.json`.
- **Wrong config path on Windows**: Use `%USERPROFILE%\.cursor\mcp.json`.

### Claude Code

- **Server in settings.json ignored**: MCP config must be in `~/.claude.json` or `.mcp.json`, not `settings.json`.
- **Project server not loading**: Approve via `/mcp`. Ensure `.mcp.json` is at repo root, not inside `.claude/`.
- **Plugin MCP not starting**: Run `claude plugin validate` or `/plugin validate`.
- **Authentication is stale**: Run `claude mcp logout apptweak-api`, then `claude mcp login apptweak-api`.

### Codex

- **Project config ignored**: Project must be trusted. Untrusted projects skip `.codex/config.toml`.
- **Plugin not in directory**: Run `codex plugin marketplace list` to verify marketplace is loaded. Restart Codex.
- **TOML syntax error**: Ensure the server section header is `[mcp_servers.apptweak-api]`.
- **Authentication is stale**: Run `codex mcp logout apptweak-api`, then `codex mcp login apptweak-api`.
- **OAuth disabled in TOML**: Set `auth = "oauth"` and remove legacy `http_headers` from the AppTweak MCP entry.

## Quick verification

- Restart your client after config changes.
- Confirm the server name appears as `apptweak-api`.
- Confirm the AppTweak MCP URL is `https://app.apptweak.com/api/mcp`.
- Confirm the client reports that the server is authenticated.
- Confirm the server entry does not contain API keys or static authorization headers.

## Security reminders

- Never paste OAuth access tokens, refresh tokens, or authorization codes in support tickets or chat logs.
- Do not add tokens or authorization headers to MCP configuration.
- Disconnect the AppTweak integration if you authorized the wrong account or suspect that a session was exposed.

## Support boundary

- OAuth sessions are managed through the MCP client and AppTweak account authorization flow.
- AppTweak support can help with account, consent, or plan issues.
- For MCP client bugs, check the client-specific docs above first.
