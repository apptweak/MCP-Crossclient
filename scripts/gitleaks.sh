#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

platform_binary() {
  case "$(uname -s)-$(uname -m)" in
    Linux-x86_64) echo "$ROOT/node_modules/@nogoo9/gitleaks-linux-x64/bin/gitleaks" ;;
    Linux-aarch64 | Linux-arm64) echo "$ROOT/node_modules/@nogoo9/gitleaks-linux-arm64/bin/gitleaks" ;;
    Linux-armv7l | Linux-armv6l) echo "$ROOT/node_modules/@nogoo9/gitleaks-linux-arm/bin/gitleaks" ;;
    Darwin-x86_64) echo "$ROOT/node_modules/@nogoo9/gitleaks-darwin-x64/bin/gitleaks" ;;
    Darwin-arm64) echo "$ROOT/node_modules/@nogoo9/gitleaks-darwin-arm64/bin/gitleaks" ;;
    MINGW*-x86_64 | MSYS*-x86_64 | CYGWIN*-x86_64)
      echo "$ROOT/node_modules/@nogoo9/gitleaks-windows-x64/bin/gitleaks.exe"
      ;;
    MINGW*-aarch64 | MSYS*-aarch64 | CYGWIN*-aarch64)
      echo "$ROOT/node_modules/@nogoo9/gitleaks-windows-arm64/bin/gitleaks.exe"
      ;;
    *) return 1 ;;
  esac
}

if bin="$(platform_binary 2>/dev/null)" && [ -x "$bin" ]; then
  exec "$bin" "$@"
fi

if [ -x "$ROOT/node_modules/.bin/gitleaks" ] && command -v node >/dev/null 2>&1; then
  exec node "$ROOT/node_modules/@nogoo9/gitleaks/src/index.js" "$@"
fi

if command -v gitleaks >/dev/null 2>&1; then
  exec gitleaks "$@"
fi

echo "error: gitleaks not found. Run: npm install" >&2
exit 1
