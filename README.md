# agent-tools

A collection of self-managing utilities and templates to enhance the functionality of Agent CLIs and other LLM interfaces.

## Usage

**Quick Setup (Remote):**
```bash
curl -fsSL https://raw.githubusercontent.com/Creator54/agent-tools/main/setup.sh | bash -s -- --all install
```

**Local Repository:**
```bash
# If you cloned agent-tools locally
bash setup.sh install                   # Installs for Qwen (default)
bash setup.sh --claude install          # Installs for Claude Code
bash setup.sh --all install             # Installs for all supported tools
bash setup.sh uninstall                 # Uninstalls from Qwen
```

**Supported AI Agents:**

| Flag | Agent | Config Path |
|------|-------|-------------|
| `--qwen` (default) | Qwen Code | `~/.qwen/commands` |
| `--claude` | Claude Code | `~/.claude/commands` |
| `--gemini` | Gemini Code | `~/.gemini/commands` |
| `--opencode` | OpenCode | `~/.config/opencode/commands` |
| `--aider` | Aider | `~/.aider/commands` |
| `--all` | All above | — |

## Available Commands

Once installed, the following commands become available globally across your AI agent interfaces:

| Command | Description |
|---|---|
| `/add` | **(Primary)** Add new functionality or commands to the `agent-tools` project. |
| `/main-management` | Comprehensive management (add templates, update docs, modify setup). |
| `/add-template` | Barebones command to add a new template with automatic integration. |
| `/update-readme` | Update this documentation with new features or changes. |
| `/update-setup` | Modify the installation script with new functionality. |
| `/manage-project` | High-level project management and consistency checking. |
| `/create-command-local` | Interactive tool to create project-specific commands. |
| `/create-command-global`| Interactive tool to create global commands for all projects. |

## Creating Custom Commands

`agent-tools` custom commands are written in Markdown and stored in the `templates/` directory.

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