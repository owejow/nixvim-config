local markview = require("markview")
local wk = require("which-key")

markview.setup({
  -- This is nice to have
  mode = { "n", "x" },
  callbacks = {
    on_enable = function(_, win)
      vim.wo[win].conceallevel = 2
      vim.wo[win].concealcursor = "nc"
    end,
  },
})

local is_markdown_filetype = function()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  return ft == "markdown"
end

wk.add({
  "<leader>md",
  function()
    if is_markdown_filetype() then
      vim.api.nvim_command("Markview toggle")
    end
  end,
  desc = "Toggle Markview",
})

wk.add({
  "<leader>cc",
  function()
    vim.api.nvim_command("cclose")
  end,
  desc = "close quickfix window",
})
