vim.pack.add{
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim'},
}

-- Initialize Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if client:supports_method('textDocument/completion') then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
    end,
})

vim.o.completeopt = "fuzzy,menuone,noselect"
vim.o.complete = '.,w,b,kspell'

vim.lsp.enable("emmylua_ls")
