# Connect your AppTweak account

AppTweak MCP integrations use OAuth 2.1. The plugin configures the OAuth-protected MCP endpoint, and your MCP client opens the AppTweak sign-in and consent flow. You do not need an API key or a setup script.

## Sign in

1. Install the AppTweak plugin or add `https://app.apptweak.com/api/mcp` as an HTTP MCP server.
2. Start authentication from your client:
   - **Cursor:** open MCP settings and authenticate `apptweak-api`.
   - **Claude Code:** run `/mcp` and authenticate `apptweak-api`, or run `claude mcp login apptweak-api`.
   - **Codex:** select **Authenticate** for `apptweak-api`, or run `codex mcp login apptweak-api`.
3. Sign in to AppTweak in the browser and approve access.
4. Return to your client and confirm that `apptweak-api` is connected.

## Security

- Do not put API keys, access tokens, refresh tokens, or authorization headers in MCP configuration.
- Let the MCP client store and refresh OAuth credentials.
- If a login is stale or was authorized for the wrong account, disconnect or log out in the client and authenticate again.

## Next steps

- [Cursor setup](../plugins/cursor/README.md)
- [Claude Code setup](../plugins/claude-code/README.md)
- [Codex setup](../plugins/codex/README.md)
