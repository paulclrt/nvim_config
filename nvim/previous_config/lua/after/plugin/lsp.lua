local lspconfig = require("lspconfig")

-- Configuration commune pour tous les LSP
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- C, C++, et Arduino
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index", "--clang-tidy" },
})

lspconfig.arduino_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "arduino-language-server",
    "-cli-config", "/path/to/arduino-cli.yaml", -- Remplacez par le chemin vers votre configuration Arduino CLI
    "-fqbn", "arduino:avr:uno", -- Remplacez par votre carte Arduino
  },
})

-- ASM
lspconfig.asm_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "asm", "s" },
})












local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})

