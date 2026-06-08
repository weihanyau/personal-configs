vim.pack.add({ "https://github.com/sindrets/diffview.nvim" })

vim.keymap.set("n", "<leader>dv", function()
	if next(require("diffview.lib").views) == nil then
		vim.cmd("DiffviewOpen")
	else
		vim.cmd("DiffviewClose")
	end
end)

vim.keymap.set("n", "<leader>dt", "<cmd>DiffviewToggleFiles<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewOpen origin/main...HEAD<cr>")

vim.opt.diffopt = {
	"internal",
	"filler",
	"closeoff",
	"context:12",
	"algorithm:histogram",
	"linematch:200",
	"indent-heuristic",
	"iwhite",
}
