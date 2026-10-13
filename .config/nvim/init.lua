vim.cmd.source(vim.fn.expand("~/.vimrc"))

vim.cmd('packadd vim-jetpack')

require('jetpack.packer').startup(function(use)
  use 'tani/vim-jetpack'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'windwp/nvim-autopairs'
  use 'nvim-treesitter/nvim-treesitter'
end)

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls",
    "vtsls",
    "svelte",
    "html",
    "cssls",
    "tailwindcss",
  },
})

vim.lsp.config('gopls', {})
vim.lsp.config('vtsls', {})
vim.lsp.config('svelte', {})
vim.lsp.config('html', {})
vim.lsp.config('cssls', {})
vim.lsp.config('tailwindcss', {})
vim.lsp.enable({ "gopls", "vtsls", "svelte", "html", "cssls", "tailwindcss" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local opts = { buffer = buf, noremap = true, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})

require("telescope").setup({})

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Diagnostics" })

require("nvim-autopairs").setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
})
