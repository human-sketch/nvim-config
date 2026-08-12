-- 自動命令

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("UserAutocmds", { clear = true })

-- 終端模式預設 insert
autocmd("TermOpen", {
  group = group,
  command = "startinsert",
})

-- 儲存時自動修剪尾隨空白
autocmd("BufWritePre", {
  group = group,
  pattern = { "*.lua", "*.py", "*.go", "*.rs", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.yaml", "*.toml" },
  command = [[%s/\s\+$//e]],
})

-- 回到上次編輯位置
autocmd("BufReadPost", {
  group = group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Markdown / 純文字自動折行
autocmd("FileType", {
  group = group,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})
