require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "x",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
	},
})
