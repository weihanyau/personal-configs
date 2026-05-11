vim.pack.add({
    { src = "https://www.github.com/jiaoshijie/undotree" }
})

vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
