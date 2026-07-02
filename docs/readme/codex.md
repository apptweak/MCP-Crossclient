# AppTweak MCP for Codex

Connect Codex to the AppTweak API documentation and execution tools via MCP.

## Prerequisites

- Node.js 18+ with `npx`
- An [AppTweak API key](get-api-key.md)

## Option A — CLI setup (recommended)

```bash
codex mcp add apptweak-api \
  --env APPTWEAK_API_KEY=your-key \
  -- npx -y mcp-remote https://developers.apptweak.com/mcp \
  --header "X-Apptweak-Key: \${APPTWEAK_API_KEY}"
```

## Option B — Setup script

```bash
# User scope (~/.codex/config.toml)
APPTWEAK_API_KEY=your-key ./clients/codex/setup-apptweak-mcp.sh

# Project scope (.codex/config.toml in trusted project)
CODEX_MCP_SCOPE=project APPTWEAK_API_KEY=your-key ./clients/codex/setup-apptweak-mcp.sh
```

## Option C — Manual TOML

Add to `~/.codex/config.toml`:

```toml
[mcp_servers.apptweak-api]
command = "npx"
args = ["-y", "mcp-remote", "https://developers.apptweak.com/mcp", "--header", "X-Apptweak-Key: ${APPTWEAK_API_KEY}"]
env = { APPTWEAK_API_KEY = "YOUR_APPTWEAK_API_KEY" }
```

For project-scoped config, use `.codex/config.toml` in a **trusted** project.

## Verify setup

Restart Codex and verify `apptweak-api` appears via `codex mcp list` or `/plugins`.

## Restart Codex

Restart Codex after changing MCP configuration. Verify with `codex mcp list` or `/plugins`.

## Troubleshooting

See [troubleshooting.md](troubleshooting.md).
