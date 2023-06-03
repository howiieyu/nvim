-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/howieyu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/howieyu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/howieyu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/howieyu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/howieyu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\n>\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\15catppuccin\16colorscheme\bcmd\bvim\0" },
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fcitx.nvim"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/fcitx.nvim",
    url = "https://github.com/h-hg/fcitx.nvim"
  },
  ["go.nvim"] = {
    commands = { "GoFmt", "GoBuild", "GoAltV", "GoBreakToggle", "GoImpl", "GoRun", "GoInstall", "GoTest", "GoTestFunc", "GoTestCompile", "GoCoverage", "GoCoverageToggle", "GoGet", "GoModifyTags" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rgoimport\14go.format\frequireî\5\1\0\b\0\28\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\1\b\0015\3\t\0=\0\n\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\f\1B\1\1\0026\2\0\0'\4\r\0B\2\2\0029\2\14\0029\2\b\2\18\4\1\0B\2\2\0016\2\3\0009\2\15\2'\4\16\0B\2\2\0016\2\3\0009\2\15\2'\4\17\0B\2\2\0016\2\3\0009\2\15\2'\4\18\0B\2\2\0016\2\3\0009\2\19\0029\2\20\2'\4\21\0004\5\0\0B\2\3\0026\3\3\0009\3\19\0039\3\22\3'\5\23\0005\6\24\0003\a\25\0=\a\26\6=\2\27\6B\3\3\1K\0\1\0\ngroup\rcallback\0\1\0\1\fpattern\t*.go\16BufWritePre\24nvim_create_autocmd\rGoImport\24nvim_create_augroup\bapi8autocmd FileType go nmap <Leader>tf :GoTestFunc<CR>Mautocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()<CR>4autocmd FileType go nmap <Leader>lf :GoLint<CR>\bcmd\ngopls\14lspconfig\vconfig\vgo.lsp\17capabilities\1\0\b\14goimports\ngopls\17dap_debug_ui\2\14dap_debug\2\16lsp_gofumpt\2\flsp_cfg\1\rtest_dir\5\17max_line_len\3P\ngofmt\fgofumpt\nsetup\ago\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  moonfly = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/moonfly",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nî\1\0\0\b\0\t\2'6\0\0\0\14\0\0\0X\1\2€6\0\1\0009\0\0\0007\0\0\0006\0\0\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\2\0009\2\3\0029\2\5\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\6\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\a\2'\5\b\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\ntable\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\2À\tbody\15lsp_expand°\1\0\1\5\1\a\0\22-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\14€-\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\2\0015\3\5\0-\4\0\0009\4\3\0049\4\4\4=\4\6\3B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\23get_selected_entry\fvisibleû\1\0\1\5\3\t\0\"-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1K\0\1\0-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\a\1B\1\1\1K\0\1\0-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\b\1B\1\1\1K\0\1\0\18\1\0\0B\1\1\1K\0\1\0\1À\2À\0À\rcomplete\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1K\0\1\0-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\2À\tjump\rjumpable\21select_prev_item\fvisible‘\a\1\0\16\0007\0~3\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0029\3\4\0019\3\5\3'\5\6\0005\6\v\0009\a\a\0019\a\b\a4\t\3\0005\n\t\0>\n\1\t4\n\3\0005\v\n\0>\v\1\nB\a\3\2=\a\b\6B\3\3\0019\3\4\0019\3\f\0035\5\r\0005\6\16\0009\a\14\0019\a\15\a9\a\f\aB\a\1\2=\a\14\0064\a\3\0005\b\17\0>\b\1\a=\a\b\6B\3\3\0019\3\4\0019\3\f\3'\5\18\0005\6\19\0009\a\14\0019\a\15\a9\a\f\aB\a\1\2=\a\14\0069\a\a\0019\a\b\a4\t\3\0005\n\20\0>\n\1\t4\n\3\0005\v\21\0>\v\1\nB\a\3\2=\a\b\6B\3\3\0019\3\4\0015\5\25\0005\6\23\0003\a\22\0=\a\24\6=\6\26\0059\6\14\0019\6\15\0069\6\27\0065\b\29\0009\t\14\0019\t\28\t)\vüÿB\t\2\2=\t\30\b9\t\14\0019\t\28\t)\v\4\0B\t\2\2=\t\31\b9\t\14\0019\t \tB\t\1\2=\t!\b9\t\14\0015\v#\0003\f\"\0=\f$\v9\f\14\0019\f%\f5\14&\0B\f\2\2=\f'\v9\f\14\0019\f%\f5\14*\0009\15(\0019\15)\15=\15+\14B\f\2\2=\f,\vB\t\2\2=\t-\b9\t\14\0013\v.\0005\f/\0B\t\3\2=\t0\b9\t\14\0013\v1\0005\f2\0B\t\3\2=\t3\bB\6\2\2=\6\14\0059\6\a\0019\6\b\0064\b\3\0005\t4\0>\t\1\b5\t5\0>\t\2\b4\t\3\0005\n6\0>\n\1\tB\6\3\2=\6\b\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\4\0\0\6i\6s\6c\0\t<CR>\6c\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\6s\1\0\1\vselect\2\fconfirm\6i\1\0\0\0\n<C-e>\nabort\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\fsnippet\1\0\0\vexpand\1\0\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\fmapping\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\bgit\fsources\vconfig\14gitcommit\rfiletype\nsetup\fluasnip\bcmp\frequire\0\0" },
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/howieyu/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nî\1\0\0\b\0\t\2'6\0\0\0\14\0\0\0X\1\2€6\0\1\0009\0\0\0007\0\0\0006\0\0\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\2\0009\2\3\0029\2\5\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\6\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\a\2'\5\b\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\ntable\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\2À\tbody\15lsp_expand°\1\0\1\5\1\a\0\22-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\14€-\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\2\0015\3\5\0-\4\0\0009\4\3\0049\4\4\4=\4\6\3B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\23get_selected_entry\fvisibleû\1\0\1\5\3\t\0\"-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1K\0\1\0-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\a\1B\1\1\1K\0\1\0-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\b\1B\1\1\1K\0\1\0\18\1\0\0B\1\1\1K\0\1\0\1À\2À\0À\rcomplete\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1K\0\1\0-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\2À\tjump\rjumpable\21select_prev_item\fvisible‘\a\1\0\16\0007\0~3\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0029\3\4\0019\3\5\3'\5\6\0005\6\v\0009\a\a\0019\a\b\a4\t\3\0005\n\t\0>\n\1\t4\n\3\0005\v\n\0>\v\1\nB\a\3\2=\a\b\6B\3\3\0019\3\4\0019\3\f\0035\5\r\0005\6\16\0009\a\14\0019\a\15\a9\a\f\aB\a\1\2=\a\14\0064\a\3\0005\b\17\0>\b\1\a=\a\b\6B\3\3\0019\3\4\0019\3\f\3'\5\18\0005\6\19\0009\a\14\0019\a\15\a9\a\f\aB\a\1\2=\a\14\0069\a\a\0019\a\b\a4\t\3\0005\n\20\0>\n\1\t4\n\3\0005\v\21\0>\v\1\nB\a\3\2=\a\b\6B\3\3\0019\3\4\0015\5\25\0005\6\23\0003\a\22\0=\a\24\6=\6\26\0059\6\14\0019\6\15\0069\6\27\0065\b\29\0009\t\14\0019\t\28\t)\vüÿB\t\2\2=\t\30\b9\t\14\0019\t\28\t)\v\4\0B\t\2\2=\t\31\b9\t\14\0019\t \tB\t\1\2=\t!\b9\t\14\0015\v#\0003\f\"\0=\f$\v9\f\14\0019\f%\f5\14&\0B\f\2\2=\f'\v9\f\14\0019\f%\f5\14*\0009\15(\0019\15)\15=\15+\14B\f\2\2=\f,\vB\t\2\2=\t-\b9\t\14\0013\v.\0005\f/\0B\t\3\2=\t0\b9\t\14\0013\v1\0005\f2\0B\t\3\2=\t3\bB\6\2\2=\6\14\0059\6\a\0019\6\b\0064\b\3\0005\t4\0>\t\1\b5\t5\0>\t\2\b4\t\3\0005\n6\0>\n\1\tB\6\3\2=\6\b\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\4\0\0\6i\6s\6c\0\t<CR>\6c\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\6s\1\0\1\vselect\2\fconfirm\6i\1\0\0\0\n<C-e>\nabort\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\fsnippet\1\0\0\vexpand\1\0\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\fmapping\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\bgit\fsources\vconfig\14gitcommit\rfiletype\nsetup\fluasnip\bcmp\frequire\0\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\15catppuccin\16colorscheme\bcmd\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'GoTestCompile', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoTestCompile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoTestCompile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoCoverage', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoCoverage', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoCoverage ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoCoverageToggle', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoCoverageToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoCoverageToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoGet', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoGet', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoGet ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoModifyTags', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoModifyTags', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoModifyTags ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoFmt', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoFmt', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoFmt ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoBuild', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoBuild', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoBuild ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoAltV', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoAltV', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoAltV ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoBreakToggle', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoBreakToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoBreakToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoImpl', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoImpl', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoImpl ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoRun', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoRun', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoRun ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoInstall', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoInstall', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoInstall ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoTest', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoTest', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoTest ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoTestFunc', function(cmdargs)
          require('packer.load')({'go.nvim'}, { cmd = 'GoTestFunc', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'go.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoTestFunc ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/howieyu/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/filetype.vim]], true)
vim.cmd [[source /home/howieyu/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/filetype.vim]]
time([[Sourcing ftdetect script at: /home/howieyu/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/filetype.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
