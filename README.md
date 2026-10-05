# Pocket Shell DevTools

Generic **PowerShell terminal shortcuts** for a personal laptop: git, navigation, npm, Node, Angular helpers, utils, commit messages, custom prompt, and startup banner.

Same **repo layout** as [@mhdd_24/sublime-mcp](https://github.com/Mhdd-24/Sublime-MCP) and other MCP packages (README, `docs/WIKI.md`, `scripts/`, ISC license). This project is **not** an MCP server — it dot-sources into your PowerShell profile.

**Full documentation:** [docs/WIKI.md](./docs/WIKI.md)

---

## Install

### npm

```bash
npm install -g @mhdd_24/pocket-shell-devtools
pocket-shell-devtools
```

Copy the printed `. '…\pocket-shell-devtools.ps1'` line into your PowerShell profile, or run `install-profile.ps1` from the package folder.

### Clone

```bash
git clone https://github.com/Mhdd-24/Pocket-Shell-DevTools.git
```

---

## Sections

| Area | Folder | Examples |
|------|--------|----------|
| Terminal shortcuts | `pocket-shell-devtools/shortcuts/` | *(you define)* |
| Commit messages | `commit/` | `f`, `b`, `gencommit` |
| Git shortcuts | `git/` | `gplm`, `gph`, `nb` |
| System navigation | `nav/` | `root`, `home`, `..` |
| npm | `npm/` | `nrs`, `ngi` |
| Node | `node/` | `nodev` |
| Angular | `angular/` | `ngv` |
| Utils | `util/` | `killport`, `codehere` |
| Help / banner / prompt | `help/` | `psh-help`, `banner`, `prompt` |

---

## Quick start

1. Clone this repo anywhere (e.g. `~/Github/Pocket-Shell-DevTools`).
2. Copy `pocket-shell-devtools.local.ps1.example` → `pocket-shell-devtools.local.ps1` and set `$script:RepoMap` / paths if needed.
3. Add to your PowerShell profile:

```powershell
. 'D:\Mohammed-Rafi\Github\Pocket-Shell-DevTools\pocket-shell-devtools.ps1'
```

4. Open a new terminal → brief banner. Run `psh-help`.

Optional env vars:

- `POCKET_SHELL_CODE_HOME` — default clone root (`~/Github` or `~/code`)
- `POCKET_SHELL_DEFAULT_BRANCH` — default trunk for `gcom` / `gplm` (default `main`)

---

## Reload after edits

```powershell
reload
```

---

## License

ISC — see [LICENSE](./LICENSE).
