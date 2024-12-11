local wk = require("which-key")

wk.add({
  { "<leader>b",  desc = "+buffer" },
  { "<leader>c",  desc = "+code" },
  { "<leader>f",  desc = "+find/file" },
  { "<leader>g",  desc = "+git" },
  { "<leader>s",  desc = "+search" },
  { "<leader>x",  desc = "+diagnostics/quickfix" },
  { "<leader>ca", desc = "Code Action" },
  { "<leader>cm", desc = "Format Document" },
  { "<leader>cr", desc = "Rename Variable" },
})
