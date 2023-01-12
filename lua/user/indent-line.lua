local plugin = "indent_blankline"
local status_ok, indent_line = pcall(require, plugin)

if not status_ok then
	print("Unable to load plugin ", plugin)
	return
end

indent_line.setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	space_char_blankline = " ",
})
