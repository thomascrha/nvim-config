-- indent file
vim.keymap.set('n', '<leader>i', 'gg=G``')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- use leader and yank to copy to the clipboard Primeagen
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- manually remove all training whitespace
vim.keymap.set('n', '<leader>w', '<cmd>StripTrailingWhitespace<cr>')

-- allow moving a wound splits with ctrl + direction
vim.keymap.set('n', '<leader><Left>', '<C-w>h')
vim.keymap.set('n', '<leader><Right>', '<C-w>l')
vim.keymap.set('n', '<leader><Up>', '<C-w>k')
vim.keymap.set('n', '<leader><Down>', '<C-w>j')

vim.keymap.set('n', '<leader>S', "<cmd>lua require('spectre').open()<cr>")

-- "search current word
vim.keymap.set({ 'n', 'v' }, '<leader>sw', "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")


-- "  search in current file
vim.keymap.set('n', "<leader>sp", "<cmd>lua require('spectre').open_file_search()<cr>")
-- " run command :Spectre

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- show nvim
vim.keymap.set('n', '<leader>t', "<cmd>NvimTreeFindFileToggle<cr>")
vim.keymap.set('n', '<leader>T', "<cmd>NvimTreeFindFileToggle<cr><cmd>NvimTreeFindFileToggle<cr>")

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local telescope = require('telescope.builtin')

-- Searching for shit
vim.keymap.set('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', telescope.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', telescope.diagnostics, { desc = '[F]ind [D]iagnostics' })

-- Colorscheme picker
vim.keymap.set('n', '<leader>cs', telescope.colorscheme, { desc = '[C]olour [S]cheme select' })

-- Git actions
vim.keymap.set('n', '<leader>gc', telescope.git_commits, { desc = 'Find [G]it [C]ommits' })
vim.keymap.set('n', '<leader>gb', telescope.git_branches, { desc = 'Find [G]it [B]ranches' })
vim.keymap.set('n', '<leader>gs', telescope.git_stash, { desc = 'Find [G]it [S]tashes' })

-- undo
vim.keymap.set("n", "<F5>", "<cmd>UndotreeToggle<CR>")

-- zenmode
vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").toggle()
end)
-- Spelling
-- vim.keymap.set("n", "<leader>s", function()
-- require("telescope.builtin").spell_suggest(require('telescope.themes').get_cursor({}))
-- end)
--