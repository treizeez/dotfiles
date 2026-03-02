return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	lazy = false,
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},

		formatters_by_ft = {
			-- Lua
			lua = { "stylua" },

			-- Python
			python = { "isort", "black" },

			-- JS / TS
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },

			-- Web / data
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			yml = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },

			-- Rust
			rust = { "rustfmt" },
		},
	},

	config = function(_, opts)
		require("conform").setup(opts)

		-- Manual format keybind
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({
				async = true,
				lsp_fallback = true,
			})
		end, { desc = "Format buffer" })
	end,
}
