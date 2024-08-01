require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- In order to disable a default keymap, use
nomap("n", "<c-h>")
nomap("n", "<c-j>")
nomap("n", "<c-k>")
nomap("n", "<c-l>")
nomap("n", "<c-\\>")
nomap("n", "<leader>fb")

-- general
map("i", "jk", "<ESC>")
-- map("n", ";", ":", { desc = "Enter command mode", nowait = true })
map("n", "<c-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Jump to left pane" })
map("n", "<c-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Jump to bottom pane" })
map("n", "<c-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Jump to top pane" })
map("n", "<c-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Jump to right pane" })
map("n", "<c-\\>", "<cmd> TmuxNavigatePrevious <CR>", { desc = "Jump to the previous pane" })
map("n", "<leader>|", "<cmd> vsp <CR>", { desc = "Vertical split" })
map("n", "<leader>_", "<cmd> sp <CR>", { desc = "Horizontal split" })
map("n", "<c-q>", "<cmd> qa! <CR>", { desc = "Quit all forced" })
map("n", "<leader>QQ", "<cmd> qa <CR>", { desc = "Quit all" })
map("n", "<leader>QA", "<cmd> wqa <CR>", { desc = "Save and quit all" })
map("n", "<leader>X", "<cmd> w <bar> %bd <bar> e# <bar> bd# <CR>", { desc = "Close all buffers except current" })
map("n", "<leader>ra", '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = "LSP Rename", noremap = true, silent = true })

map("v", ">", ">gv", {desc = "indent" })

-- telescope
map("n", "<leader>fr", "<cmd> Telescope lsp_references <CR>", { desc = "Find LSP references" })
map("n", "<leader>fW", "<cmd> Telescope grep_string <CR>", { desc = "Find word under cursor" })
map("n", "<leader>B", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "<c-b>", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })

-- tabufline
map("n", "<c-PageDown>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move buffer right" })
map("n", "<c-PageUp>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move buffer left" })
