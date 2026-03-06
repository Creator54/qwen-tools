# qwen-tools

A collection of self-managing utilities and templates to enhance the functionality of Qwen Code CLI and other LLM interfaces.

## Usage

**Quick Setup (Remote):**
```bash
curl -fsSL https://raw.githubusercontent.com/Creator54/qwen-tools/main/setup.sh | bash -s -- install
```

**Local Repository:**
```bash
# If you cloned qwen-tools locally
bash setup.sh install
bash setup.sh uninstall
```

## Available Commands

Once installed, the following commands become available globally across your AI agent interfaces:

| Command | Description |
|---|---|
| `/add` | **(Primary)** Add new functionality or commands to the `qwen-tools` project. |
| `/main-management` | Comprehensive management (add templates, update docs, modify setup). |
| `/add-template` | Barebones command to add a new template with automatic integration. |
| `/update-readme` | Update this documentation with new features or changes. |
| `/update-setup` | Modify the installation script with new functionality. |
| `/manage-project` | High-level project management and consistency checking. |
| `/create-command-local` | Interactive tool to create project-specific commands. |
| `/create-command-global`| Interactive tool to create global commands for all projects. |

## Creating Custom Commands

`qwen-tools` custom commands are written in Markdown and stored in the `templates/` directory.

### Basic Structure

```markdown
---
description: "A short description shown in /help"
---
Process user input: {{args}}

Results from shell command: !{ls -la}
File content injection: @{path/to/file.txt}
```

### Self-Management

This project is fully self-managing. If you want to add a new command, simply use `/add` from within this project. The system will automatically:
1. Create the template in `templates/`
2. Register the command in `commands.json`
3. Update `setup.sh` to install it
4. Rebuild the README if needed

## License

This project is licensed under the [MIT License](LICENSE).