local configs = require('nvim-treesitter.configs')

configs.setup {
  auto_install = true,
  comment = {
    enable = true,
    enable_autocmd = false,
  },
  endwise = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "gitignore",
    "html",
    "http",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "regex",
    "ruby",
    "sql",
    "typescript",
    "vim",
    "vue",
    "yaml",
  }, -- "all" or a map of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,  -- important to correctly highlight ruby symbols
  },
  ignore_install = { "" }, -- List of parsers to ignore installing
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  sync_install = false,
}
