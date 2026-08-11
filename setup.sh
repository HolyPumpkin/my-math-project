#!/usr/bin/env bash
# =============================================================================
# MMAT Project Setup Script (Linux / macOS)
# =============================================================================
# Installs all dependencies needed to run the MechMath Agent Team project.
# Safe to run multiple times — it skips steps that are already complete.
#
# Usage:
#   ./setup.sh              # full setup (Python + Lean)
#   ./setup.sh --skip-lean  # skip Lean/elan installation
#   ./setup.sh --help       # show help
# =============================================================================
set -euo pipefail

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# --- Paths ---
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$ROOT_DIR/data"
KB_MANAGER_DIR="$ROOT_DIR/kb-manager"
SKIP_LEAN=false

# --- Argument parsing ---
while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-lean|-s)
      SKIP_LEAN=true
      shift
      ;;
    --help|-h)
      echo "Usage: ./setup.sh [OPTIONS]"
      echo ""
      echo "Install all dependencies for the MMAT research project."
      echo ""
      echo "Options:"
      echo "  --skip-lean, -s    Skip Lean/elan installation"
      echo "  --help, -h         Show this help and exit"
      echo ""
      echo "What this script does:"
      echo "  1. Creates the shared data/ directory layout"
      echo "  2. Installs uv (Python package manager) if missing"
      echo "  3. Installs Python 3.14 via uv if missing"
      echo "  4. Synchronizes locked Python dependencies (uv sync)"
      echo "  5. Creates nl-prover/.env and fl-prover/.env from templates"
      echo "  6. Optionally installs Lean 4 and the elan toolchain manager"
      echo "  7. Verifies the Python environment"
      echo "  8. Checks for optional tools (Codex CLI, Claude Code)"
      echo ""
      echo "After setup, edit the .env files to add your API keys, then run:"
      echo "  ./start.sh"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: ./setup.sh [--skip-lean] [--help]"
      exit 1
      ;;
  esac
done

# --- Helper functions ---
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

die() {
  echo -e "${RED}ERROR: $*${NC}" >&2
  exit 1
}

info() {
  echo -e "${CYAN}→ $*${NC}"
}

success() {
  echo -e "${GREEN}✓ $*${NC}"
}

warn() {
  echo -e "${YELLOW}⚠ WARNING: $*${NC}" >&2
}

# --- Ensure data directory layout ---
ensure_data_layout() {
  info "Ensuring data directory layout..."

  mkdir -p \
    "$DATA_DIR/inbox" \
    "$DATA_DIR/raw_sources" \
    "$DATA_DIR/lean" \
    "$DATA_DIR/logs" \
    "$DATA_DIR/wiki" \
    "$DATA_DIR/workspace" \
    "$DATA_DIR/tmp"

  touch \
    "$DATA_DIR/download_queue.md" \
    "$DATA_DIR/sources_manifest.md" \
    "$DATA_DIR/wiki/index.md" \
    "$DATA_DIR/wiki/log.md"

  success "Data directory layout ready."
}

# --- Find or install uv ---
find_uv_binary() {
  if command_exists uv; then
    command -v uv
    return 0
  fi

  # The uv installer places the binary in these locations by default.
  for candidate in "$HOME/.local/bin/uv" "$HOME/.cargo/bin/uv"; do
    if [[ -x "$candidate" ]]; then
      echo "$candidate"
      return 0
    fi
  done

  return 1
}

ensure_uv() {
  local uv_bin
  uv_bin="$(find_uv_binary)" || true

  if [[ -n "$uv_bin" ]]; then
    # Ensure the directory is on PATH for this session.
    local uv_dir
    uv_dir="$(dirname "$uv_bin")"
    if [[ ":$PATH:" != *":$uv_dir:"* ]]; then
      export PATH="$uv_dir:$PATH"
    fi
    success "uv found at: $uv_bin"
    echo "$uv_bin"
    return 0
  fi

  info "Installing uv..."

  if command_exists curl; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
  elif command_exists wget; then
    wget -qO- https://astral.sh/uv/install.sh | sh
  else
    die "Neither curl nor wget is available. Please install one of them and re-run this script."
  fi

  # After install, locate the binary.
  uv_bin="$(find_uv_binary)" || die "uv was installed but could not be located. Restart your shell and run ./setup.sh again."

  local uv_dir
  uv_dir="$(dirname "$uv_bin")"
  export PATH="$uv_dir:$PATH"

  success "uv installed at: $uv_bin"
  echo "$uv_bin"
}

# --- Ensure Python 3.14 ---
ensure_python() {
  local uv_bin="$1"

  info "Checking for Python 3.14..."

  if "$uv_bin" python find 3.14 >/dev/null 2>&1; then
    success "Python 3.14 is available."
    return 0
  fi

  info "Installing Python 3.14 via uv..."
  "$uv_bin" python install 3.14 || die "Failed to install Python 3.14 via uv."

  # Verify the installation.
  if ! "$uv_bin" python find 3.14 >/dev/null 2>&1; then
    die "Python 3.14 installation could not be verified. Check 'uv python list' output."
  fi

  success "Python 3.14 installed."
}

# --- Sync dependencies ---
sync_dependencies() {
  local uv_bin="$1"

  info "Synchronizing Python dependencies (this may take a moment on first run)..."
  "$uv_bin" sync --all-packages --python 3.14 --locked || die "uv sync failed. Check the output above for details."
  success "Python dependencies synchronized."
}

# --- Create .env files ---
write_env_files() {
  info "Setting up local configuration..."

  # nl-prover/.env
  local nl_env="$ROOT_DIR/nl-prover/.env"
  if [[ ! -f "$nl_env" ]]; then
    cat > "$nl_env" << EOF
# Generated by setup.sh. Add API keys below only when you use external checks.
KB_MANAGER_DIR=$KB_MANAGER_DIR
DATA_DIR=$DATA_DIR

# ANTHROPIC_API_KEY=
# GEMINI_API_KEY=
# OPENAI_API_KEY=
# OPENROUTER_API_KEY=
EOF
    success "Created nl-prover/.env"
  else
    info "nl-prover/.env already exists, skipping."
  fi

  # fl-prover/.env
  local fl_env="$ROOT_DIR/fl-prover/.env"
  if [[ ! -f "$fl_env" ]]; then
    cat > "$fl_env" << EOF
# Generated by setup.sh. Add API keys below only when you use external checks.
KB_MANAGER_DIR=$KB_MANAGER_DIR
DATA_DIR=$DATA_DIR

# ANTHROPIC_API_KEY=
# GEMINI_API_KEY=
# OPENAI_API_KEY=
# OPENROUTER_API_KEY=

# Lean-specific search backends
# LEANDEX_API_KEY=

# Lean toolchain — only needed when elan does not live in ~/.elan
# LEAN_ELAN_HOME=
EOF
    success "Created fl-prover/.env"
  else
    info "fl-prover/.env already exists, skipping."
  fi
}

# --- Install Lean / elan ---
ensure_lean() {
  if [[ "$SKIP_LEAN" == true ]]; then
    info "Skipping Lean/elan installation (--skip-lean)."
    return 0
  fi

  local elan_bin="$HOME/.elan/bin/elan"

  if [[ -x "$elan_bin" ]]; then
    success "Lean/elan found at: $elan_bin"

    # Ensure the stable toolchain is installed even when elan already exists
    # (a prior partial install may have left the toolchain missing).
    "$elan_bin" toolchain install stable 2>/dev/null || true
    "$elan_bin" default stable 2>/dev/null || true
    return 0
  fi

  info "Installing Lean/elan..."

  if command_exists curl; then
    curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --default-toolchain stable
  elif command_exists wget; then
    wget -qO- https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --default-toolchain stable
  else
    die "Neither curl nor wget is available."
  fi

  # elan-init adds ~/.elan/bin to PATH via shell profile; add it for this
  # session so the subsequent verification steps work.
  export PATH="$HOME/.elan/bin:$PATH"

  if [[ ! -x "$HOME/.elan/bin/elan" ]]; then
    warn "elan installer completed but ~/.elan/bin/elan was not found. Check your installation."
    return 0
  fi

  success "Lean/elan installed."

  "$HOME/.elan/bin/elan" toolchain install stable 2>/dev/null || true
  "$HOME/.elan/bin/elan" default stable 2>/dev/null || true

  # Verify that lake (Lean's build tool) is functional.
  local lake_output
  if lake_output="$("$HOME/.elan/bin/elan" run stable lake --version 2>&1)"; then
    success "Lean toolchain verified (lake $lake_output)."
  else
    warn "Lean toolchain may not be fully set up. Run 'elan run stable lake --version' to diagnose."
  fi
}

# --- Verify Python environment ---
verify_environment() {
  local uv_bin="$1"

  info "Verifying Python environment..."

  local check_output
  check_output="$("$uv_bin" run python -c "import sys, sympy; print(f'Python {sys.version.split()[0]}; SymPy {sympy.__version__}')" 2>&1)" \
    || die "The synchronized Python environment did not pass its import check. Output: $check_output"

  success "Python environment verified ($check_output)."
}

# --- Check optional tools ---
check_optional_tools() {
  echo ""
  info "Checking optional agent-harness tools..."

  local missing=()

  if command_exists codex; then
    success "Codex CLI: found ($(command -v codex))"
  else
    warn "Codex CLI not found. Install it to run Codex sessions."
    missing+=("Codex CLI")
  fi

  if command_exists claude; then
    if claude --version >/dev/null 2>&1; then
      success "Claude Code: found ($(command -v claude))"
    else
      warn "Claude Code is present but may not be runnable. Check your installation."
      missing+=("Claude Code (broken)")
    fi
  else
    warn "Claude Code not found. Install it to run Claude Code sessions."
    missing+=("Claude Code")
  fi

  if [[ ${#missing[@]} -gt 0 ]]; then
    echo ""
    warn "Missing optional tools: ${missing[*]}"
    info "The Python environment and deterministic tools are ready. You can install the missing tools later and use ./start.sh to launch sessions."
  fi
}

# =============================================================================
# Main
# =============================================================================

echo ""
echo "═══════════════════════════════════════════"
echo "  MMAT Project Setup"
echo "═══════════════════════════════════════════"
echo ""
echo "Root directory: $ROOT_DIR"
echo "Data directory: $DATA_DIR"
echo ""

# 1. Data layout
ensure_data_layout

# 2. uv
UV_BIN="$(ensure_uv)"

# 3. Python 3.14
ensure_python "$UV_BIN"

# 4. Python dependencies
sync_dependencies "$UV_BIN"

# 5. Local configuration (.env files)
write_env_files

# 6. Lean / elan
ensure_lean

# 7. Environment verification
verify_environment "$UV_BIN"

# 8. Optional tools
check_optional_tools

# --- Done ---
echo ""
echo "═══════════════════════════════════════════"
echo -e "${GREEN}  Setup complete!${NC}"
echo "═══════════════════════════════════════════"
echo ""
echo "Next steps:"
echo "  1. Add your API keys to nl-prover/.env and fl-prover/.env"
echo "     (required only when using external LLM checks)"
echo "  2. Run: ./start.sh"
echo ""
