local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.g.mapleader = " "

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }

    use {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()

            vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
            vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
            vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
            vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')
            vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')
        end
    }

    use { 
        'ziglang/zig.vim',
        ft = {"zig"},
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.zls.setup {}
        end
    }
    use { 
        'NeogitOrg/neogit', 
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('neogit').setup()
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                  add          = { text = '│' },
                  change       = { text = '│' },
                  delete       = { text = '_' },
                  topdelete    = { text = '‾' },
                  changedelete = { text = '~' },
                  untracked    = { text = '┆' },
                },
                signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                  follow_files = true
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                  virt_text = true,
                  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                  delay = 1000,
                  ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                  -- Options passed to nvim_open_win
                  border = 'single',
                  style = 'minimal',
                  relative = 'cursor',
                  row = 0,
                  col = 1
                },
                yadm = {
                  enable = false
                },
            })
        end,
    }
    use { 'h-hg/fcitx.nvim' }

    use { 
        'catppuccin/nvim', 
        as = 'catppuccin', 
        config = function() vim.cmd.colorscheme "catppuccin" end ,
    }
    use { 
        "bluz71/vim-moonfly-colors",
        as = "moonfly",
        -- config = function() vim.cmd.colorscheme "moonfly" end,
    }

    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require("mason").setup()
        end
    }

    use {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    }


	use ({
        'ray-x/go.nvim',
        config = function()
            require("mason-lspconfig").setup()
            local cap = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

            vim.cmd("autocmd FileType go nmap <Leader>lf :GoLint<CR>")
            vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()<CR>")
            vim.cmd("autocmd FileType go nmap <Leader>tf :GoTestFunc<CR>")
            vim.cmd("autocmd FileType go nmap <Leader>lr :GoRename<CR>")
            vim.cmd("autocmd FileType go nmap <Leader>ls :LspStart<CR>")

            local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimport()
                end,
                group = format_sync_grp,
            })


            require("go").setup({
                goimport = 'gopls',
                lsp_cfg = true,
                -- {
                --   handlers = {
                --     ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'double' }),
                --     ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'round' }),
                --   },
                -- }, -- false: do nothing
                run_in_floaterm = true,
                capabilities = cap,
                goimport = 'gopls', -- if set to 'gopls' will use golsp format
                gofmt = 'gofumpt', -- if set to gopls will use golsp format
                max_line_len = 120,
                lsp_document_formatting = true,
                luasnip = true,
            })
            cfg = require("go.lsp").config()
            require("lspconfig").gopls.setup(cfg)
        end,
        requires = {
          'mfussenegger/nvim-dap', -- Debug Adapter Protocol
          'rcarriga/nvim-dap-ui',
          'theHamsta/nvim-dap-virtual-text',
          'ray-x/guihua.lua',
        },
        ft = { 'go', 'gomod' },
        cmd = {
            'GoModInit',
        },
    })

    use {
    	"windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
	use 'ray-x/guihua.lua'
	use 'neovim/nvim-lspconfig'
	use {
        'nvim-treesitter/nvim-treesitter', 
    }

    use({
    	"L3MON4D3/LuaSnip",
    	-- follow latest release.
    	tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    	-- install jsregexp (optional!:).
    	run = "make install_jsregexp"
    })

    -- auto complete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip' 
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil 
            end
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' },
                }, {
                    { name = 'buffer' }
                })
            })

            cmp.setup.cmdline({'/' , '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
            cmp.setup({
                snippet = { 
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end},
                mapping = cmp.mapping.preset.insert({ 
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4), 
                    ['<C-e>'] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping({
                             i = function(fallback)
                               if cmp.visible() and cmp.get_selected_entry() then
                                 cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                               else
                                 fallback()
                               end
                             end,
                             s = cmp.mapping.confirm({ select = true }),
                             c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }), 
                    ["<Tab>"] = cmp.mapping(function(fallback)
                                 -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                                if cmp.visible() then
                                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                                    return
                                end
                                if luasnip.expand_or_jumpable() then
                                    luasnip.expand_or_jump()
                                    return
                                end
                                if has_words_before() then
                                    cmp.complete()
                                    return
                                end
                                fallback()
                               end, {"i","s","c",}),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                            return
                        end
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                          else
                            fallback()
                          end
                        end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                      { name = 'nvim_lsp' },
                      -- { name = 'vsnip' }, -- For vsnip users.
                      { name = 'luasnip' }, -- For luasnip users.
                      -- { name = 'ultisnips' }, -- For ultisnips users.
                      -- { name = 'snippy' }, -- For snippy users.
                    }, {
                      { name = 'buffer' },
                    })
            })
        end
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
