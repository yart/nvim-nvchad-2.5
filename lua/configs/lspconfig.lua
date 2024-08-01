local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- lspconfig.harper_ls.setup {
--   settings = {
--     ["harper-ls"] = {
--         diagnosticSeverity = "information" -- Can be "hint", "information", "warning", or "error"
--     }
--   },
-- }

-- ruby
lspconfig.solargraph.setup {
  filetypes = { "ruby" },
  on_attach = function(_, bufnr)
    local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { desc = "LSP go to definition", noremap = true, silent = true })
    buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { desc = "LSP show signature help", noremap = true, silent = true })
    buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "LSP show signature help", noremap = true, silent = true })
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "LSP show references list", noremap = true, silent = true })
  end,
  on_init = {
    diagnostics = true,
  },
}
