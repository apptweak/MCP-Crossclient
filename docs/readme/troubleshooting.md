# AppTweak MCP troubleshooting

Common issues when setting up AppTweak MCP across Cursor, Claude Code, and Codex.

## Error reference

| Code | Symptom | Fix |
|------|---------|-----|
| `missing_key` | MCP server fails immediately, no tools available | Set `APPTWEAK_API_KEY` in your client config. See [get-api-key.md](get-api-key.md). |
| `invalid_key` | HTTP 401, "unauthorized", or auth rejected | Re-copy your key from the AppTweak API dashboard. Check for extra spaces. Update config after key rotation. |
| `forbidden_scope` | HTTP 403, permission denied | Verify your plan includes API access. Confirm the key belongs to the correct account. |
| `rate_limited` | HTTP 429, requests throttled | Wait and retry. Reduce MCP tool call frequency. |
| `connection_failed` | Cannot reach MCP server | Check internet. Verify Node.js/npx installed. Confirm endpoint: `https://developers.apptweak.com/mcp` |
| `node_missing` | `npx: command not found` | Install Node.js LTS from https://nodejs.org |

## Client-specific issues

### Cursor

- **Invalid server name**: Cursor requires MCP server names to match `^[a-zA-Z0-9_-]+$`. Use `apptweak-api`, not `apptweak api`.
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

## Quick verification

- Restart your client after config changes.
- Confirm the server name appears as `apptweak-api`.
- If needed, remove and re-add the MCP server with your current `APPTWEAK_API_KEY`.

## Security reminders

- Never paste your full API key in support tickets or chat logs.
- Redact keys when sharing config: show only first 4 and last 4 characters.
- Regenerate your key from the AppTweak API dashboard if exposed.

## Support boundary

- API keys are managed by the user in the AppTweak API dashboard.
- AppTweak support can help with account/plan issues but cannot recover lost keys.
- For MCP client bugs, check the client-specific docs above first.
