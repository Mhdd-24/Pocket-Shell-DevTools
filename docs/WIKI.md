# Pocket Shell DevTools — WIKI

## Architecture

```
PowerShell profile
  → pocket-shell-devtools.ps1   (loader, load guard)
  → pocket-shell-devtools/<section>/*.ps1   (one concern per file)
  → pocket-shell-devtools.local.ps1   (optional, gitignored)
```

## Configuration

| Source | Purpose |
|--------|---------|
| `config/paths.ps1` | `$CODE_HOME`, `$PsDefaultBranch` |
| `config/repo-map.ps1` | Git/repo aliases for `f` / `b` and `<alias> gplm` |
| `pocket-shell-devtools.local.ps1` | Machine-specific overrides |
| `POCKET_SHELL_*` env vars | Code home, default branch, author name/email |
| `config/author.ps1` | Resolves banner author from local → env → `git config` |

## Adding a command

1. Add `pocket-shell-devtools/<section>/my-cmd.ps1`.
2. Append the path to `$script:PocketShellDevToolsModules` in `pocket-shell-devtools.ps1` (keep dependency order).
3. `reload`.

## Coexistence with Workspace DevTools

Do **not** load both loaders in one profile — shortcut names overlap (`gpl`, `reload`, etc.). Use Workspace DevTools on the work machine and Pocket Shell on a personal laptop.

## Section guides

Detailed behavior for each section will be documented here as we define your personal shortcuts.
