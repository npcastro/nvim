require("other-nvim").setup({
  mappings = {
    -- main app
    {
      pattern = "app/(.*)%.rb$",
      target = "/sorbet/rbi/shims/%1.rbi",
      context = "shim",
    },
    {
      pattern = "app/(.*)%.rb$",
      target = "/spec/%1_spec.rb",
      context = "test",
    },
    {
      pattern = "app/models/(.*)%.rb$",
      target = "/spec/factories/%1.rb",
      context = "factory",
    },
    -- engines
    {
      pattern = "engines/(.*)/app/(.*)%.rb$",
      target = "/spec/engines/%1/%2_spec.rb",
      context = "test",
    },
    {
      pattern = "engines/(.*)/app/(.*)%.rb$",
      target = "/sorbet/rbi/shims/engines/%1/%2.rbi",
      context = "shim",
    },
    {
      pattern = "engines/(.*)/app/models/(.*)/(.*)%.rb$",
      target = "/spec/factories/%1/%3.rb",
      context = "factory",
    },
    {
      pattern = "/spec/engines/(%w+)/(.*)_spec%.rb$",
      target = "/engines/%1/app/%2.rb",
      context = "implementation",
    },
    {
      pattern = "/src/(.*)/(.*).ts$",
      target = "/src/%1/__tests__/%2.test.ts",
      context = "test",
    },
    {
      pattern = "/src/(.*)/__tests__/(.*).test.ts$",
      target = "/src/%1/%2.ts",
      context = "implementation",
    },
  }
})

vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>:Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>otn", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>os", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ov", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
