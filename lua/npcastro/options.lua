-- :help options
vim.opt.clipboard = 'unnamedplus'               -- allows neovim to access the system clipboard
vim.opt.completeopt = { 'menuone', 'noselect' } -- cmp behaviour options
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.fileencoding = 'utf-8'                  -- the encoding written to a file
vim.opt.guifont = 'monospace:h17'               -- the font used in graphical neovim applications
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = 'a'                             -- allow the mouse to be used in all modes
vim.opt.number = true                           -- set numbered lines
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.scrolloff = 16                          -- number of lines to keep vertically when scrolling
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.sidescrolloff = 8                       -- nubmer of lines to keep horizonally when scrolling
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 1000                       -- faster completion (4000ms default)
vim.opt.signcolumn = 'yes'                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.wrap = false                            -- display lines as one long line

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
