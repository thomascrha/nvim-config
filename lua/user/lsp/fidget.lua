local plugin = "fidget"
local status_ok, fidget = pcall(require, plugin)
if not status_ok then
  print("Unable to load plugin ", plugin)
  return
end

fidget.setup()
