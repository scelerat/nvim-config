return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    "projekt0n/github-nvim-theme",
    "shaunsingh/solarized.nvim",
    "folke/tokyonight.nvim",
    "shaunsingh/nord.nvim",
    "rebelot/kanagawa.nvim",
    "ishan9299/nvim-solarized-lua",
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
