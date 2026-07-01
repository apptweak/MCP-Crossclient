# Contributing

This repository contains official AppTweak MCP integration assets. It is currently private during development.

## What to change here

- Plugin packages under `plugins/`
- Client setup scripts under `clients/`
- Shared spec and examples under `shared/`
- ReadMe doc sources under `docs/readme/`

## What not to commit

- Real API keys (`APPTWEAK_API_KEY`)
- Customer-specific data
- Local `.env` files

## Validation before PR

- Manually verify setup for the client(s) you changed.
- Confirm the MCP server appears as `apptweak api` after restart.

## Support boundaries

- Users manage their own API keys in the AppTweak API dashboard.
- Do not ask users to share full API keys in issues or PRs.
