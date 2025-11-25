local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

-- TODO: This doesn't handle `T.Run()` style tests, we will have to do that part later
local TestQuery = [[
(
 (function_declaration
   name: (identifier) @test_name
   parameters: (parameter_list
       (parameter_declaration
                name: (identifier)
                type: (pointer_type
                    (qualified_type
                     package: (package_identifier) @_param_package
                     name: (type_identifier) @_param_name))))
    ) @testfunc
 (#contains? @test_name "Test")
 (#match? @_param_package "testing")
 (#match? @_param_name "T")
)
]]

local function run_test(bufnr, test_names)
	local client = vim.lsp.get_clients({ bufnr = bufnr })[1]
	if not client then return end
	if type(test_names) == "string" then
		test_names = { test_names }
	end
	vim.schedule(function()
		client:exec_cmd({
				title = "Run testing...",
				command = "gopls.run_tests",
				arguments = { { URI = vim.uri_from_bufnr(0), Tests = test_names, JSONResults = true, } },
			},
			{ bufnr = bufnr }, function(err, result, context, config)
				-- if err then
				-- 	vim.notify("run test error: " .. vim.inspect(err),
				-- 		vim.log.levels.ERROR)
				-- end
				-- if result then
				-- 	vim.notify("run test result: " .. vim.inspect(result),
				-- 		vim.log.levels.INFO)
				-- end
				-- if context then
				-- 	vim.notify("run test context: " .. vim.inspect(context),
				-- 		vim.log.levels.INFO)
				-- end
				-- if config then
				-- 	vim.notify("run test config: " .. vim.inspect(config),
				-- 		vim.log.levels.INFO)
				-- end
			end
		)
	end)
end

M.run_file = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local tree = vim.treesitter.get_parser(bufnr, 'go'):parse()[1]
	local query = vim.treesitter.query.parse("go", TestQuery)

	local test_names = {}
	for id, node in query:iter_captures(tree:root(), bufnr, 0, -1) do
		local name = query.captures[id] -- name of the capture in the query
		if name == "test_name" then
			table.insert(test_names, vim.treesitter.get_node_text(node, bufnr))
		end
	end
	run_test(bufnr, test_names)
	-- local client = vim.lsp.get_clients({ bufnr = bufnr })[1]
	-- if not client then return end
	-- vim.schedule(function()
	-- 	client:exec_cmd({
	-- 		title = "Run testing...",
	-- 		command = "gopls.run_tests",
	-- 		arguments = { { URI = vim.uri_from_bufnr(0), Tests = test_names } },
	-- 	}, { bufnr = bufnr }, function(err, result, context, config)
	-- 		if err then
	-- 			vim.notify("run test error: " .. vim.inspect(err), vim.log.levels.ERROR)
	-- 			return
	-- 		end
	-- 		vim.notify("run test result: " .. vim.inspect(result), vim.log.levels.INFO)
	-- 	end)
	-- end)
end

M.list_tests = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local tree = vim.treesitter.get_parser(bufnr):parse()[1]
	local query = vim.treesitter.query.parse("go", TestQuery)

	local test_names = {}
	for id, node, metadata in query:iter_captures(tree:root(), bufnr, 0, -1) do
		local name = query.captures[id] -- name of the capture in the query
		if name == "test_name" then
			table.insert(test_names, vim.treesitter.get_node_text(node, bufnr))
		end
	end

	local title = "Possible Tests"
	pickers.new({}, {
		prompt_title = title,
		finder = finders.new_table {
			results = test_names,
			entry_maker = function(entry)
				return {
					value = entry,
					text = entry,
					display = entry,
					ordinal = entry,
				}
			end,
		},
		previewer = false,
		sorter = conf.generic_sorter {},
		attach_mappings = function(_)
			actions.select_default:replace(function(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				run_test(bufnr, selection.value)
				-- local client = vim.lsp.get_clients({ bufnr = bufnr })[1]
				-- if not client then return end
				-- vim.schedule(function()
				-- 	client:exec_cmd({
				-- 		title = "Run testing...",
				-- 		command = "gopls.run_tests",
				-- 		arguments = { { URI = vim.uri_from_bufnr(0), Tests = { selection.value } } },
				-- 	}, { bufnr = bufnr }, function(err, result, context, config)
				-- 		if err then
				-- 			vim.notify("run test error: " .. vim.inspect(err),
				-- 				vim.log.levels.ERROR)
				-- 		end
				-- 		if result then
				-- 			vim.notify("run test result: " .. vim.inspect(result),
				-- 				vim.log.levels.INFO)
				-- 		end
				-- 	end)
				-- end)

				actions.close(prompt_bufnr)
			end)
			return true
		end,
	}):find()
end

return M
