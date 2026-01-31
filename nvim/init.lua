vim.opt.number = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

-- may fix colors
vim.opt.termguicolors = false

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/novrion/awb.nvim" },
})

require "oil".setup()
require "tokyonight".setup()

vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>f', ':Yazi<CR>')
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')

vim.lsp.enable({
	"lua_ls",
	"clangd",
	"pylsp",
	"bashls",
	"rust_analyzer",
	"html",
	"cssls",
	"ts_ls",
	"jsonls"})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>da', '<cmd>lua vim.diagnostic.setqflist()<CR>', { noremap = true, silent = true })

vim.cmd("colorscheme tokyonight-night")
vim.cmd(":hi statusline guibg=NONE")

-- fix floating window borders
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require("awb").setup({
	model = "gemini-2.5-flash",
	api_key = "",
	keymaps = {
		ask = { "<leader>a", { "n", "v" } }
	}
})
