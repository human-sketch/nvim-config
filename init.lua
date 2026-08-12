-- ===== 1. 启动 LazyVim =====
require("config.lazy")

-- ===== 2. 基础外观（一次搞定，不重复） =====
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- 透明背景（只设一次）
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
]])

-- ===== 3. 行号（强制，不被覆盖） =====
-- 先设全局默认
vim.opt.number = true
vim.opt.relativenumber = false

-- 再用 VimEnter 事件强制覆盖（插件加载完成后执行）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = false
  end,
})

-- 为每个新缓冲区也强制（防止局部被改）
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end,
})

-- ===== 4. 其他常用设置 =====
vim.opt.laststatus = 2 -- 始终显示状态栏
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.list = false
vim.opt.listchars = { tab = "→ ", trail = "·", extends = ">", precedes = "<" }
vim.opt.fileencodings = "ucs-bom,utf-8,gbk,big5,latin1"
vim.opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir

-- 语法高亮（LazyVim 默认已开，这行可删，但保留无妨）
vim.cmd("syntax on")

-- Disable Vim built-in SQL omni-completion inoremaps — we use sqls LSP
vim.g.omni_sql_no_default_maps = 1
