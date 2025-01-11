return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
        auto_refresh = false,
        -- keymap = {
        --   jump_prev = "[[",
        --   jump_next = "]]",
        --   accept = "<CR>",
        --   refresh = "gr",
        --   open = "<M-CR>"
        -- },
        layout = {
          position = "bottom", -- | top | left | right | horizontal | vertical
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<M-y>",
          accept_word = false,
          accept_line = false,
          next = "<M-l>",
          prev = "<M-u>",
          dismiss = "<M-j>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    })
  end,
}
