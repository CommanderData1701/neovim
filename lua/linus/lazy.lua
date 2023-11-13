local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local setup, lazy = pcall(require, "lazy")

if not setup then
    print("Did not load lazy.")
    return
end

lazy.setup({
    {"nvim-lua/plenary.nvim"},

    --  Colorscheme
    {
        "morhetz/gruvbox",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },

    --  Toggleterm (Built in Terminal)
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    --  Tmux-Navigator (Navigate through splits with ctrl)
    {'christoomey/vim-tmux-navigator'},

    --  Vim Maximizer (Maximize splits.)
    {'szw/vim-maximizer'},

    --  Soround (For sorounding movements with characters)
    {"tpope/vim-surround"},

    -- Replace with register (Replace given text with register)
    {"vim-scripts/ReplaceWithRegister"},

    --  Nvim Tree
    {"nvim-tree/nvim-tree.lua"},

    --  LuaLine
    {"nvim-lualine/lualine.nvim"},

    --  Dressing (For extra functionality of the input and select function
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },

    --  Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
        },
    },

    --  Autocompletion
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"L3MON4D3/LuaSnip"},
    {"saadparwaiz1/cmp_luasnip"},
    {"rafamadriz/friendly-snippets"},

    --  Managing LSP
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    --  Configure LSP
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"nvimdev/lspsaga.nvim"},
    {"onsails/lspkind.nvim"},
})

