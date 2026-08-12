-- LazyVim 預設見：https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- 關閉 LazyVim 自動安裝 LSP（改由 lsp-override.lua 手動管理）
vim.g.lazyvim_lsp_install = false

-- 編輯體驗
vim.opt.scrolloff = 8        -- 游標距上下邊界至少 8 行
vim.opt.sidescrolloff = 8    -- 水平同理
vim.opt.cursorline = true    -- 高亮當前行

-- 縮排
vim.opt.expandtab = true     -- Tab → 空格
vim.opt.shiftwidth = 2       -- 縮排 2 空格
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- 搜尋
vim.opt.ignorecase = true    -- 搜尋忽略大小寫
vim.opt.smartcase = true     -- 有大寫時自動區分
vim.opt.hlsearch = false     -- 不持續高亮搜尋結果

-- 持久化
vim.opt.undofile = true      -- 跨會話復原
vim.opt.swapfile = false     -- 不用 swapfile（有 undofile 足矣）

-- 系統剪貼簿
vim.opt.clipboard = "unnamedplus"

-- UI
vim.opt.number = true        -- 行號
vim.opt.relativenumber = true -- 相對行號
vim.opt.signcolumn = "yes"   -- 常駐標記列（避免 LSP 診斷抖動）
vim.opt.termguicolors = true
vim.opt.showmode = false     -- LazyVim 已用 statusline 顯示模式
