-- ===== 1. 启动 LazyVim（必须保留） =====
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalINC guibg=NONE ctermbg=NONE ")
vim.opt.clipboard = "unnamedplus"
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
]])
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.softtabstop = 6
vim.opt.expandtab = false
-- ===== 网络安全实用配置 =====
-- 保留语法高亮、行号、状态栏等关键元素

-- 基础视觉 (使用深色背景，不强制透明)

-- 显示行号 (绝对行号，方便定位错误行)
vim.opt.number = true
-- 显示相对行号 (可选，与 number 同时使用)
vim.opt.relativenumber = true

-- 状态栏 (显示文件信息、模式等)
vim.opt.laststatus = 2 -- 始终显示状态栏

-- 窗口分隔符使用默认字符 (不改变 fillchars)
-- 如果你想保留垂直分割线明显一点，无需额外设置

-- 保留浮动窗口边框 (不透明)
-- 如果你希望 Telescope 等插件边框可见，不要覆盖相关高亮组

-- 语法高亮 (默认开启，确保未关闭)
vim.cmd("syntax on")

-- 其他实用安全选项
vim.opt.hlsearch = true -- 高亮搜索结果
vim.opt.incsearch = true -- 增量搜索
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true -- 智能大小写 (混合时区分)
vim.opt.wrap = false -- 禁止自动换行 (适合查看长日志)
vim.opt.list = false -- 显示不可见字符 (如 Tab 用 ^I 显示)
vim.opt.listchars = { tab = "→ ", trail = "·", extends = ">", precedes = "<" }

-- 文件编码自动检测 (处理乱码日志)
vim.opt.fileencodings = "ucs-bom,utf-8,gbk,big5,latin1"

-- 保留撤消历史 (防止误删)
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- 如果你还是希望背景透明 (某些终端美化)，取消下一行注释
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.opt.laststatus = 2
