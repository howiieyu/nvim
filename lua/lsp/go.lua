vim.lsp.config.gopls = {
	name = 'gopls',
	cmd = { 'gopls' },
	filetypes = { 'go' },
	root_markers = { "go.mod", "go.work" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		}
	},
	on_attach = function(client, bufnr)
		-- swap quickly between go file and test file
		vim.keymap.set({ "n" }, "<leader>`",
			[[:execute (expand('%') =~# '_test\.go$' ? 'edit ' . substitute(expand('%'), '_test\.go$', '.go', '') : 'edit ' . substitute(expand('%'), '\.go$', '_test.go', ''))<CR>]])
		local function is_buf_visible(bufnr)
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				if vim.api.nvim_win_get_buf(win) == bufnr then
					return true
				end
			end
			return false
		end

		-- local tobuf = function(bufnr)
		-- 	return function()
		-- 		local win = vim.api.nvim_get_current_win()
		-- 		local cursor = vim.api.nvim_win_get_cursor(win)
		-- 		-- yank test name
		-- 		vim.cmd("normal! [[")
		-- 		vim.fn.feedkeys(vim.api.nvim_replace_termcodes('fT"tyiw', true, false, true), 'n')

		-- 		-- get dir of file
		-- 		local dir = vim.fn.expand("%:p:h")
		-- 		local test = vim.fn.getreg("t")

		-- 		-- run and capture output
		-- 		local out = vim.fn.execute("!go test " .. dir .. " -v -run=" .. test)

		-- 		-- open split and put output
		-- 		vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(out, "\n"))
		-- 		-- 只第一次打开窗口
		-- 		if not is_buf_visible(bufnr) then
		-- 			vim.cmd("vsplit")
		-- 			vim.api.nvim_win_set_buf(0, bufnr)
		-- 		end
		-- 		-- 恢复光标位置
		-- 		if vim.api.nvim_win_is_valid(win) then
		-- 			vim.api.nvim_set_current_win(win)
		-- 			pcall(vim.api.nvim_win_set_cursor, win, cursor)
		-- 		end
		-- 	end
		-- end
		-- local out_buf = vim.api.nvim_create_buf(false, true)
		-- vim.keymap.set({ "n" }, "<leader>tt", tobuf(out_buf), { noremap = true, silent = true })
	end
}
vim.lsp.enable("gopls")

local default = vim.lsp.handlers["window/showMessage"]

vim.lsp.handlers["window/showMessage"] = function(err, result, ctx, config)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	if not client then return end

	if client.name ~= "gopls" then
		default(err, result, ctx, config)
	end
	vim.notify("来自 gopls: " .. result.message)
end
