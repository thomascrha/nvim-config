local plugin = "scrollbar"
local status_ok, scrollbar = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

scrollbar.setup()
