-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.cmd("wa")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })

    -- Only act if more than 1 buffer
    if #bufs <= 1 then
      return
    end

    local current = vim.api.nvim_get_current_buf()

    for _, buf in ipairs(bufs) do
      if buf.bufnr ~= current then
        -- If buffer is NOT modified → delete it
        if not buf.changed then
          vim.schedule(function()
            pcall(vim.api.nvim_buf_delete, buf.bufnr, { force = false })
          end)
        end
      end
    end
  end,
})
