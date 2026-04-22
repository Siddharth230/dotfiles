return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      sql = { "sql_formatter" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      c = { "clang_format " },
      cpp = { "clang_format" },
    },
    formatters = {
      sql_formatter = {
        command = "sql-formatter",
        args = { "--language", "mysql" },
        stdin = true,
      },
    },
  },
}
