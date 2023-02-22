-----------------------------------------------------------------------------------
-- indent file
-----------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>i', 'gg=G``', { desc = 'Automatically [i]ndent file' })

-----------------------------------------------------------------------------------
-- Keymaps for better default experience
-----------------------------------------------------------------------------------
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-----------------------------------------------------------------------------------
-- use leader and yank to copy to the clipboard Primeagen
-----------------------------------------------------------------------------------
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = '[y]ank into clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = '[Y]ank to end of line into clipboard' })

-- on WSL this doesn't work with clip.exe - simply use ctrl-shift-v in INSET mode
if not vim.fn.has("wsl") then
  vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = '' })
  vim.keymap.set("n", "<leader>P", [["+P]], { desc = '' })
end
-----------------------------------------------------------------------------------
-- manually remove all training whitespace
-----------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>w', '<cmd>StripTrailingWhitespace<cr>', { desc = '' })

-----------------------------------------------------------------------------------
-- allow moving a wound splits with ctrl + direction
-----------------------------------------------------------------------------------
vim.keymap.set('n', '<leader><Left>', '<C-w>h', { desc = '' })
vim.keymap.set('n', '<leader><Right>', '<C-w>l', { desc = '' })
vim.keymap.set('n', '<leader><Up>', '<C-w>k', { desc = '' })
vim.keymap.set('n', '<leader><Down>', '<C-w>j', { desc = '' })

-----------------------------------------------------------------------------------
-- " run command :Spectre
-----------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>S', "<cmd>lua require('spectre').open()<cr>", { desc = '' })
-- "search current word
vim.keymap.set({ 'n', 'v' }, '<leader>sw', "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", { desc = '' })
-- "  search in current file
vim.keymap.set('n', "<leader>sp", "<cmd>lua require('spectre').open_file_search()<cr>", { desc = '' })

-----------------------------------------------------------------------------------
-- Diagnostic keymaps
-----------------------------------------------------------------------------------
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = '' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = '' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '' })

-----------------------------------------------------------------------------------
-- show nvim
-----------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>t', "<cmd>NvimTreeFindFileToggle<cr>", { desc = '' })
vim.keymap.set('n', '<leader>T', "<cmd>NvimTreeFindFileToggle<cr><cmd>NvimTreeFindFileToggle<cr>", { desc = '' })

-----------------------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------------------
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

-----------------------------------------------------------------------------------
-- undo
-----------------------------------------------------------------------------------
vim.keymap.set("n", "<F5>", "<cmd>UndotreeToggle<CR>", { desc = '' })

-----------------------------------------------------------------------------------
-- Spelling
-----------------------------------------------------------------------------------
vim.keymap.set(
  "n", "<leader>s",
  function()
    require("telescope.builtin").spell_suggest(require('telescope.themes').get_cursor({}))
  end,
  { desc = '' }
)
--#region

-----------------------------------------------------------------------------------
-- Trouble
-----------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true, desc = ''}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true, desc = ''}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true, desc = '' }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true, desc = '' }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true, desc = '' }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true, desc = '' }
)

-----------------------------------------------------------------------------------
-- gitsigns
-----------------------------------------------------------------------------------
local gs = require("gitsigns")

-- Navigation
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then return ']c' end
  vim.schedule(function() gs.next_hunk() end)
  return '<Ignore>'
end, { expr = true })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then return '[c' end
  vim.schedule(function() gs.prev_hunk() end)
  return '<Ignore>'
end, { expr = true })

-- Actions
vim.keymap.set({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>hS', gs.stage_buffer)
vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
vim.keymap.set('n', '<leader>hR', gs.reset_buffer)
vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end)
vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
vim.keymap.set('n', '<leader>hd', gs.diffthis)
vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

-- Text object
vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

