![Frame](screenshots/contributors.png)

# 🐑 Herdsman

<div align="center">
  <a href="https://pub.dev/packages/herdsman">
    <img src="https://img.shields.io/pub/v/herdsman?label=Pub&logo=dart" alt="Pub Package" />
  </a>
  <a href="https://pub.dev/packages/herdsman">
    <img src="https://img.shields.io/pub/likes/herdsman?style=flat&logo=dart&label=Likes" alt="Pub Likes" />
  </a>
  <a href="https://pub.dev/packages/herdsman/score">
    <img src="https://img.shields.io/pub/points/herdsman?label=Score&logo=dart" alt="Pub Score" />
  </a>
  <a href="https://pub.dev/packages/herdsman">
    <img src="https://img.shields.io/pub/dm/herdsman?style=flat&color=blue&logo=dart&label=Downloads" alt="Pub Monthly Downloads" />
  </a>
  <a href="https://github.com/AlexHCJP/herdsman">
    <img src="https://img.shields.io/github/stars/AlexHCJP/herdsman?style=flat&logo=github&colorB=deeppink&label=Stars" alt="Star on Github" />
  </a>
  <a href="https://github.com/AlexHCJP/herdsman">
    <img src="https://img.shields.io/github/forks/AlexHCJP/herdsman?color=orange&label=Forks&logo=github" alt="Forks on Github" />
  </a>
  <a href="https://github.com/AlexHCJP/herdsman/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/AlexHCJP/herdsman?style=flat&logo=github&colorB=yellow&label=Contributors" alt="Contributors" />
  </a>
  <a href="https://github.com/AlexHCJP/herdsman/issues">
    <img src="https://img.shields.io/github/issues/AlexHCJP/herdsman?label=Issues&logo=github&color=purple" alt="Issues" />
  </a>
  <a href="https://github.com/AlexHCJP/herdsman">
    <img src="https://img.shields.io/github/languages/code-size/AlexHCJP/herdsman?logo=github&color=blue&label=Size" alt="Code size" />
  </a>
  <a href="https://github.com/AlexHCJP/herdsman/blob/HEAD/LICENSE">
    <img src="https://img.shields.io/github/license/AlexHCJP/herdsman?label=License&color=red&logo=Leanpub" alt="License" />
  </a>
  <a href="https://pub.dev/packages/herdsman">
    <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20macOS%20%7C%20Windows%20%7C%20Linux-blue.svg?logo=flutter" alt="Platform" />
  </a>
</div>

A Dart command-line tool for managing Git hooks in your repository. Herdsman simplifies the process of initializing, applying, and activating Git hooks by organizing them in a dedicated `.herdsman/githooks` directory.

## 📋 Features

- 📁 Initialize Git hooks directory structure
- 🔨 Apply custom Git hooks from samples
- ✅ Activate and make hooks executable
- 🎯 Verbose mode for detailed operation logs
- 🔄 Easy hook management and organization

## 🚀 Installation

### In a project (as dev dependency)

```shell
dart pub add -d herdsman
```

Or manually in `pubspec.yaml`:

```yaml
dev_dependencies:
  herdsman: ^1.0.2
```

### Globally

```shell
dart pub global activate herdsman
```

Then run as:

```shell
herdsman [flags] [arguments]
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
