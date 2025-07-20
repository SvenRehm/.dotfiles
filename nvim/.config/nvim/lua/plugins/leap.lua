return {
	"ggandor/leap.nvim",
	config = function()
		vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#4f4f4f" })
		vim.api.nvim_set_hl(0, "LeapMatch", {
			fg = "white",
			bold = true,
			nocombine = true,
		})

		vim.keymap.set("n", "s", "<Plug>(leap)")
		vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
		vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
		vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
		require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
		require("leap").opts.special_keys.prev_target = "<backspace>"
		require("leap").opts.special_keys.prev_group = "<backspace>"
	end,
}
