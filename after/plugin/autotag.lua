local plugin = "nvim-ts-autotag"
local status_ok, autotag = pcall(require, plugin)
if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

autotag.setup()
