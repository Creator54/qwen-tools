# Getting Started with qwen-tools

Welcome to the self-manageable qwen-tools project! This system allows you to manage all aspects of the project using Qwen itself.

## Installation

First, install the tools:

```bash
cd ~/qwen-tools
bash setup.sh install
```

After installation, you'll have access to comprehensive management commands.

## Primary Management Command

The main command for managing the project is:

```
/add
```

This single command handles any request related to managing the qwen-tools project, including:
- Adding new templates
- Updating documentation 
- Modifying the setup script
- Maintaining project consistency

## Other Management Commands

For more specific tasks, you can also use:

- `/main-management` - Comprehensive project management (alternative to /add)
- `/add-template` - Add new templates with automatic integration
- `/update-readme` - Update project documentation
- `/update-setup` - Modify the setup script functionality
- `/manage-project` - High-level project management
- `/create-command:local` - Create project-specific commands
- `/create-command:global` - Create commands for all projects

## How It Works

The system is designed for one-shot comprehensive management:

1. When you use `/add` with a request (e.g., "add a command that summarizes git status"), Qwen will:
   - Create the template file in the appropriate subdirectory of `~/qwen-tools/templates/`
   - Update `commands.json` registry with the new command information
   - Update `setup.sh` with installation/uninstallation code
   - Update `README.md` with documentation
   - Ensure all references are consistent

2. All changes are made in a single execution to maintain project integrity

3. The project remains fully functional after each change

## Architecture

The project follows a modular architecture:
- `lib/` contains modular components for configuration, installation, registry management, and utilities
- `templates/` is organized into subdirectories by function (management, creation, utility)
- `commands.json` serves as a centralized registry of all available commands
- The main `setup.sh` orchestrates the modular components

## Quick Start

Try this to see the system in action:

1. Open Qwen in the qwen-tools directory
2. Run `/add add a command that shows current git status`
3. The system will create the command template, integrate it with setup.sh, and document it in README.md

## Best Practices

- Use `/add` for most management tasks (this is the primary command)
- Your requests can be high-level (e.g., "add a command for reviewing code changes")
- The system will ask for details as needed
- All project components stay synchronized automatically

The qwen-tools project is now completely self-manageable!