# nvim 配置（LazyVim）— 網絡安全工作流版

基於 [LazyVim](https://github.com/LazyVim/LazyVim) 的個人配置，針對**網絡安全／滲透測試／代碼審計**工作流優化。

## 快速安裝（換機用）

```bash
# 1. 備份舊配置
mv ~/.config/nvim ~/.config/nvim.bak

# 2. 克隆本倉庫
git clone <repo-url> ~/.config/nvim

# 3. 首次啟動（自動安裝插件）
nvim
```

## 系統依賴

```bash
sudo pacman -S --noconfirm tmux ripgrep fd lazygit
rustup component add rust-analyzer
go install golang.org/x/tools/gopls@latest
go install github.com/lighttiger2505/sqls@latest
```

## 網絡安全相關功能

| 功能 | 快捷鍵 | 說明 |
|---|---|---|
| **敏感模式搜索** | `<leader>st` | grep API key/token/secret 模式（grug-far） |
| **Semgrep 掃描** | `<leader>ss` | 開終端跑 `semgrep --config=auto` |
| **Base64 編碼** | 選中 + `<leader>ub` | 結果複製剪貼簿 |
| **Base64 解碼** | 選中 + `<leader>ud` | 結果複製剪貼簿 |
| **Hex 編碼** | 選中 + `<leader>ux` | 結果複製剪貼簿 |
| **Hex 解碼** | 選中 + `<leader>uxd` | 結果複製剪貼簿 |
| **Hex 視圖** | `:Hex` | 二進制 payload 查看 |
| **HTTP 請求** | `:Kulala` | .http 檔案直接發 request |
| **書籤** | `<leader>ha` / `<leader>hh` / `<leader>h1-4` | 快速跳轉關鍵檔案 |
| **Rust 測試** | neotest | `<leader>tt` 等 |
| **大檔案模式** | 自動 | >5MB 關語法高亮避免卡頓 |
| **tmux 導航** | Ctrl+hjkl | nvim/tmux 無縫切換 |

## 已配置語言棧

Rust（rust-analyzer）· TypeScript/JS（ts_ls）· Go（gopls）· C/C++（clangd）· SQL（sqls）· Python（pyright）· Lua（lua_ls）

## 安全 lint 整合（security.lua）

- Go: golangci-lint
- C/C++: cppcheck + flawfinder
- Shell: shellcheck
- SQL: sqlfluff
- Dockerfile: hadolint
- Python: ruff
- YAML: yamllint
