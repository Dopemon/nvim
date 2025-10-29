require ("config.lazy")
require("telescope") --.load_extension('harpoon')

require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<M-j", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k", "<cmd>cprev<CR>")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-term-open', {clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,

})

vim.keymap.set("n", "<space>st", function ()	
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0,15)

	job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space>nes", function ()
	vim.fn.chansend(job_id, { "npx expo start\r\n" })
end)
