vim.opt.number = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.timeoutlen = 300

vim.opt.termguicolors = false

vim.opt.showtabline = 2

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	-- { src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/romgrk/barbar.nvim" },
	{ src = "https://github.com/ThePrimeagen/99" },
	{ src = "https://github.com/novrion/awb.nvim" },
})

require("tokyonight").setup()

require("nvim-tree").setup({})

local function toggle_or_focus_tree()
	local api = require("nvim-tree.api")
	if api.tree.is_visible() then
		api.tree.focus()
	else
		api.tree.toggle()
	end
end

vim.keymap.set('n', '<leader>f', toggle_or_focus_tree)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope live_grep<cr>')
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

vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require("99").setup({
	display_errors = false,
	model = "opencode/minimax-m2.5-free",
})

require("awb").setup({
	model = "gemini-3-flash-preview",
	api_key = "",
	keymaps = {
		ask = { "<leader>a", { "n", "v" }}
	}
})

vim.keymap.set({"n", "v"}, "<leader>a", function()
	require("awb").ask()
end)

vim.keymap.set("v", "<leader>9", function()
	require("99").visual()
end)

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", function()
	local buf = vim.api.nvim_get_current_buf()
	vim.cmd("tabclose")
	vim.cmd("bdelete " .. buf)
end)
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>")
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>")
