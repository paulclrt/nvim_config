require('packer').startup( function(use)
	use 'wbthomason/packer.nvim'  -- leave this line otherwise packer will delete itself





    -- colorshcemes 
	use 'navarasu/onedark.nvim'
    use 'tanvirtin/monokai.nvim'



    -- apperance plugins
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use ('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})


    -- navigation plugins
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.2',
  		requires = { {'nvim-lua/plenary.nvim'} },
        config = [[require('config.telescope')]],
	}
    use {
        'theprimeagen/harpoon',
         config = [[require('config.harpoon')]],
    }
    use 'christoomey/vim-tmux-navigator'


    use 'm4xshen/autoclose.nvim'





    -- editing plugins
	-- use {
 --        "kylechui/nvim-surround",
	--     tag = "*", -- Use for stability; omit to use `main` branch for the latest features
 --    	    config = function()
 --            require("nvim-surround").setup({
 --            	-- Configuration here, or leave empty to use defaults
 --            })
 --            end
	-- }
	use {
    	'numToStr/Comment.nvim',
    	config = function()
    		require('Comment').setup()
    	end
	}
	use 'mg979/vim-visual-multi'



    -- use "VonHeikemen/lsp-zero.nvim"

    



    -- auto completion
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- LSP
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}


end)



-- lualine
require('lualine').setup()

-- Color scheme: Onedark/monokai_pro
require("monokai").setup {}
require('onedark').load()

-- Mason:
require("mason").setup()


--autoclose:
require("autoclose").setup()
