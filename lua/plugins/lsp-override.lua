return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        -- 格式化器 / 工具
        "stylua",
        "black",
        "isort",
        "prettier",
        "ruff",
        "golangci-lint",
        -- 安全
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "hadolint",
        "semgrep",
        "clang-format",
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",
        "ts_ls",
        "zls",
        "sqls",
        "clangd",
        "eslint",
      },
      automatic_installation = false,
    },
  },
}
