-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {
    "nvim-neorg/neorg",
    ft = "norg", -- lazy-load on filetype
    config = true, -- run require("neorg").setup()
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_pick_enable = 1
        vim.g.rnvimr_bw_enable = 1
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
        default_mappings = true; -- Bind default mappings
        -- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
        -- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
        -- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
        -- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
        -- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
        -- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        post_close_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        };
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true; -- Focus the floating window when opening it.
        dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
      }
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("user.metals").config()
    end,
  },
}

-- local telescopebuiltin = require("telescope.builtin")
-- local function grep_cword()
--   return telescopebuiltin.grep_string({search = vim.fn.expand("<cword>")})
-- end
lvim.builtin.which_key.mappings["."] = {
  "<cmd> Telescope grep_string<CR>", "Grep String"
}

-- Non functional
-- lvim.builtin.which_key.mappings[","] = {
--   "<cmd> Git grep -q {vim.fn.expand("<cword>")}<CR>", "Git Grep String"
-- }

vim.opt.foldmethod = "expr" -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
-- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
vim.opt.foldenable = false

