#!/usr/bin/env bash

# Utility module for qwen-tools
# Contains common utility functions

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}Qwen Enhancement Tools Setup${NC}"
    echo -e "${BLUE}================================${NC}"
    echo
}

print_status() {
    echo -e "${BLUE}Status:${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

ensure_global_commands_dir() {
    mkdir -p "$GLOBAL_COMMANDS_DIR"
    print_success "Ensured global commands directory exists: $GLOBAL_COMMANDS_DIR"
}

show_help() {
    echo "Qwen Enhancement Tools Setup Script"
    echo
    echo "Usage: $0 [command]"
    echo
    echo "Commands:"
    echo "  install      - Install Qwen enhancement commands"
    echo "  uninstall    - Remove Qwen enhancement commands"
    echo "  help         - Show this help message"
    echo
    echo "Examples:"
    echo "  $0 install                  # Install Qwen enhancement commands"
    echo "  $0 uninstall                # Remove Qwen enhancement commands"
    echo "  $0 help                     # Show this help message"
    echo
}