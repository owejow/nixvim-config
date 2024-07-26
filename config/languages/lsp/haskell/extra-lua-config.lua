local wk = require("which-key")
local ht = require("haskell-tools")
local is_haskell_filetype = function()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  return ft == "cabal" or ft == "haskell"
end
wk.add({
  "<leader>cl",
  function()
    if is_haskell_filetype() then
      vim.lsp.codelens.run()
    end
  end,
  desc = "run codelens for haskell files",
})

wk.add({
  "<leader>hs",
  function()
    if is_haskell_filetype() then
      ht.hoogle.hoogle_signature()
    end
  end,
  desc = "run hoogle search for the type signature of the definition under the cursor (haskell buffers only)",
})

wk.add({
  "<leader>ss",
  function()
    if is_haskell_filetype() then
      ht.lsb.buf_eval_all()
    end
  end,
  desc = "evaluate all code snippets",
})

wk.add({
  "<leader>rr",
  function()
    if is_haskell_filetype() then
      ht.repl.toggle()
    end
  end,
  desc = "toggle GHCi repl for the current package",
})

wk.add({
  "<leader>rf",
  function()
    if is_haskell_filetype() then
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end
  end,
  desc = "toggle GHCi repl for the current package",
})

wk.add({
  "<leader>rq",
  function()
    if is_haskell_filetype() then
      ht.repl.quit()
    end
  end,
  desc = "quit the GHCi repl",
})

-- local wk = require("which-key")
-- local is_haskell_filetype = function()
--   local ftype = vim.bo.filetype
--   return ftype == "lua" or ftype == "cabal"
-- end
--
-- wk.register({
--   {
--     "<leader>cl",
--     function()
--       print("hehe")
--     end,
--     desc = "codelens run",
--     cond = is_haskell_filetype,
--     mode = "n",
--   },
-- })
