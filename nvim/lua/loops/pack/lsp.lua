vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = "https://github.com/saghen/blink.cmp",     version = vim.version.range("1.*") },
})

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

vim.lsp.enable({
    "emmylua_ls",
})

-- Completion
vim.o.completeopt = "fuzzy,menuone,noselect"
vim.o.complete = '.,w,b,kspell'

require("blink.cmp").setup({
    keymap = {
        preset = "none",
        ["<C-h>"] = { "show", "hide" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
        menu = {
            auto_show = true,
            -- draw = {
            --     components = {
            --         kind_icon = {
            --             text = function(ctx)
            --                 local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
            --                 return kind_icon
            --             end,
            --             -- (optional) use highlights from mini.icons
            --             highlight = function(ctx)
            --                 local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
            --                 return hl
            --             end,
            --         },
            --         kind = {
            --             -- (optional) use highlights from mini.icons
            --             highlight = function(ctx)
            --                 local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
            --                 return hl
            --             end,
            --         }
            --     }
            -- }
        }
    },
    sources = { default = { "lsp", "path", "buffer", "snippets" } },

    fuzzy = {
        implementation = "prefer_rust",
        prebuilt_binaries = { download = true },
    },
})

vim.lsp.config["*"] = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
}

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "oxfmt" },
        typescript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescriptreact = { "oxfmt" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
