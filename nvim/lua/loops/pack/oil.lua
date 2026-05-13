vim.pack.add({
    { src = "https://www.github.com/stevearc/oil.nvim" }
})

require("oil").setup({
    view_options = {
        show_hidden = true
    },
    keymaps = {
        ['<C-c>'] = "<Nop>",
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ['<C-v>'] = { "actions.select", opts = { vertical = true } },
        ['<C-h>'] = false
    }
})
