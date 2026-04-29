return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
        { mode = "n", "<leader>t", "<cmd>Neotree toggle<CR>", {} },
        { mode = "n", "<C-m>", "<cmd>Neotree reveal<CR>", {} },
    },
  }
}

