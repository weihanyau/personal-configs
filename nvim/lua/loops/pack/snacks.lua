vim.pack.add({ { src = "https://www.github.com/folke/snacks.nvim" } })

local snacks = require("snacks")

snacks.setup({
	image = {
		enabled = true,
	},
})
