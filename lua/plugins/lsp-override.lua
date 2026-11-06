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
        -- semgrep 官方不支援 Windows（需 WSL/Docker），不列入自動安裝
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
        -- sqls 使用官方 Windows 預編譯檔（Mason 版需 C 編譯器），見 mason/bin/sqls.exe
        "clangd",
        "eslint",
      },
      automatic_installation = false,
    },
  },
}
