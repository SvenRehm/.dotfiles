-- return {
--   'folke/noice.nvim',
--   event = 'VeryLazy',
--   opts = {
--     views = {
--       cmdline_popup = {
--         border = {
--           style = 'none',
--           padding = { 1, 1 },
--         },
--         filter_options = {},
--         win_options = {
--           winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
--         },
--       },
--     },
--
--     lsp = {
--       override = {
--         ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
--         ['vim.lsp.util.stylize_markdown'] = true,
--         ['cmp.entry.get_documentation'] = true,
--       },
--       signature = {
--         enabled = false,
--         auto_open = {
--           enabled = true,
--           trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
--           luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
--           throttle = 50, -- Debounce lsp signature help request by 50ms
--         },
--         view = nil, -- when nil, use defaults from documentation
--         ---@type NoiceViewOptions
--         opts = {}, -- merged with defaults from documentation
--       },
--     },
--     routes = {
--       {
--         filter = {
--           event = 'msg_show',
--           any = {
--             { find = '%d+L, %d+B' },
--             { find = '; after #%d+' },
--             { find = '; before #%d+' },
--           },
--         },
--         view = 'mini',
--       },
--       --ignore lua lsp output
--       {
--         filter = {
--           event = 'lsp',
--           kind = 'progress',
--           cond = function(message)
--             local client = vim.tbl_get(message.opts, 'progress', 'client')
--             return client == 'lua_ls'
--           end,
--         },
--         opts = { skip = true },
--       },
--       {
--         filter = {
--           event = 'msg_show',
--           kind = '',
--           find = 'written',
--         },
--         opts = { skip = true },
--       },
--     },
--     presets = {
--       bottom_search = true,
--       command_palette = true,
--       long_message_to_split = true,
--     },
--   },
--   -- stylua: ignore
--   keys = {
--     { "<leader>sn", "", desc = "+noice"},
--     { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
--     { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
--     { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
--     { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
--     { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
--     { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
--     { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
--     { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
--   },
--   config = function(_, opts)
--     -- HACK: noice shows messages from before it was enabled,
--     -- but this is not ideal when Lazy is installing plugins,
--     -- so clear the messages in this case.
--     if vim.o.filetype == 'lazy' then
--       vim.cmd [[messages clear]]
--     end
--     require('noice').setup(opts)
--   end,
-- }
return {
	"folke/noice.nvim",
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		-- bottom_search = true, -- use a classic bottom cmdline for search
		-- bottom_search = false,
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
}
