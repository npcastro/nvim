require("other-nvim").setup({
  mappings = {
    "rails",
    {
      pattern = "/engines/(.*)/app/(.*).rb$",
      target = "/spec/engines/%1/%2_spec.rb",
      context = "test",
    },
    {
      pattern = "/spec/engines/(%w+)/(.*)_spec.rb$",
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
