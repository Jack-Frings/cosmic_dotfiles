vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.clipboard = 'unnamedplus'
vim.o.winborder = 'rounded'

-- Keybinds
vim.g.mapleader = " "

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>!', ':quit!<CR>')
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>s', ':e #<CR>')
vim.keymap.set('n', '<leader>v', ':vsplit #<CR>')
vim.keymap.set('n', '<leader>m', ':MarkdownPreview<CR>')
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Plugins 
vim.pack.add({ { src = 'https://github.com/neanias/everforest-nvim' },
			   { src = 'https://github.com/stevearc/oil.nvim' },
			   { src = 'https://github.com/nvim-mini/mini.pick' },
			   { src = 'https://github.com/neovim/nvim-lspconfig' },
			   { src = 'https://github.com/mason-org/mason.nvim' },
			   { src = 'https://github.com/windwp/nvim-autopairs' },
			   { src = 'https://github.com/iamcco/markdown-preview.nvim' },
			   { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
		     })
-- vim.cmd("packadd nvim-treesitter")

require 'mason'.setup()
require "mini.pick".setup()
require "oil".setup()
require "nvim-autopairs".setup()

-- Colorscheme 
vim.cmd.colorscheme('everforest')
vim.cmd(":hi statusline guibg=NONE")
-- Search Tool 
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
-- File Explorer 
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
-- LSP 
vim.lsp.enable('pyright')

require'nvim-treesitter.config'.setup {
  highlight = { enable = true },
}
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.py"},
  callback = function()
    vim.treesitter.start()
  end,
})
