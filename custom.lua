return {
  -- ======== 语言 LSP 增强（通过 mason 安装） ========
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",                 -- Python LSP
        "gopls",                   -- Go LSP
        "typescript-language-server", -- JS/TS LSP
        "json-lsp",                -- JSON 支持
        "stylua",                  -- Lua 格式化（可选）
        "black",                   -- Python 格式化
        "isort",                   -- Python import 排序
        "prettier",                -- JS/TS/JSON 格式化
        "ruff",                    -- Python linting/formatting
        "golangci-lint",           -- Go linting
        "eslint",                  -- JS/TS linting
      },
    },
  },

  -- ======== 自动格式化（保存时自动纠正格式） ========
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        go = { "gofmt" },   -- 也可以用 "goimports"
      },
    },
  },

  -- ======== 实时 linting（代码错误/风格提示） ========
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
        go = { "golangci_lint" },
        javascript = { "eslint" },
        typescript = { "eslint" },
      },
    },
  },

  -- ======== AI 补全（二选一，推荐 Codeium 免费） ========
  -- 方案1：GitHub Copilot（需要付费订阅）
  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     vim.g.copilot_assume_mapped = true
  --   end,
  -- },

  -- 方案2：Codeium（完全免费，类似 Copilot）
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
}
