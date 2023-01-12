local plugin = "lspconfig"
local status_ok, nvim_lsp = pcall(require, plugin)

if not status_ok then
  print("Unable to load plugin ", plugin)
  return
end

--[[ local protocol = require("vim.lsp.protocol") ]]

local lsp_defaults = nvim_lsp.util.default_config

lsp_defaults.capabilities =
vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())


nvim_lsp.tailwindcss.setup({})
