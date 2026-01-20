local LazyPluginManager = require("config.lazy")
LazyPluginManager.ensure_installed()

_G.LazyUtil = require("util")

local M = {}
LazyUtil.config = M

-- add support for the LazyFile event
local Event = require("lazy.core.handler.event")

Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

---@param name "keymap" | "options"
function M.load(name)
  local function _load(mod)
    if require("lazy.core.cache").find(mod)[1] then
      LazyUtil.try(function()
        require(mod)
      end, { msg = "Failed loading " .. mod })
    end
  end
  _load("config." .. name)
end

M.load("options")

local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "VeryLazy",
  callback = function()
    M.load("keymap")
  end
})

LazyPluginManager.setup()

M.did_init = false
function M.init()
  if M.did_init then
    return
  end
  M.did_init = true
end

return M
