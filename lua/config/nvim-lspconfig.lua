-- Load necessary modules
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Setup Mason
mason.setup({
    ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "pyright"
    }
})

-- Setup Mason-LSPConfig
-- mason_lspconfig.setup()

-- Common on_attach function for LSP
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

-- Common capabilities for LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()



-- set up LSP signs
for type, icon in pairs({
	Error = "E",
	Warn = "W",
	Hint = "H",
	Info = "I",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Setup LSP servers
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.arduino_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "arduino-language-server",
        "-cli-config", "C:/Users/PC/Desktop/PROJET_ELEC/sketch.yaml",
        "-fqbn", "arduino:sam:arduino_due_x_dbg",
    },
})


lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "clangd", "--background-index", "--clang-tidy" },
})

lspconfig.asm_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "asm", "s" },
})




lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- lspconfig.cmake.setup({
--     on_attach = on_attach,
--     capabilities = capabilities
-- })
-- lspconfig.terraform.setup({
--     on_attach = on_attach,
--     capabilities = capabilities
-- })


