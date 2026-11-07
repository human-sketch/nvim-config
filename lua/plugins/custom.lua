return {
  -- ======== 自動格式化 ========
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        go = { "gofmt" },
      })
    end,
  },

  -- ======== 即時 linting ========
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        python = { "ruff" },
        go = { "golangcilint" },
      })
    end,
  },

  -- ======== Discord Rich Presence ========
  {
    "vyfor/cord.nvim",
    opts = {
      client_id = "1516308183889743902",
      -- Windows Smart App Control 會封鎖未簽章的 cord.exe；避免自動更新換掉可用的執行檔
      advanced = {
        server = {
          auto_update = false,
        },
      },
      display = {
        theme = "catppuccin",
        flavor = "accent",
      },
      text = {
        editing = function(opts)
          return "Adding bugs to " .. opts.filename
        end,
        file_browser = "Browsing files and project",
      },
      idle = {
        enabled = true,
        timeout = 5400000,
        details = "zᶻ≽₍^_ ‸ _ ^₎≼⟆",
      },
    },
  },

  -- ======== Rust（rustaceanvim 自管 LSP，不經 mason-lspconfig） ========
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    version = false,
    opts = {
      server = {
        root_dir = function(fname)
          local cargo_root = vim.fs.find({ "Cargo.toml" }, { upward = true, path = fname })[1]
          return cargo_root and vim.fs.dirname(cargo_root) or vim.fn.getcwd()
        end,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
          },
        },
      },
    },
    -- 覆寫 LazyVim 的 config：其 Windows 版會呼叫 uname 並套用錯誤的 .dylib 路徑。
    -- rustaceanvim 內建會自動從 Mason 找到 codelldb 與 liblldb.dll。
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
  },

  -- ======== C/C++ + SQL LSP 伺服器配置 ========
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy" },
        },
        sqls = {},
      },
    },
  },
}
