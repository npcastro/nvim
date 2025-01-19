require('supermaven-nvim').setup({
  keymaps = {
    accept_suggestion = "<Tab>",
    clear_suggestion = "<S-Tab>",
    accept_word = "<C-l>",
  },
})

local toggle_supermaven = function()
    local supermaven = require("supermaven-nvim")
    local api = require("supermaven-nvim.api")
    if supermaven.disable_inline_completion then
      api.toggle()
      print("Inline AI autocompletion ENABLED")
    else
      api.toggle()
      print("Inline AI autocompletion DISABLED")
    end
  end

vim.keymap.set(
  'n',
  '<leader>tia',
  toggle_supermaven,
  { desc = '[T]oggle [I]nline [A]I autocompletion' }
)
