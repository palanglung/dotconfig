local M = {
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	opts = function(_, opts)
		opts.options.section_separators = {
			right = "",
			left = "",
		}
		return opts
	end,
}

return M
