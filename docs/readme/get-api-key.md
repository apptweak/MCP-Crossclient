# Get your AppTweak API key

AppTweak MCP integrations use **Bring Your Own Key (BYOK)** authentication. Each user supplies their own API key.

## Steps

1. Sign in to your [AppTweak](https://www.apptweak.com) account.
2. Open the **API** section of your account.
3. Copy your personal API key (`api_token`).
4. Use this key with the MCP setup curl command copied from `app.apptweak.com`.

If you prefer, you can manually set the same key directly in your client config headers.

If you don't see an API section or aren't sure your plan includes API access, contact your AppTweak account manager or [AppTweak support](https://www.apptweak.com).

## Security

- Your API key is **per-user** and tied to your AppTweak account.
- Never share your key or commit it to version control.
- If your key is exposed, regenerate it from the API dashboard and update your MCP config.

## Next steps

- [Cursor setup](cursor.md)
- [Claude Code setup](../../plugins/claude-code/README.md)
- [Codex setup](codex.md)
