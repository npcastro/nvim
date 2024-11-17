local telescope = require('telescope')
local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')

local ts_select_dir_for_grep = function()
  local action_state = require("telescope.actions.state")
  local fb = require("telescope").extensions.file_browser
  local live_grep = require("telescope.builtin").live_grep
  local current_line = action_state.get_current_line()

  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function()
      require("telescope.actions").select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        live_grep({
          results_title = relative .. "/",
          cwd = absolute,
          default_text = current_line,
        })
      end)

      return true
    end,
  })
end

telescope.setup {
  defaults = {

    -- prompt_prefix = " ",
    -- selection_caret = " ",
    path_display = { "absolute" },
    preview = {
      hide_on_startup = true,
    },

    mappings = {
      i = {   -- insert mode mappings
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-r>"] = actions_layout.toggle_preview,
      },

      n = {   -- normal mode mappings
        ["<CR>"] = actions.select_default,
        ["<C-r>"] = actions_layout.toggle_preview,
      },
    },
    vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          -- "--smart-case",    -- do not asume case. Favors case sensitivity
    }
  },
pickers = {
    live_grep = {
      mappings = {
        i = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
        n = {
          ["<C-f>"] = ts_select_dir_for_grep,
        },
      },
    },
  },
  extensions = {
  },
}

vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files <cr>")
vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>")
