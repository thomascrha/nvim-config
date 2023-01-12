local plugin = "telescope"
local status_ok, telescope = pcall(require, plugin)
if not status_ok then
  print("Unable to load ", plugin)
  return
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
