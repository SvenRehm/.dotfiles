return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    doc_lines = 0,
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
