local plugin = "neoscroll"
local status_ok, scroll = pcall(require, plugin)

if not status_ok then
  print("Unable to load plugin ", plugin)
  return
end

scroll.setup()
