return {
	--     pcall(require('telescope').load_extension, 'fzf')
	--     pcall(require('telescope').load_extension, 'ui-select')
	--
	--     local builtin = require 'telescope.builtin'
	--     vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	--     vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
	--     vim.keymap.set('n', '<leader><leader>', function()
	--       require('telescope.builtin').find_files { hidden = true }
	--     end, { desc = '[S]earch [F]iles (hidden included)' })
	--     vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
	--     vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	--     vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	--     vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	--     vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	--     vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	--     vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = '[ ] Find existing buffers' })
	--
	--     -- Slightly advanced example of overriding default behavior and theme
	--     vim.keymap.set('n', '<leader>sb', function()
	--       -- You can pass additional configuration to telescope to change theme, layout, etc.
	--       builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	--         winblend = 10,
	--         previewer = false,
	--       })
	--     end, { desc = '[/] Fuzzily search in current buffer' })
	--
	--     vim.keymap.set('n', '<leader>s/', function()
	--       builtin.live_grep {
	--         grep_open_files = true,
	--         prompt_title = 'Live Grep in Open Files',
	--       }
	--     end, { desc = '[S]earch [/] in Open Files' })
	--
	--     vim.keymap.set('n', '<leader>snn', function()
	--       builtin.find_files { cwd = vim.fn.stdpath 'config' }
	--     end, { desc = '[S]earch [N]eovim files' })
	--   end,
	-- },
	--

	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				{
					"nvim-telescope/telescope-live-grep-args.nvim",
					version = "^1.0.0",
				},
			},
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				git_worktrees = vim.g.git_worktrees,
				file_ignore_patterns = {
					"node_modules",
				},
				prompt_prefix = "  ",
				selection_caret = " ",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = { ["q"] = actions.close },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("catppuccin").setup({})
		local cat = require("catppuccin.palettes").get_palette()
		local TelescopeColor = {
			TelescopeMatching = { fg = cat.flamingo },
			TelescopeSelection = { fg = cat.text, bg = cat.surface0, bold = true },

			TelescopePromptPrefix = { bg = cat.surface0 },
			TelescopePromptNormal = { bg = cat.surface0 },
			TelescopeResultsNormal = { bg = cat.mantle },
			TelescopePreviewNormal = { bg = cat.mantle },
			TelescopePromptBorder = { bg = cat.surface0, fg = cat.surface0 },
			TelescopeResultsBorder = { bg = cat.mantle, fg = cat.mantle },
			TelescopePreviewBorder = { bg = cat.mantle, fg = cat.mantle },
			TelescopePromptTitle = { bg = cat.pink, fg = cat.mantle },
			TelescopeResultsTitle = { fg = cat.mantle },
			TelescopePreviewTitle = { bg = cat.green, fg = cat.mantle },
		}

		for hl, col in pairs(TelescopeColor) do
			vim.api.nvim_set_hl(0, hl, col)
		end

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- Slightly advanced example of overriding default behavior and theme
		--		vim.keymap.set("n", "<leader>/", function()
		-- You can pass additional configuration to Telescope to change the theme, layout, etc.
		--			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		--				winblend = 10,
		--				previewer = false,
		--			}))
		--		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
