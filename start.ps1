[CmdletBinding()]
param(
  [ValidateSet('menu', 'kb', 'nl', 'fl', 'nl-claude', 'fl-claude', 'help')]
  [string]$Session = 'menu',

  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$CliArgs
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RootDir = Split-Path -Parent $PSCommandPath
$DataDir = Join-Path $RootDir 'data'
$env:DATA_DIR = $DataDir
$env:KB_MANAGER_DIR = Join-Path $RootDir 'kb-manager'

function Find-Uv {
  $command = Get-Command uv -ErrorAction SilentlyContinue
  if ($command) {
    return $command.Source
  }

  $packageRoot = Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Packages'
  if (Test-Path $packageRoot) {
    $uv = Get-ChildItem -Path $packageRoot -Filter 'uv.exe' -Recurse -ErrorAction SilentlyContinue |
      Select-Object -First 1 -ExpandProperty FullName
    if ($uv) {
      return $uv
    }
  }

  throw 'uv is not installed. Run setup.cmd once, then start.cmd again.'
}

function Find-Codex {
  $command = Get-Command codex -ErrorAction SilentlyContinue
  if ($command) {
    return $command.Source
  }

  # The Codex IDE extension bundles a CLI executable, but its versioned
  # extension directory is normally not included in a standalone PowerShell's
  # PATH. Prefer a normal CLI installation, then use that bundled executable.
  $extensionsRoot = Join-Path $env:USERPROFILE '.vscode\extensions'
  if (Test-Path $extensionsRoot) {
    $codex = Get-ChildItem -Path $extensionsRoot -Filter 'codex.exe' -Recurse -ErrorAction SilentlyContinue |
      Sort-Object LastWriteTime -Descending |
      Select-Object -First 1 -ExpandProperty FullName
    if ($codex) {
      return $codex
    }
  }

  return $null
}

function Require-Command([string]$Name) {
  $command = Get-Command $Name -ErrorAction SilentlyContinue
  if (-not $command) {
    throw "Required command not found: $Name"
  }
  return $command.Source
}

function Ensure-DataLayout {
  foreach ($relativePath in @(
      'data', 'data\inbox', 'data\raw_sources', 'data\lean',
      'data\logs', 'data\wiki', 'data\workspace')) {
    $path = Join-Path $RootDir $relativePath
    if (-not (Test-Path $path)) {
      New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
  }

  foreach ($relativePath in @(
      'data\download_queue.md', 'data\sources_manifest.md',
      'data\wiki\index.md', 'data\wiki\log.md')) {
    $path = Join-Path $RootDir $relativePath
    if (-not (Test-Path $path)) {
      New-Item -ItemType File -Path $path -Force | Out-Null
    }
  }
}

function Ensure-Environment {
  $script:UvExe = Find-Uv
  try {
    & $script:UvExe python find 3.14 | Out-Null
  }
  catch {
    throw 'Python 3.14 is not available to uv. Run setup.cmd once, then start.cmd again.'
  }

  # This is a no-op when uv.lock and .venv already match.  It makes every
  # launch reproducible after a dependency or lock-file update.
  & $script:UvExe sync --all-packages --python 3.14 --locked
  if ($LASTEXITCODE -ne 0) {
    throw 'uv failed to synchronize the project environment.'
  }
}

function Launch-Codex([string]$AgentDirectory, [bool]$AllData) {
  $codex = Find-Codex
  if (-not $codex) {
    throw 'Codex CLI was not found. Install/sign in to Codex, then run start.cmd again.'
  }
  Write-Host "Starting Codex in $AgentDirectory" -ForegroundColor Cyan

  if ($AllData) {
    & $codex -C $AgentDirectory --add-dir $DataDir @CliArgs
  }
  else {
    & $codex -C $AgentDirectory `
      --add-dir (Join-Path $DataDir 'workspace') `
      --add-dir (Join-Path $DataDir 'inbox') `
      @CliArgs
  }
}

function Launch-Claude([string]$AgentDirectory) {
  $claude = Require-Command 'claude'
  Write-Host "Starting Claude Code in $AgentDirectory" -ForegroundColor Cyan
  Push-Location $AgentDirectory
  try {
    & $claude --add-dir (Join-Path $DataDir 'workspace') `
      --add-dir (Join-Path $DataDir 'inbox') `
      @CliArgs
  }
  finally {
    Pop-Location
  }
}

function Show-Help {
  Write-Host ''
  Write-Host 'Windows launcher usage:' -ForegroundColor Cyan
  Write-Host '  start.cmd                  # show the session menu'
  Write-Host '  .\start.ps1 -Session nl    # start NL-Prover via Codex'
  Write-Host "  .\start.ps1 -Session fl -CliArgs '--search'"
  Write-Host ''
  Write-Host 'External LLM checks need your own API key in nl-prover\.env or fl-prover\.env.'
  Write-Host 'FL-Prover uses the Lean toolchain selected by its target Lean project.'
  Write-Host ''
}

function Invoke-Session([string]$Choice) {
  switch ($Choice) {
    'kb'        { Launch-Codex (Join-Path $RootDir 'kb-manager') $true; break }
    'nl'        { Launch-Codex (Join-Path $RootDir 'nl-prover') $false; break }
    'fl'        { Launch-Codex (Join-Path $RootDir 'fl-prover') $false; break }
    'nl-claude' { Launch-Claude (Join-Path $RootDir 'nl-prover'); break }
    'fl-claude' { Launch-Claude (Join-Path $RootDir 'fl-prover'); break }
    default     { throw "Unknown session: $Choice" }
  }
}

Ensure-DataLayout
Ensure-Environment

if ($Session -eq 'help') {
  Show-Help
  exit 0
}

if ($Session -ne 'menu') {
  Invoke-Session $Session
  exit $LASTEXITCODE
}

Write-Host ''
Write-Host 'MMAT launcher' -ForegroundColor Cyan
Write-Host "DATA_DIR=$DataDir"
Write-Host ''
Write-Host '  1) KB-Manager via Codex'
Write-Host '  2) NL-Prover via Codex'
Write-Host '  3) FL-Prover via Codex'
Write-Host '  4) NL-Prover via Claude Code'
Write-Host '  5) FL-Prover via Claude Code'
Write-Host '  6) Help'
Write-Host '  Other) Exit'
Write-Host ''

switch (Read-Host 'Enter choice [1-6]') {
  '1' { Invoke-Session 'kb' }
  '2' { Invoke-Session 'nl' }
  '3' { Invoke-Session 'fl' }
  '4' { Invoke-Session 'nl-claude' }
  '5' { Invoke-Session 'fl-claude' }
  '6' { Show-Help }
  default { Write-Host 'Exiting without starting a session.' }
}
