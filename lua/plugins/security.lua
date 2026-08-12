return {
  -- 擴充 lint 規則：安全審計
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        go = { "golangcilint" },
        dockerfile = { "hadolint" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
        c = { "cppcheck", "flawfinder" },
        cpp = { "cppcheck", "flawfinder" },
        yaml = { "yamllint" },
        python = { "ruff" },
      })
    end,
  },

  -- 擴充 Treesitter：安全相關語法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "bash",
        "dockerfile",
        "toml",
        "make",
        "yaml",
        "regex",
        "c",
        "cpp",
        "diff",
        "proto",
      })
    end,
  },

  -- HTTP 客戶端（API 安全測試）— 零依賴
  {
    "mistweaverco/kulala.nvim",
    config = function()
      require("kulala").setup()
    end,
  },
}
