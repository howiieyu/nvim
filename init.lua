require("options")

require("plugins")

require("dracula").setup({})
vim.cmd [[colorscheme dracula]]

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({ 'rust', 'go', 'lua', 'zig', 'gdscript' })
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'rust', 'go', 'lua', 'zig', 'gdscript' },
	callback = function() vim.treesitter.start() end,
})
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
require("treesitter-context").setup({
	max_lines = 3,
	multiline_threshold = 1,
	separator = '-',
	min_window_height = 20,
	line_numbers = true,
})



vim.lsp.config['zls'] = {
	cmd = { 'zls' },
	filetypes = { 'zig' },
	root_markers = { 'build.zig', '.git' },
}
vim.lsp.enable("zls")

vim.lsp.enable("turbo_ls")
vim.lsp.enable("stimulus_ls")


vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect', 'popup' }
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	}
})

vim.lsp.enable("clangd")



vim.lsp.config.gdscript = {
	cmd = require("godot"),
	root_markers = { "project.godot" },
	filetypes = { "gdscript" },
}

vim.lsp.enable("gdscript")


vim.api.nvim_create_autocmd('InsertEnter', {
	callback = function(args)
		require("nvim-autopairs").setup({})
	end
})



require("Navigator").setup()
vim.keymap.set({ 'n', 't' }, '<A-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<A-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<A-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<A-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({ 'n', 't' }, '<A-p>', '<CMD>NavigatorPrevious<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


vim.api.nvim_create_autocmd('FileType', {
	pattern = "go",
	callback = function(ev)
		-- print(string.format('event fired: %s', vim.inspect(ev)))
		local gt = require("gotest")
		vim.keymap.set("n", "<leader>tt", gt.run_file)
		vim.keymap.set("n", "<leader>tl", gt.list_tests)
	end
})

-- lua/config/telescope.lua
-- Telescope 插件配置

-- Telescope 配置
require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top", -- 将搜索框放在顶部
		},
	},
})

-- 设置 telescope 快捷键
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "查找文件" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "实时搜索" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "查找缓冲区" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "查找帮助标签" })

require("lsp.config")
require("completion")
