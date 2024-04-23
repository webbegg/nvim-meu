return {
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
		config = function()
			local opts = { noremap = true, silent = true, desc = "Delete buffer" }
			vim.keymap.set("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
			vim.keymap.set("n", "<C-q>", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
			vim.keymap.set("n", "<M-q>", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
		end,
	},
}
