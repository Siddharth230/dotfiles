return {
  "AlphaTechnolog/pywal.nvim",
  lazy = false,
  priotity = 1000,
  config = function()
    require("pywal").setup()
  end,
}
