require("lsp.go")
require("lsp.lua")


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client == nil then
			return
		end

		vim.keymap.set({ 'n' }, 'gd', vim.lsp.buf.definition)
		vim.keymap.set({ "n" }, "gD", vim.lsp.buf.declaration)
		vim.keymap.set({ "n", 'v' }, "gr.", vim.lsp.buf.code_action)
		vim.keymap.set({ "n" }, "<leader>lf", vim.lsp.buf.format)
	end
})
