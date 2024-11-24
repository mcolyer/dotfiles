let mapleader=","

set cc=80
set nu

"Tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

lua << EOF
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
-- Plug('glepnir/lspsaga.nvim')

Plug('folke/trouble.nvim')
Plug('nvim-tree/nvim-web-devicons')

Plug('preservim/nerdtree')
Plug('jeetsukumaran/vim-buffergator')
Plug('vim-scripts/BufClose.vim')
Plug('lewis6991/gitsigns.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

Plug('sbdchd/neoformat')

-- Avante
-- Also needs plenary
Plug('stevearc/dressing.nvim')
Plug('MunifTanjim/nui.nvim')
Plug('zbirenbaum/copilot.lua')
Plug('yetone/avante.nvim', { ['branch'] = 'main', ['do'] = 'make' })

Plug('altercation/vim-colors-solarized')
vim.call('plug#end')

-- Copilot
require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<S-Tab>",
      accept_word = false,
      accept_line = false,
      next = "<C-]>",
      prev = "<C-[>",
      dismiss = "<Esc>",
    },
  },
  panel = { enabled = false },
})

require("avante_lib").load()
require("avante").setup()
vim.opt.laststatus = 3

-- Trouble
require("trouble").setup({})

-- Git signs
require('gitsigns').setup()

-- Setup language servers.
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
    end
}
local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
        },
        black = {
          enabled = true,
        },
        pycodestyle = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
      }
    },
  }
}

require('lspconfig').rubocop.setup({})

vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
  vim.lsp.buf.format { async = true }
  end, opts)
  end,
})

local keymap = vim.keymap.set


EOF

" Keybindings
nnoremap <C-t> <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap tt :TroubleToggle<CR>

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Gitgutter
set ut=200
"highlight GitGutterChange guifg=#bbbb00 ctermfg=3
"highlight! GitGutterAdd    guifg=#009900 ctermfg=2
"highlight GitGutterDelete guifg=#ff2222 ctermfg=1
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_removed_above_and_below = '{'
"let g:gitgutter_sign_modified_removed = 'ww'
let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_override_sign_column_highlight = 1

"Set airlinetheme
let g:airline_solarized_bg='dark'
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

"Neoformat
let g:neoformat_only_msg_on_error = 1

" Autosave
augroup fmt
   autocmd!
   autocmd BufWritePre * undojoin | Neoformat
augroup END

" Force the use of the black formatter
let g:neoformat_enabled_python = ['black']

" Disable yaml
let g:neoformat_enabled_yaml = []

" Enable alignment
let g:neoformat_basic_format_align = 0

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"Set theme
set bg=dark
colorscheme solarized

" Make the bar not grey
highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SignColumn LineNr
