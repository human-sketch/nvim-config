-- LazyVim 預設鍵位：https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- <leader> = Space

local map = vim.keymap.set

-- 視窗導航（Ctrl + hjkl）
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- 視窗調整大小
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- 移動行
map("n", "<A-j>", "<cmd>move +1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>move -2<cr>==", { desc = "Move line up" })
map("i", "<A-j>", "<cmd>move +1<cr>==", { desc = "Move line down" })
map("i", "<A-k>", "<cmd>move -2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":move '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":move '<-2<cr>gv=gv", { desc = "Move selection up" })

-- 保留貼上內容（視覺模式貼上不覆蓋寄存器）
map("v", "p", '"_dP', { desc = "Paste without overwriting register" })

-- 快捷退出
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- 清除搜尋高亮
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- ======== 安全審計 ========

-- Grep 敏感模式（hardcoded secrets / tokens）
map("n", "<leader>st", function()
  local patterns = [[API[_-]?KEY|SECRET|TOKEN|PASSWORD|PRIVATE[_-]?KEY|BEGIN.*PRIVATE\ KEY|Bearer\ [A-Za-z0-9\-._~+/]+=*]]
  require("grug-far").open({ prefills = { search = patterns } })
end, { desc = "Search secrets/tokens in project" })

-- 打開 terminal 跑 semgrep
map("n", "<leader>ss", "<cmd>split<CR><cmd>term semgrep --config=auto .<CR>", { desc = "Run Semgrep scan" })

-- C/C++ 靜態分析
map("n", "<leader>sc", "<cmd>split<CR><cmd>term cppcheck --enable=all %<CR>", { desc = "Run cppcheck on current file" })

-- 祕密掃描
map("n", "<leader>sg", "<cmd>split<CR><cmd>term gitleaks detect --no-git<CR>", { desc = "Run gitleaks" })

-- 格式化 SQL（sqlfluff）
map("n", "<leader>sq", "<cmd>!sqlfluff fix %<CR>", { desc = "Format SQL with sqlfluff" })

-- YAML 審計
map("n", "<leader>sy", "<cmd>!yamllint %<CR>", { desc = "Lint YAML with yamllint" })
