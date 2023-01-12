local plugin = "bufferline"
local status_ok, bufferline = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

bufferline.setup()
