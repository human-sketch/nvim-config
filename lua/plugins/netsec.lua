return {
  -- ======== 網絡安全工作流增強 ========

  -- 書籤（分析代碼/日誌時快速跳轉）
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon: 加入書籤" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: 書籤選單" })
      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
    end,
  },

  -- hex 視圖（分析二進制 payload / 數據包）
  {
    "RaafatTurki/hex.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Hex" },
    opts = {},
  },

  -- HTTP 請求測試（在 nvim 內發 request，類似 REST client）
  {
    "mistweaverco/kulala.nvim",
    cmd = { "Kulala" },
    opts = {
      -- 預設請求檔案副檔名（.http 檔案）
      default_view = "split",
    },
  },

  -- tmux 整合：Ctrl+hjkl 在 nvim/tmux 間無縫移動（tmux 安裝後生效）
  {
    "christoomey/vim-tmux-navigator",
    cond = function()
      return vim.fn.executable("tmux") == 1
    end,
    event = "VeryLazy",
  },

  -- 大檔案優化：開啟大檔案時關閉耗資源功能（分析巨型日誌）
  {
    "LazyVim/LazyVim",
    init = function()
      local augroup = vim.api.nvim_create_augroup("LargeFileOpt", { clear = true })
      vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
        group = augroup,
        callback = function()
          local f = vim.fn.expand("<afile>")
          local size = vim.fn.getfsize(f)
          if size > 5 * 1024 * 1024 then -- >5MB
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.syntax = "off"
            vim.opt_local.relativenumber = false
            vim.opt_local.spell = false
            vim.b.large_file = true
          end
        end,
      })
    end,
  },

  -- base64 / hex 快速轉換命令（發 payload 常用）
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>ub", desc = "Base64 編碼選中文字" },
      { "<leader>ud", desc = "Base64 解碼選中文字" },
      { "<leader>ux", desc = "Hex 編碼選中文字" },
      { "<leader>uxd", desc = "Hex 解碼選中文字" },
    },
    config = function()
      local function run_on_visual(cmd)
        return function()
          local lines = vim.fn.getline("'<", "'>")
          local text = table.concat(lines, "\n")
          local result = vim.fn.system(cmd .. " " .. vim.fn.shellescape(text))
          result = vim.trim(result)
          if result == "" then
            vim.notify("轉換結果為空", vim.log.levels.WARN)
            return
          end
          vim.fn.setreg("+", result)
          vim.notify("已複製到剪貼簿: " .. result:sub(1, 80))
        end
      end

      local function encode()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gv", true, false, true), "n", false)
      end

      vim.keymap.set("v", "<leader>ub", function()
        encode()
        vim.defer_fn(run_on_visual("base64"), 10)
      end, { desc = "Base64 編碼" })

      vim.keymap.set("v", "<leader>ud", function()
        encode()
        vim.defer_fn(run_on_visual("base64 -d"), 10)
      end, { desc = "Base64 解碼" })

      vim.keymap.set("v", "<leader>ux", function()
        encode()
        vim.defer_fn(run_on_visual("xxd -p"), 10)
      end, { desc = "Hex 編碼" })

      vim.keymap.set("v", "<leader>uxd", function()
        encode()
        vim.defer_fn(run_on_visual("xxd -r -p"), 10)
      end, { desc = "Hex 解碼" })
    end,
  },

  -- Rust 測試整合（neotest + rust 適配器）
  {
    "nvim-neotest/neotest",
    dependencies = {
      "rouge8/neotest-rust",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      adapters = {
        ["neotest-rust"] = {},
      },
    },
  },
}
