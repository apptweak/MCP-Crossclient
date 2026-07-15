# Contributing

This repository contains official AppTweak MCP integration assets.

## What to change here

- Plugin packages under `plugins/`
- Shared spec and examples under `shared/`
- Documentation sources under `docs/readme/`

## What not to commit

- Real API keys (`APPTWEAK_API_KEY`)
- Customer-specific data
- Local `.env` files

## Local hooks

This repo uses [Lefthook](https://github.com/evilmartians/lefthook) to run [gitleaks](https://github.com/gitleaks/gitleaks) on every commit (scans staged changes for leaked API keys and other secrets).

Install dependencies and enable hooks:

```bash
npm install
```

This installs gitleaks locally via npm — no separate CLI install needed.

Run manually:

```bash
npm run secrets          # scan full git history in this repo
npm run secrets:staged   # scan staged changes only (same as the pre-commit hook)
lefthook run pre-commit  # run the pre-commit hook group without committing
```

## Validation before PR

- Manually verify setup for the client(s) you changed.
- Confirm the MCP server appears as `apptweak-api` after restart.
- Confirm runtime config uses native HTTPS (`url = https://developers.apptweak.com/mcp`), not `npx mcp-remote`.

## Support boundaries

- Users manage their own API keys in the AppTweak API dashboard.
- Do not ask users to share full API keys in issues or PRs.
