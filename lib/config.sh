#!/usr/bin/env bash

# Configuration module for agent-tools
# Contains functions and constants related to configuration

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly BOLD='\033[1m'
readonly DIM='\033[2m'
readonly NC='\033[0m' # No Color

# Configuration (PROJECT_ROOT, TEMPLATES_DIR, COMMANDS_REGISTRY are not readonly
# so they can be overridden by setup.sh for remote installs)
: "${PROJECT_ROOT:=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
: "${TEMPLATES_DIR:=$PROJECT_ROOT/templates}"
# Function to dynamically resolve command directories based on target
set_target_paths() {
    local target="${1:-qwen}"
    case "$target" in
        "claude")
            GLOBAL_COMMANDS_DIR="$HOME/.claude/commands"
            PROJECT_COMMANDS_DIR=".claude/commands"
            ;;
        "opencode")
            # Ensure to check XDG_CONFIG_HOME if needed, but going with ~/.config/opencode for now
            GLOBAL_COMMANDS_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/commands"
            PROJECT_COMMANDS_DIR=".opencode/commands"
            ;;
        "gemini")
            GLOBAL_COMMANDS_DIR="$HOME/.gemini/commands"
            PROJECT_COMMANDS_DIR=".gemini/commands"
            ;;
        "aider")
            GLOBAL_COMMANDS_DIR="$HOME/.aider/commands"
            PROJECT_COMMANDS_DIR=".aider/commands"
            ;;
        "qwen"|*)
            GLOBAL_COMMANDS_DIR="$HOME/.qwen/commands"
            PROJECT_COMMANDS_DIR=".qwen/commands"
            ;;
    esac
}

# Set initial default paths variables
set_target_paths "qwen"
: "${COMMANDS_REGISTRY:=$PROJECT_ROOT/commands.json}"

# Settings file paths
readonly QWEN_SETTINGS="$HOME/.qwen/settings.json"

# Function to get configuration value
get_config() {
    local key="$1"
    case "$key" in
        "PROJECT_ROOT") echo "$PROJECT_ROOT" ;;
        "TEMPLATES_DIR") echo "$TEMPLATES_DIR" ;;
        "GLOBAL_COMMANDS_DIR") echo "$GLOBAL_COMMANDS_DIR" ;;
        "PROJECT_COMMANDS_DIR") echo "$PROJECT_COMMANDS_DIR" ;;
        "COMMANDS_REGISTRY") echo "$COMMANDS_REGISTRY" ;;
        "QWEN_SETTINGS") echo "$QWEN_SETTINGS" ;;
        *) echo "" ;;
    esac
}