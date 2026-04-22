return {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup(vim.fn.exepath("python"))
    require("dap-python").test_runner = "pytest"
  end,
}
