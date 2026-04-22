return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "hadolint",
        "cmakelang",
        "cmakelint",
        "ruff",
        "sqlfluff",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "lua_ls",
        "jsonls",
        "pyright",
        "ts_ls",
      },
    },
  },
}
