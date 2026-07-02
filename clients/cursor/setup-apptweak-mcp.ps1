param(
  [string]$ApiKey = $env:APPTWEAK_API_KEY
)

$ErrorActionPreference = "Stop"
$ConfigPath = if ($env:CURSOR_MCP_CONFIG) { $env:CURSOR_MCP_CONFIG } else { "$env:USERPROFILE\.cursor\mcp.json" }
$ServerKey = "apptweak-api"
$LegacyServerKey = "apptweak api"
$RepoRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

if (-not $ApiKey -or $ApiKey -eq "YOUR_APPTWEAK_API_KEY") {
  Write-Host "Set APPTWEAK_API_KEY before running this script."
  Write-Host "Example: `$env:APPTWEAK_API_KEY='your-key'; .\setup-apptweak-mcp.ps1"
  exit 1
}

$spec = Get-Content "$RepoRoot\shared\spec\mcp-server.json" | ConvertFrom-Json
$newServer = $spec.mcpServers.'apptweak-api' | ConvertTo-Json -Depth 10 | ConvertFrom-Json
$newServer.env.APPTWEAK_API_KEY = $ApiKey

$dir = Split-Path $ConfigPath -Parent
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
if (Test-Path $ConfigPath) { Copy-Item $ConfigPath "$ConfigPath.backup.$(Get-Date -Format 'yyyyMMddHHmmss')" }

$config = @{ mcpServers = @{} }
if (Test-Path $ConfigPath) {
  try { $config = Get-Content $ConfigPath | ConvertFrom-Json } catch { $config = @{ mcpServers = @{} } }
}
if (-not $config.mcpServers) { $config = @{ mcpServers = @{} } }
$config.mcpServers.PSObject.Properties.Remove($LegacyServerKey)
$config.mcpServers | Add-Member -NotePropertyName $ServerKey -NotePropertyValue $newServer -Force
$config | ConvertTo-Json -Depth 10 | Set-Content $ConfigPath

Write-Host "AppTweak MCP configured at: $ConfigPath"
Write-Host "Restart Cursor to load the new MCP server."
