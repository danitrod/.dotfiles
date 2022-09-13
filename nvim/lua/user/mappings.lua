-- Commands
vim.cmd[[nnoremap <leader>ff <cmd>Telescope find_files<cr>]]
vim.cmd[[nnoremap <leader>fg <cmd>Telescope live_grep<cr>]]
vim.cmd[[nnoremap <leader>fb <cmd>Telescope buffers<cr>]]
vim.cmd[[nnoremap <leader>fh <cmd>Telescope help_tags<cr>]]
vim.cmd[[nnoremap <leader>gd <cmd>Telescope lsp_definitions<cr>]]
vim.cmd[[nnoremap <leader>gr <cmd>Telescope lsp_references<cr>]]

vim.cmd[[nnoremap <leader>t <cmd>NvimTreeToggle<cr>]]
vim.cmd[[nnoremap <leader>[ <cmd>BufferLineCyclePrev<cr>]]
vim.cmd[[nnoremap <leader>] <cmd>BufferLineCycleNext<cr>]]
vim.cmd[[nnoremap <leader>w <cmd>bdelete<cr>]]
vim.cmd[[nnoremap <leader>q! <cmd>bdelete!<cr>]]
vim.cmd[[nnoremap <leader>rtf <cmd>TestFile<cr>]]
vim.cmd[[nnoremap <leader>rta <cmd>TestSuite<cr>]]
vim.cmd[[nnoremap <leader>e <cmd>lua vim.diagnostic.goto_next()<cr>]]

-- Insert mode
vim.cmd[[inoremap " ""<left>]]
vim.cmd[[inoremap ' ''<left>]]
vim.cmd[[inoremap ( ()<left>]]
vim.cmd[[inoremap [ []<left>]]
vim.cmd[[inoremap { {}<left>]]

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
