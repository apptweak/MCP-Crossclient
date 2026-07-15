# AppTweak MCP troubleshooting

Common issues when setting up AppTweak MCP across Cursor, Claude Code, and Codex.

## Error reference

| Code | Symptom | Fix |
|------|---------|-----|
| `missing_key` | Curl setup exits before update | Provide your API key and rerun the AppTweak-generated command. See [get-api-key.md](get-api-key.md). |
| `missing_entry` | Setup says no AppTweak MCP entry exists | Install the AppTweak plugin (or add an AppTweak HTTPS MCP entry) first, then rerun the AppTweak setup command. |
| `malformed_entry` | Setup found entry but rejected structure | Ensure the entry uses native HTTPS (`url: https://developers.apptweak.com/mcp`) and has object headers/http_headers. |
| `invalid_key` | HTTP 401, "unauthorized", or auth rejected | Re-copy your key from the AppTweak API dashboard. Check for extra spaces. Update config after key rotation. |
| `forbidden_scope` | HTTP 403, permission denied | Verify your plan includes API access. Confirm the key belongs to the correct account. |
| `rate_limited` | HTTP 429, requests throttled | Wait and retry. Reduce MCP tool call frequency. |
| `connection_failed` | Cannot reach MCP server | Check internet and endpoint `https://developers.apptweak.com/mcp`. Verify firewalls/proxies allow HTTPS to this host. |

## Client-specific issues

### Cursor

- **Invalid server name**: Cursor requires MCP server names to match `^[a-zA-Z0-9_-]+$`. Use `apptweak-api`, not `apptweak api`.
- **Marketplace key-name bug (`server`)**: the AppTweak setup flow discovers the AppTweak entry by URL first, so key updates still work even when the key name is wrong.
- **Server not appearing**: Restart Cursor after editing `~/.cursor/mcp.json`.
- **Wrong config path on Windows**: Use `%USERPROFILE%\.cursor\mcp.json`.

### Claude Code

- **Server in settings.json ignored**: MCP config must be in `~/.claude.json` or `.mcp.json`, not `settings.json`.
- **Project server not loading**: Approve via `/mcp`. Ensure `.mcp.json` is at repo root, not inside `.claude/`.
- **Plugin MCP not starting**: Run `claude plugin validate` or `/plugin validate`.

### Codex

- **Project config ignored**: Project must be trusted. Untrusted projects skip `.codex/config.toml`.
- **Plugin not in directory**: Run `codex plugin marketplace list` to verify marketplace is loaded. Restart Codex.
- **TOML syntax error**: Ensure the server section header is `[mcp_servers.apptweak-api]`.
- **Missing headers in TOML**: Ensure `http_headers` is an inline table, for example `http_headers = { "X-Apptweak-Key" = "..." }`.

## Quick verification

- Restart your client after config changes.
- Confirm the server name appears as `apptweak-api`.
- Confirm the AppTweak MCP URL is `https://developers.apptweak.com/mcp`.
- If needed, rerun the AppTweak setup command to re-apply the key.

## Security reminders

- Never paste your full API key in support tickets or chat logs.
- Redact keys when sharing config: show only first 4 and last 4 characters.
- Regenerate your key from the AppTweak API dashboard if exposed.

## Support boundary

- API keys are managed by the user in the AppTweak API dashboard.
- AppTweak support can help with account/plan issues but cannot recover lost keys.
- For MCP client bugs, check the client-specific docs above first.
