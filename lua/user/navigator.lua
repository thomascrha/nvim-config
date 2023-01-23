local plugin = "navigator"
local status_ok, navigator = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

navigator.setup({
	lsp = {
		format_on_save = false
	}
})
