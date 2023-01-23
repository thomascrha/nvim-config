local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("Unable to load plugin nvim-tree")
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    print("Unable to load plugin nvim-tree.config")
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    filters = {
        dotfiles = false
    },
    git = {
        ignore = false
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
        mappings = {
            list = {
                { key = "-", cb = tree_cb("split") },
                { key = "|", cb = tree_cb("vsplit") },
            },
        },
    },
})
