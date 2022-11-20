local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  -- inteligent commenting for complex files like jsx or vue files
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
}
