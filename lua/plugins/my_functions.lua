-- File: ~/.config/nvim/lua/my_functions.lua

local M = {}

function M.get_visual_selection_offsets()
  local buf = vim.api.nvim_get_current_buf()
  local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(buf, "<"))
  local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(buf, ">"))

  if start_row == end_row then
    local line = vim.api.nvim_buf_get_lines(buf, start_row - 1, start_row, false)[1]
    local offset_start = vim.fn.byteidx(line, start_col)
    local offset_end = vim.fn.byteidx(line, end_col + 1)
    return offset_start, offset_end
  else
    print("Selection must be within a single line.")
    return nil, nil
  end
end

function M.replace_with_offsets(tag)
  local start_offset, end_offset = M.get_visual_selection_offsets()
  if not start_offset or not end_offset then
    return
  end

  local buf = vim.api.nvim_get_current_buf()
  local start_row = vim.api.nvim_buf_get_mark(buf, "<")[1]
  local line = vim.api.nvim_buf_get_lines(buf, start_row - 1, start_row, false)[1]

  local replaced_line = string.format("%s[(%d,%d,'%s')]", line:sub(1, start_offset - 1), start_offset, end_offset, tag)

  vim.api.nvim_buf_set_lines(buf, start_row - 1, start_row, false, { replaced_line })
end

return M
