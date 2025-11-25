---@param dispatchers vim.lsp.rpc.Dispatchers
---@param config vim.lsp.ClientConfig
---@return vim.lsp.rpc.PublicClient
local function start_godot_lsp(dispatchers, config)
  local uv = vim.loop
  local random_port = math.random(60000, 65000)

  --------------------------------------------------------------------------
  -- 1. 启动 Godot headless LSP
  --------------------------------------------------------------------------
  local stdout, stderr = uv.new_pipe(false), uv.new_pipe(false)
  local handle

  local cmd = "godot"
  local args = { "-e", "--headless", "--path", config.root_dir, "--lsp-port", tostring(random_port) }

  handle, _ = uv.spawn(cmd, { args = args, stdio = { nil, stdout, stderr } }, function(code, signal)
    uv.close(handle)
    vim.schedule(function()
      vim.notify(string.format("Godot exited: code=%d signal=%d", code, signal), vim.log.levels.INFO)
    end)
  end)

  if not handle then
    error("Failed to start Godot process")
  end

  -- 输出日志到 buffer（可选）
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(buf, "godot-lsp-log://" .. config.root_dir)
  local function pipe_to_buf(pipe, prefix)
    pipe:read_start(function(err, data)
      if err then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(buf, -1, -1, false, { prefix .. " error: " .. err })
        end)
      elseif data then
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(buf, -1, -1, false, vim.split(prefix .. data, "\n"))
        end)
      end
    end)
  end
  pipe_to_buf(stdout, "[OUT] ")
  pipe_to_buf(stderr, "[ERR] ")

  --------------------------------------------------------------------------
  -- 2. 同步等待端口可连接（最多等待 10 秒）
  --------------------------------------------------------------------------
  local function port_ready(port)
    local tcp = uv.new_tcp()
	if not tcp then
		return false
	end
    local connected = false
    tcp:connect("127.0.0.1", port, function(err)
      if not err then
        connected = true
        tcp:close()
      end
    end)
    vim.wait(100, function() return connected end)  -- 给回调机会执行
    return connected
  end

  local ok = vim.wait(10000, function()
    return port_ready(random_port)
  end, 200, false)

  if not ok then
    error("Timed out waiting for Godot LSP port " .. random_port)
  end

  --------------------------------------------------------------------------
  -- 3. 成功后连接 LSP RPC
  --------------------------------------------------------------------------
  local client = vim.lsp.rpc.connect("127.0.0.1", random_port)(dispatchers)
  if not client then
    error("Failed to connect to Godot LSP server on port " .. random_port)
  end

  vim.notify("Godot LSP connected on port " .. random_port, vim.log.levels.INFO)
  return client
end

return start_godot_lsp

