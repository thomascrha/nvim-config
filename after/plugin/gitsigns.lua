local plugin = "gitsigns"
local status_ok, gitsigns = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

gitsigns.setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}
