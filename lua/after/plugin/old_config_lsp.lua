local lsp = require("lsp-zero").preset({})


lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)
lsp.setup()


require("lspconfig").gopls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").denols.setup({})
require("lspconfig").vuels.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").pylsp.setup({})
require("lspconfig").rust_analyzer.setup({})
