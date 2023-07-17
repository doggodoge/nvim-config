vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true


vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('plugins')

require('mason').setup()

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd[[colorscheme gruvbox]]

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "vim", "typescript", "vimdoc", "javascript", "json" },
  sync_install = false,
  ignore_install = { "lua" },
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}

