vim.opt.relativenumber=true
vim.opt.number = true
vim.opt.tabstop = 4

vim.pack.add({
    "https://github.com/numToStr/Navigator.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/Mofiqul/dracula.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("dracula").setup({ })

vim.cmd[[colorscheme dracula]]
vim.lsp.config.gopls = {
	name = 'gopls',
	cmd = { 'gopls' },
	filetypes = { 'go' },
	root_markers = { "go.mod", "go.work" },
}

vim.lsp.config['lua_ls'] = {
	-- Command and arguments to start the server.
	cmd = { 'lua-language-server' },

	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },

	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		}
	}
}

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client == nil then
			return
		end
		if client:supports_method('textDocument/completion') then
		vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end)
			vim.keymap.set({ 'i', 's' }, '<Tab>', function()
				if vim.fn.pumvisible() then
					vim.api.nvim_feedkeys(
						vim.api.nvim_replace_termcodes('<C-n>', true, false, true), 'n', true)
				end
			end)
			vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
				if vim.fn.pumvisible() then
					vim.api.nvim_feedkeys(
						vim.api.nvim_replace_termcodes('<C-p>', true, false, true), 'n', true)
				end
			end)
		end

		vim.keymap.set({'n'}, 'grd', vim.lsp.buf.definition)
		vim.keymap.set({"n"}, "grD", vim.lsp.buf.declaration)
		vim.keymap.set({"n", 'v'}, "gr.",vim.lsp.buf.code_action)
	end
})
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	}
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("clangd")


require("Navigator").setup()

vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
