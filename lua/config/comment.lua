local comment = require('Comment')

comment.setup {
  -- inteligent commenting for complex files like jsx or vue files
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
}
