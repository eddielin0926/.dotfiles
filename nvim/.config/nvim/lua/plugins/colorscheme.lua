return {
  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- add arctic
  {
    "rockyzhang24/arctic.nvim",
    branch = "v2",
    dependencies = { "rktjmp/lush.nvim" }
  },

  -- Configure LazyVim to load arctic
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "arctic",
    },
  }
}
