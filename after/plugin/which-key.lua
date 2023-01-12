local plugin = "which-key"
local status_ok, key = pcall(require, plugin)

if not status_ok then
  print("Unable to load plugin ", plugin)
  return
end

key.setup()
