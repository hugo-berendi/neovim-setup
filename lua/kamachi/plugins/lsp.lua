local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed {
		'pylsp',
		'texlab',
		'sumneko_lua'
}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings {
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete()
}

lsp.set_preferences {
		sign_icons = { }
}

lsp.setup_nvim_cmp {
		mapping = cmp_mappings
}

lsp.on_attach(function(client, bufnr)
		local opts = {buffer = bufnr, remap = false}
		function map(mode, shortcut, func, opts)
				vim.keymap.set(mode, shortcut, func, opts)
		end
		local buf = vim.lsp.buf
		local dia = vim.diagnostic

		map('n', 'gd', function() buf.defenition() end, opts)
		map('n', 'K', function() buf.hover() end, opts)
		map('n', '<leader>vws', function() buf.workspace_symbol() end, opts)
		map('n', '<leader>vd', function() dia.open_float() end, opts)
		map('n', '[d', function() dia.goto_next() end, opts)
		map('n', ']d', function() dia.goto_prev() end, opts)
		map('n', '<leader>vca', function() buf.code_action() end, opts)
		map('n', '<leader>vrr', function() buf.references() end, opts)
		map('n', '<leader>vrn', function() buf.rename() end, opts)
		map('n', '<C-h>', function() buf.signature_help() end, opts)
end)

lsp.setup()
