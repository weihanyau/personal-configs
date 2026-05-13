vim.pack.add({
    { src = "https://www.github.com/christoomey/vim-tmux-navigator" }
})

vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<cr>")
