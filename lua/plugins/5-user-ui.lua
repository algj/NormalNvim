return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        enable = true,
        groups = {
          -- Defaults
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',

          -- NeoTree sidebar
          'NeoTreeNormal', 'NeoTreeNormalNC', 'NeoTreeEndOfBuffer', 'NeoTreeCursorLine',
          'NeoTreeTitleBar', 'NeoTreeFloatTitle', 'NeoTreeTabInactive', 'NeoTreeTabActive',
          'NeoTreeTabSeparatorInactive', 'NeoTreeTabSeparatorActive', 'NeoTreeFloatBorder',
          'NeoTreeRootName', 'NeoTreeDimText',
          'NeoTreeFloatTitle',-- Title of floating Neo-tree windows
          'NeoTreeTabInactive',-- Inactive Neo-tree tabs
          'NeoTreeTabActive', -- Active Neo-tree tabs
          'NeoTreeTitleBar',  -- Neo-tree title bar

          -- Tabline
          'TabLine', 'TabLineSel', 'TabLineFill',

          -- Aerial
          'AerialNormal', 'AerialLine',

          -- Other?
          'WinSeparator', 'VertSplit',

          -- Fold
          "FoldColumn",

          -- Bug fix
          'NormalFloat', 'FloatBorder', 'NormalSB',
        },
      })
    end,
    event = "VimEnter"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",  -- or "│"
      },
      scope = {
        enabled = true,
      },
      exclude = {
        filetypes = {
          "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason",
          "notify", "toggleterm", "lspinfo", "packer", "checkhealth",
        },
        buftypes = { "terminal", "nofile" }
      }
    },
    config = function(_, opts)
      require("ibl").setup(opts)

      -- Auto-disable for large files
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          vim.b.ibl_disable = vim.fn.line("$") > 1000
        end,
      })
    end
  },
}
