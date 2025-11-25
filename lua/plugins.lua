
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- telescope 的依赖
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/numToStr/Navigator.nvim",
	"https://github.com/Mofiqul/dracula.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	{ src = "https://github.com/Saghen/blink.cmp",                version = "1.7.0", build = "cargo build --release" },
	"https://github.com/windwp/nvim-autopairs",
    -- enhanced
	"https://github.com/folke/noice.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/lewis6991/gitsigns.nvim", -- 添加 gitsigns.nvim
	"https://github.com/folke/which-key.nvim",
	"https://github.com/akinsho/bufferline.nvim", -- 添加 bufferline.nvim，用于缓冲区管理
	"https://github.com/akinsho/toggleterm.nvim", -- 添加 toggleterm.nvim 用于终端管理
})


require("noice").setup({
	lsp = {
		progress = {
			enabled = true,
			view = "mini",
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = true,
	},
})

require("which-key").setup({})

-- 为 leader 前缀注册描述
local wk = require("which-key")
wk.add({
	{ "<leader>e", group = "文件树" },
	{ "<leader>f", group = "查找" },
	{ "<leader>g", group = "Git" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>li", desc = "显示 LSP 客户端信息" },
	{ "<leader>q", group = "关闭/退出" },
	{ "<leader>t", desc = "切换终端" },
	{ "<leader>b", group = "缓冲区" },
	{ "<leader>bn", desc = "下一个缓冲区" },
	{ "<leader>bp", desc = "上一个缓冲区" },
	{ "<leader>bd", desc = "关闭当前缓冲区" },
})


vim.keymap.set("n", "]g", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.wo.cursorline = true
	require("gitsigns").next_hunk()
end, { desc = "下一个 Git hunk" })
vim.keymap.set("n", "[g", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.wo.cursorline = true
	require("gitsigns").prev_hunk()
end, { desc = "上一个 Git hunk" })
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "暂存当前修改块" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "回滚当前修改块" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "预览当前修改块" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "查看当前行归属" })
