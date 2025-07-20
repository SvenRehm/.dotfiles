return {
	"numToStr/Comment.nvim",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>/", function()
			return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)"
				or "<Plug>(comment_toggle_linewise_count)"
		end, { expr = true, desc = "Toggle comment line(s)" })

		vim.keymap.set("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment line(s)" })
	end,
}
