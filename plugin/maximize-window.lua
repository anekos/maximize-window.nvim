vim.keymap.set('n', '<C-w>o', function()
  if vim.t.back_to == nil then
    local back_to = vim.fn.tabpagenr()
    local bufnr = vim.fn.winbufnr(0)
    local lncol = vim.fn.getpos('.')
    vim.cmd.tabnew()
    vim.cmd.buffer(bufnr)
    vim.fn.setpos('.', lncol)
    vim.t.back_to = back_to
    return
  end

  local _back_to = vim.t.back_to
  vim.t.back_to = nil
  vim.cmd.tabclose()
  vim.cmd.tabnext('1')
end, {})
