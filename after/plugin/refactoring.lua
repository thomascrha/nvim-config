local plugin = "refactoring"
local status_ok, refactoring = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

refactoring.setup({})
