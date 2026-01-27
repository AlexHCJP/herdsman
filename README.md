# 🐑 Herdsman

A Dart command-line tool for managing Git hooks in your repository. Herdsman simplifies the process of initializing, applying, and activating Git hooks by organizing them in a dedicated `.herdsman/githooks` directory.

## 📋 Features

- 📁 Initialize Git hooks directory structure
- 🔨 Apply custom Git hooks from samples
- ✅ Activate and make hooks executable
- 🎯 Verbose mode for detailed operation logs
- 🔄 Easy hook management and organization

## 🚀 Installation

Add herdsman to your project:

```yaml
dev_dependencies:
  herdsman: version
```

or command

```shell
dart pub add herdsman
```

## 📖 Usage

```bash
dart run herdsman [flags] [arguments]
```

### Available Flags

| Flag | Description |
|------|-------------|
| `-h, --help` | Print usage information |
| `-v, --verbose` | Show additional command output with emoji indicators |
| `-i, --init` | Initialize git hooks directory structure |
| `-c, --active` | Activate herdsman git hooks |
| `-a, --apply` | Apply git hooks from samples |
| `--version` | Print the tool version |

## 🎯 Commands

### Initialize Git Hooks

Initialize the `.herdsman/githooks` directory and configure Git to use it:

```bash
dart run herdsman -i
```

With verbose output:

```bash
dart run herdsman -i -v
```

**What it does:**
- 📁 Creates `.herdsman/githooks` directory
- 🔄 Copies existing Git hooks from `.git/hooks`
- ⚙️ Configures Git to use `.herdsman/githooks` as hooks path
- ❌ Validates that you're in a Git repository

### Apply Git Hooks

Apply Git hooks from sample files:

```bash
dart run herdsman -a <hook-name>
```

Example:

```bash
dart run herdsman -a pre-commit pre-merge
```

With verbose output:

```bash
dart run herdsman -a pre-commit -v
```

**What it does:**
- 🔨 Creates git hook from `.sample` file
- ✍️ Writes shebang and error handling
- 📄 Creates the hook file
- 🗑️ Removes the sample file
- ⚠️ Skips if hook already exists
- ✅ Active hook

### Activate applies Git Hooks

Activate all existing Git hooks in the herdsman directory:

```bash
dart run herdsman -c
```

With verbose output:

```bash
dart run herdsman -c -v
```

**What it does:**
- ⚙️ Configures Git hooks path
- ✅ Makes all hook files executable
- 🎉 Confirms when all hooks are activated

## 📂 Directory Structure

After initialization, your repository will have:

```
.herdsman/
└── githooks/
    ├── pre-commit
    ├── pre-push
    ├── commit-msg
    └── ... (other hooks)
```

## 💡 Examples

### Complete Setup Workflow

1. **Initialize herdsman:**
   ```bash
   dart run herdsman -i -v
   ```

2. **Apply a pre-commit hook:**
   ```bash
   dart run herdsman -a pre-commit -v
   ```

3. **Activate all hooks:**
   ```bash
   dart run herdsman -c -v
   ```

### Quick Setup

Initialize and activate in one go:

```bash
dart run herdsman -i
```
