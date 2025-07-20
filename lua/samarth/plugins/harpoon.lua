return {
	'ThePrimeagen/harpoon',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('harpoon').setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		})

		local harpoon = require('harpoon')
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = 'Harpoon: Add file' })
		vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu, { desc = 'Harpoon: Toggle menu' })
		vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end, { desc = 'Harpoon: Navigate to file 1' })
		vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end, { desc = 'Harpoon: Navigate to file 2' })
		vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end, { desc = 'Harpoon: Navigate to file 3' })
		vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end, { desc = 'Harpoon: Navigate to file 4' })
	end,
}
