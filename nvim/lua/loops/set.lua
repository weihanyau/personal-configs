vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.opt_local.relativenumber = true
        vim.opt_local.number = true
    end,
})

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.autoread = true

local autoReadFileGroup = vim.api.nvim_create_augroup("AutoReadFile", {})
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    callback = function()
        if vim.o.autoread then
            vim.cmd("checktime")
        end
    end,
    group = autoReadFileGroup
})
