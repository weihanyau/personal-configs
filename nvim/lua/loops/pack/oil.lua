vim.pack.add({
    { src = "https://www.github.com/stevearc/oil.nvim" }
})

require("oil").setup({
    view_options = {
        show_hidden = true
    },
    keymaps = {
        ['<C-c>'] = "<Nop>",
        ['<C-v>'] = { "actions.select", opts = { horizontal = true } },
        ['<C-h>'] = false
    }
})
