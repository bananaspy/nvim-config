local LazyCoreUtil = require("lazy.core.util")

local M = {}

setmetatable(M, {
  __index = function(t, k)
    if LazyCoreUtil[k] then
      return LazyCoreUtil[k]
    end

    t[k] = require("util." .. k)
    return t[k]
  end
})

-- Wrapper around vim.keymap.set that will
-- not create a keymap if a lazy key handler exists.
-- It will also set `silent` to true by default
function M.safe_keymap_set(mode, key, handler, opts)
  local keys = require("lazy.core.handler").handlers.keys
  local modes = type(mode) == "string" and { mode } or mode

  modes = vim.tbl_filter(function(m)
    return not (keys.have and keys:have(key, m))
  end, modes)

  -- do not create the keymap if a lazy keys handler exists
  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      ---@diagnostic disable-next-line: no-unknown
      opts.remap = nil
    end
    vim.keymap.set(modes, key, handler, opts)
  end
end

-- VeryLazy is triggered by lazy.nvim after LazyDone (i.e. after
-- plugin manager has finished starting up and loaded user config)
-- and processing VimEnter autocommands
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end
  })
end

-- emulate undo break creation
M.CREATE_UNDO = vim.api.nvim_replace_termcodes("<c-G>u", true, true, true)
function M.create_undo()
  if vim.api.nvim_get_mode().mode == "i" then
    vim.api.nvim_feedkeys(M.CREATE_UNDO, "n", false)
  end
end

return M

