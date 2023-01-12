local plugin = "zen-mode"
local status_ok, zen = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

zen.setup({
	window = {
		width = 90,
		options = {
			number = true,
			relativenumber = true,
		},
	},
})
