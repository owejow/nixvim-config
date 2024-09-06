local null_ls = require("null-ls")

function format_enabled()
  local buf = vim.api.nvim_get_current_buf()
  local gaf = vim.g.autoformat
  local baf = vim.b[buf].autoformat

  -- If the buffer has a local value, use that
  if baf ~= nil then
    return baf
  end

  -- Otherwise use the global value if set, or true by default
  return gaf == nil or gaf
end

function toggle_format(buf)
  if buf then
    vim.b.autoformat = not format_enabled()
  else
    vim.g.autoformat = not format_enabled()
    vim.b.autoformat = nil
  end
  format_info()
end

function format_info()
  local buf = vim.api.nvim_get_current_buf()
  local gaf = vim.g.autoformat == nil or vim.g.autoformat
  local baf = vim.b[buf].autoformat
  local enabled = format_enabled()
  local lines = {
    ("- [%s] global **%s**"):format(gaf and "x" or " ", gaf and "enabled" or "disabled"),
    ("- [%s] buffer **%s**"):format(
      enabled and "x" or " ",
      baf == nil and "inherit" or baf and "enabled" or "disabled"
    ),
  }
  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, {
    title = "Auto Format Status",
    on_open = function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
    end,
  })
end

-- increase timeout on formatting
vim.lsp.buf.format({ timeout_ms = 4000 })
-- local haskell_format = {
--   method = null_ls.FORMATTING,
--   filetypes = { "haskell" },
--   generator = null_ls.generator({
--     command = "hindent",
--     args = { "--stdin" },
--     to_stdin = true,
--     from_stderr = true,
--     format = "line",
--     check_exit_code = function(code, stderr)
--       local success = code <= 1
--
--       if not success then
--         -- can be noisy for things that run often (e.g. diagnostics), but can
--         -- be useful for things that run on demand (e.g. formatting)
--         print(stderr)
--       end
--
--       return success
--     end,
--   }),
-- }

-- null_ls.register(haskell_format)
