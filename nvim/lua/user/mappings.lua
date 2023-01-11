-- Commands
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references)

vim.keymap.set("n", "<leader>to", require("nvim-tree.api").tree.toggle)

vim.cmd[[nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>]]

vim.cmd[[nnoremap <leader>x< <cmd>BufferLineCloseLeft<cr>]]
vim.cmd[[nnoremap <leader>x> <cmd>BufferLineCloseRight<cr>]]
vim.cmd[[nnoremap <leader>[ <cmd>BufferLineCyclePrev<cr>]]
vim.cmd[[nnoremap <leader>] <cmd>BufferLineCycleNext<cr>]]
vim.cmd[[nnoremap <leader>bp <cmd>BufferLinePick<cr>]]
vim.cmd[[nnoremap <leader>w <cmd>bdelete<cr>]]
vim.cmd[[nnoremap <leader>q! <cmd>bdelete!<cr>]]

vim.cmd[[nnoremap <leader>rtf <cmd>TestFile<cr>]]
vim.cmd[[nnoremap <leader>rta <cmd>TestSuite<cr>]]

vim.cmd[[nnoremap <leader>e <cmd>lua vim.diagnostic.goto_next()<cr>]]
vim.cmd[[nnoremap <leader>E <cmd>lua vim.diagnostic.goto_prev()<cr>]]
vim.cmd[[nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>]]

vim.cmd[[nnoremap <leader>bl <cmd>Gitsigns blame_line<cr>]]

-- vertical navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nvim tree marks
vim.keymap.set("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next)
vim.keymap.set("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev)
vim.keymap.set("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select)


-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- Debug
vim.keymap.set("n", "<leader>bk", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>so", require("dap").step_over)
vim.keymap.set("n", "<leader>si", require("dap").step_into)
vim.keymap.set("n", "<leader>cc", require("dap").continue)

-- Go
vim.cmd[[nnoremap <leader>gi <cmd>GoImplements<cr>]]
