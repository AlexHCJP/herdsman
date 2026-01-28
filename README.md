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
| `-v, --verbose` | Show additional command output |
| `-i, --init` | Initialize git hooks directory structure |
| `-A, --active` | Activate herdsman added git hooks |
| `-a, --add` | Add git hooks |
| `-d, --delete` | Delete git hooks |
| `--version` | Print the tool version |

## 🎯 Commands

### Initialize Git Hooks

Initialize the `.herdsman/githooks` directory and configure Git to use it:

```bash
dart run herdsman --init
```

With verbose output:

```bash
dart run herdsman --init -verbose
```

**What it does:**
- 📁 Creates `.herdsman/githooks` directory
- 🔄 Copies existing Git hooks from `.git/hooks`
- ⚙️ Configures Git to use `.herdsman/githooks` as hooks path
- ❌ Validates that you're in a Git repository

### Add Git Hooks

Add Git hooks:

```bash
dart run herdsman --add <hook-name>
```

Example:

```bash
dart run herdsman --add pre-commit pre-merge
```

**What it does:**
- 🔨 Creates git hook files
- ✍️ Writes shebang and error handling
- 📄 Creates the hook file
- ⚠️ Skips if hook already exists
- ✅ Activates the hook

### Activate Git Hooks

Activate all existing Git hooks in the herdsman directory:

```bash
dart run herdsman --active
```

**What it does:**
- ⚙️ Configures Git hooks path
- ✅ Makes all hook files executable
- 🎉 Confirms when all hooks are activated

### Delete Git Hooks

Delete specific Git hooks:

```bash
dart run herdsman --delete <hook-name>
```

Example:

```bash
dart run herdsman --delete pre-commit pre-push
```


**What it does:**
- 🗑️ Converts active hooks to `.sample` files
- 📄 Preserves hook content for later use
- 🔒 Prevents the hook from executing

## 📂 Directory Structure

After initialization, your repository will have:

```
.herdsman/
└── githooks/
    ├── pre-commit        # Active hook
    ├── pre-push   
    ├── commit-msg.sample # Sample hook (not active)
    └── ... (other hooks)
```

## 💡 Examples

### Complete Setup Workflow

1. **Initialize herdsman:**
   ```bash
   dart run herdsman --init
   ```

2. **Add a pre-commit hook:**
   ```bash
   dart run herdsman --add pre-commit
   ```

3. **Activate all hooks:**
   ```bash
   dart run herdsman --active
   ```
