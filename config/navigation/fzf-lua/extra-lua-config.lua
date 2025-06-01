local function my_on_attach(bufnr) end

-- pass to setup along with your other options
require("fzf-lua").setup({
  on_attach = my_on_attach,
})
