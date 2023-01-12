local plugin = "neoclip"
local status_ok, clip = pcall(require, plugin)

if not status_ok then
  print("Unable to load plugin ", plugin)
  return
end

clip.setup()
