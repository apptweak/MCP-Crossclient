# Get your AppTweak API key

AppTweak MCP integrations use **Bring Your Own Key (BYOK)** authentication. Each user supplies their own API key.

## Steps

1. Sign in to [AppTweak](https://www.apptweak.com).
2. Open the **API** section in the Rails tool.
3. Copy your API key (`api_token`) from the dashboard header.
4. Use this key as `APPTWEAK_API_KEY` in your MCP client configuration.

## Security

- Your API key is **per-user** and tied to your AppTweak account.
- Never share your key or commit it to version control.
- If your key is exposed, regenerate it from the API dashboard and update your MCP config.

## Next steps

- [Cursor setup](cursor.md)
- [Claude Code setup](claude-code.md)
- [Codex setup](codex.md)
