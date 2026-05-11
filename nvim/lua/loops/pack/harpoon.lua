vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
})

local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

harpoon:extend({
    UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-c>", function()
            harpoon.ui:close_menu()
        end, { buffer = cx.bufnr, silent = true })
    end,
})

harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
