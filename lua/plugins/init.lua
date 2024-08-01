return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "Shatur/neovim-session-manager",
    dependecies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      -- https://github.com/Shatur/neovim-session-manager#configuration

      -- local Path = require('plenary.path')

      local config = require "session_manager.config"

      require("session_manager").setup {
        autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          "gitcommit",
          "gitrebase",
        },
        autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rubocop",
        "solargraph",
        "stylua",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "configs.lspconfig"
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "ruby",
      },
      indent = {
        enable = false,
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -------------------------------------------------------------------------------------------------------------------------------------
  -- Edit tools
  -------------------------------------------------------------------------------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  { -- It abolishes some mistypes
    "tpope/vim-abolish",
    event = { "BufReadPre", "BufNewFile" },
  },

  { -- It set shiftwidth and expandtab the same to the other files with the same type in the project
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },

  { -- Allows to dot repeat everything. like surround commands and so on
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
  },

  { -- Provides an easy connection to any DB
    "tpope/vim-dadbod",
    lazy = false,
  },

  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
  },

  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-w",
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-e",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-b",
      },
    },
  },

  -------------------------------------------------------------------------------------------------------------------------------------
  -- Ruby support
  -------------------------------------------------------------------------------------------------------------------------------------
  {
    "slim-template/vim-slim",
    lazy = false,
  },

  { -- Rails support
    "tpope/vim-rails",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
        pattern = { "*.yml" },
        callback = function()
          vim.bo.filetype = "yaml"
        end,
      })
    end,
  },

  { -- Helps to run such things as rake and so on from NVim (Vim too)
    "tpope/vim-dispatch",
    event = { "BufReadPre", "BufNewFile" },
  },

  { -- Wrapper for bundler
    "tpope/vim-bundler",
    event = { "BufReadPre", "BufNewFile" },
  },

  { -- Wrapper for rake
    "tpope/vim-rake",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "RRethy/nvim-treesitter-endwise",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        endwise = {
          enable = true,
        },
      }
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "zidhuss/neotest-minitest",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
          },
          require "neotest-plenary",
          require "neotest-minitest",
          require "neotest-rspec",
        },
      }
    end,
  },

  -------------------------------------------------------------------------------------------------------------------------------------
  -- Git tools
  -------------------------------------------------------------------------------------------------------------------------------------
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lzz", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>lzf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGitCurrentFile" },
      { "<leader>lzg", "<cmd>LazyGitFilter<cr>", desc = "LazyGitFilter" },
      { "<leader>lzc", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGitFilterCurrentFile" },
      { "<leader>lzs", "<cmd>LazyGitConfig<cr>", desc = "LazyGitConfig" },
    },
  },

  {
    "FabijanZulj/blame.nvim",
    cmd = { "BlameToggle" },
    config = function()
      require("blame").setup()
    end,
    keys = {
      { "<leader>gB", "<cmd>BlameToggle<cr>", desc = "Git Blame vizualier" },
    },
  },

  -------------------------------------------------------------------------------------------------------------------------------------
  -- Ranger
  -------------------------------------------------------------------------------------------------------------------------------------
  {
    "kelly-lin/ranger.nvim",
    config = function()
      local ranger_nvim = require "ranger-nvim"

      ranger_nvim.setup {
        replace_netrw = false,
        enable_cmds = true,
        keybinds = {
          ["|"] = ranger_nvim.OPEN_MODE.vsplit,
          ["_"] = ranger_nvim.OPEN_MODE.split,
          -- ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
          -- ["or"] = ranger_nvim.OPEN_MODE.rifle,
        },
        ui = {
          border = "rounded",
          border_color = "grey_fg",
          height = 0.9,
          width = 0.95,
          x = 0.5,
          y = 0.5,
        },
      }
    end,
    keys = {
      {
        "<leader>rr",
        function()
          local ranger_nvim = require "ranger-nvim"
          ranger_nvim.open(true)
        end,
        desc = "Ranger",
      },
    },
  },

  -------------------------------------------------------------------------------------------------------------------------------------
  -- UI
  -------------------------------------------------------------------------------------------------------------------------------------
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
        routes = {
          {
            view = "notify",
            filter = { 
              event = "msg_showmode" 
            },
          },
          {
            view = 'mini',
            filter = {
              event = 'msg_showcmd',
              any = {
                { find = '[0-9mq]$' }
              },
            },
          },
        },
      })
    end
  },

  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify", -- optional
    opts = {}, -- required even with default settings, since it calls `setup()`
  },
}
