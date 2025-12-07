#!/usr/bin/env bash

# Qwen Tools Setup Script
# This script manages the installation of Qwen enhancement tools
# across different configurations

set -e  # Exit on any error

# Load modular components
source "$(dirname "${BASH_SOURCE[0]}")/lib/config.sh"
source "$(dirname "${BASH_SOURCE[0]}")/lib/utils.sh"
source "$(dirname "${BASH_SOURCE[0]}")/lib/installer.sh"
source "$(dirname "${BASH_SOURCE[0]}")/lib/registry.sh"

install_commands() {
    print_header
    print_status "Installing Qwen enhancement commands..."
    echo

    ensure_global_commands_dir

    # Process all commands from the registry
    while IFS='|' read -r command_name template_file; do
        local template_path
        template_path=$(get_template_path "$template_file")
        install_command "$template_path" "$command_name"
    done < <(get_commands)

    echo
    print_success "Command installation complete!"
    echo
    print_status "You can now use the following commands:"
    while IFS='|' read -r command_name template_file; do
        local template_path
        template_path=$(get_template_path "$template_file")
        if [[ -f "$template_path" ]]; then
            # Extract description from template file
            local description=$(grep -m 1 '^description\s*=' "$template_path" | sed -E 's/.*=\s*"(.*)"/\1/' | sed -E 's/.*=\s*''(.*)''/\1/')
            echo "  /${command_name} - $description"
        fi
    done < <(get_commands)
    echo
    print_status "The primary command for managing the qwen-tools project is /add"
}

uninstall_commands() {
    print_header
    print_status "Uninstalling Qwen enhancement commands..."
    echo

    # Remove all commands from the registry
    while IFS='|' read -r command_name _; do
        uninstall_command "$command_name"
    done < <(get_commands)

    # Remove commands directory if empty
    if [[ -d "$GLOBAL_COMMANDS_DIR" ]] && [[ -z "$(ls -A "$GLOBAL_COMMANDS_DIR")" ]]; then
        rmdir "$GLOBAL_COMMANDS_DIR"
        print_status "Removed empty global commands directory"
    fi

    echo
    print_success "Command removal complete!"
}

# Main execution
case "${1:-help}" in
    "install")
        install_commands
        ;;
    "uninstall")
        uninstall_commands
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo
        show_help
        exit 1
        ;;
esac