local markview = require("markview")
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
