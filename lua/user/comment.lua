local plugin = "Comment"
local status, comment = pcall(require, plugin)
if not status then
	print("Unable to load plugin ", plugin)
	return
end

comment.setup()
