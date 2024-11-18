local npairs = require('nvim-autopairs')

npairs.setup {
  check_ts = true, -- use treesitter to check for pairs
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_config = require('cmp')
cmp_config.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })  -- add parenthesis after select on cmp
