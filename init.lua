-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
-- -- never ever folding
-- vim.opt.foldenable = false
-- vim.opt.foldmethod = 'manual'
-- vim.opt.foldlevelstart = 99
-- -- very basic "continue indent" mode (autoindent) is always on in neovim
-- -- could try smartindent/cindent, but meh.
-- -- vim.opt.cindent = true
-- -- XXX
-- -- vim.opt.cmdheight = 2
-- -- vim.opt.completeopt = 'menuone,noinsert,noselect'
-- -- not setting updatedtime because I use K to manually trigger hover effects
-- -- and lowering it also changes how frequently files are written to swap.
-- -- vim.opt.updatetime = 300
-- -- if key combos seem to be "lagging"
-- -- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- -- vim.opt.timeoutlen = 300
-- -- keep more context on screen while scrolling
-- vim.opt.scrolloff = 2
-- -- never show me line breaks if they're not there
-- vim.opt.wrap = false
-- -- always draw sign column. prevents buffer moving when adding/deleting sign
-- vim.opt.signcolumn = 'yes'
-- sweet sweet relative line numbers
vim.opt.relativenumber = true
-- and show the absolute line number for the current line
vim.opt.number = true
-- -- keep current content top + left when splitting
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
-- --" Decent wildmenu
-- -- in completion, when there is more than one match,
-- -- list all matches, and only complete to longest common match
-- vim.opt.wildmode = 'list:longest'
-- -- when opening a file with a command (like :e),
-- -- don't suggest files like there:
-- vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- -- tabs: go big or go home
-- vim.opt.shiftwidth = 8
-- vim.opt.softtabstop = 8
-- vim.opt.tabstop = 8
-- vim.opt.expandtab = false
-- -- case-insensitive search/replace
-- vim.opt.ignorecase = true
-- -- unless uppercase in search term
-- vim.opt.smartcase = true
-- -- never ever make my terminal beep
-- vim.opt.vb = true
-- -- more useful diffs (nvim -d)
-- --- by ignoring whitespace
-- vim.opt.diffopt:append('iwhite')
-- --- and using a smarter algorithm
-- --- https://vimways.org/2018/the-power-of-diff/
-- --- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
-- --- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
-- vim.opt.diffopt:append('algorithm:histogram')
-- vim.opt.diffopt:append('indent-heuristic')
-- -- show a column at 80 characters as a guide for long lines
-- vim.opt.colorcolumn = '80'
-- --- except in Rust where the rule is 100 characters
-- vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- -- show more hidden characters
-- -- also, show tabs nicer
-- vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'
--
-- -------------------------------------------------------------------------------
-- --
-- -- hotkeys
-- --
-- -------------------------------------------------------------------------------
-- quick-open
vim.keymap.set('', '<C-p>', '<cmd>Files<cr>')
-- search buffers
vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- -- make missing : less annoying
-- vim.keymap.set('n', ';', ':')
-- -- Ctrl+j and Ctrl+k as Esc
-- vim.keymap.set('n', '<C-j>', '<Esc>')
-- vim.keymap.set('i', '<C-j>', '<Esc>')
-- vim.keymap.set('v', '<C-j>', '<Esc>')
-- vim.keymap.set('s', '<C-j>', '<Esc>')
-- vim.keymap.set('x', '<C-j>', '<Esc>')
-- vim.keymap.set('c', '<C-j>', '<Esc>')
-- vim.keymap.set('o', '<C-j>', '<Esc>')
-- vim.keymap.set('l', '<C-j>', '<Esc>')
-- vim.keymap.set('t', '<C-j>', '<Esc>')
-- -- Ctrl-j is a little awkward unfortunately:
-- -- https://github.com/neovim/neovim/issues/5916
-- -- So we also map Ctrl+k
-- vim.keymap.set('n', '<C-k>', '<Esc>')
-- vim.keymap.set('i', '<C-k>', '<Esc>')
-- vim.keymap.set('v', '<C-k>', '<Esc>')
-- vim.keymap.set('s', '<C-k>', '<Esc>')
-- vim.keymap.set('x', '<C-k>', '<Esc>')
-- vim.keymap.set('c', '<C-k>', '<Esc>')
-- vim.keymap.set('o', '<C-k>', '<Esc>')
-- vim.keymap.set('l', '<C-k>', '<Esc>')
-- vim.keymap.set('t', '<C-k>', '<Esc>')
-- Ctrl+h to stop searching
vim.keymap.set('v', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<cr>')
-- -- Jump to start and end of line using the home row keys
-- vim.keymap.set('', 'H', '^')
-- vim.keymap.set('', 'L', '$')
-- Neat X clipboard integration
-- <leader>p will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
-- vim.keymap.set('n', '<leader>p', '<cmd>read !wl-paste<cr>')
-- vim.keymap.set('n', '<leader>c', '<cmd>w !wl-copy<cr><cr>')
vim.keymap.set('', '<leader>p', '"+p')
vim.keymap.set('', '<leader>c', '"+y')
-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')
-- -- <leader>, shows/hides hidden characters
-- vim.keymap.set('n', '<leader>,', ':set invlist<cr>')
-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
-- -- open new file adjacent to current file
-- vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- no arrow keys --- force yourself to use the home row
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
-- -- make j and k move by visual line, not actual line, when text is soft-wrapped
-- vim.keymap.set('n', 'j', 'gj')
-- vim.keymap.set('n', 'k', 'gk')
-- -- handy keymap for replacing up to next _ (like in variable names)
-- vim.keymap.set('n', '<leader>m', 'ct_')
-- F1 is pretty close to Esc, so you probably meant Esc
vim.keymap.set('', '<F1>', '<Esc>')
vim.keymap.set('i', '<F1>', '<Esc>')

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
	}
)
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })
-- -- help filetype detection (add as needed)
-- --vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- -- correctly classify mutt buffers
-- local email = vim.api.nvim_create_augroup('email', { clear = true })
-- vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
-- 	pattern = '/tmp/mutt*',
-- 	group = email,
-- 	command = 'setfiletype mail',
-- })
-- -- also, produce "flowed text" wrapping
-- -- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
-- vim.api.nvim_create_autocmd('Filetype', {
--   pattern = 'mail',
--   group = email,
--   command = 'setlocal formatoptions+=w',
-- })
-- -- shorter columns in text because it reads better that way
-- local text = vim.api.nvim_create_augroup('text', { clear = true })
-- for _, pat in ipairs({'text', 'markdown', 'mail', 'gitcommit'}) do
-- 	vim.api.nvim_create_autocmd('Filetype', {
-- 		pattern = pat,
-- 		group = text,
-- 		command = 'setlocal spell tw=72 colorcolumn=73',
-- 	})
-- end
-- --- tex has so much syntax that a little wider is ok
-- vim.api.nvim_create_autocmd('Filetype', {
-- 	pattern = 'tex',
-- 	group = text,
-- 	command = 'setlocal spell tw=80 colorcolumn=81',
-- })
-- -- TODO: no autocomplete in text

-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
-- first, grab the manager
-- https://github.com/folke/lazy.nvim
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
-- then, setup!
---@type LazySpec[]
require("lazy").setup({
	-- Session management (like in vimrc)
	{
		'tpope/vim-obsession',
		lazy = false,
	},
	{
		'dhruvasagar/vim-prosession',
		lazy = false,
		dependencies = {
			'tpope/vim-obsession',
		},
		config = function()
			-- Create & use a 'default' session when no matching session is found
			vim.g.prosession_default_session = 1
			-- Set the directory where sessions are stored
			vim.g.prosession_dir = vim.fn.expand('~/.vim/session/')
		end,
	},
	-- main color scheme
	{
	  "RRethy/base16-nvim",   -- ← correct GitHub path
	  lazy     = false,
	  priority = 1000,
	  config   = function()
	    vim.cmd.colorscheme("base16-gruvbox-dark-hard")
	    vim.o.background = "dark"
	    vim.opt.termguicolors = true        -- 24-bit colours (needed in most terminals)
	  end,
	},
	-- nice bar at the bottom
	{
		'itchyny/lightline.vim',
		lazy = false, -- also load at start since it's UI
		config = function()
			-- no need to also show mode in cmd line when we have bar
			vim.o.showmode = false
			vim.g.lightline = {
				active = {
					left = {
						{ 'mode', 'paste' },
						{ 'readonly', 'filename', 'modified' }
					},
					right = {
						{ 'lineinfo' },
						{ 'percent' },
						{ 'fileencoding', 'filetype' }
					},
				},
				component_function = {
					filename = 'LightlineFilename'
				},
			}
			function LightlineFilenameInLua(opts)
				if vim.fn.expand('%:t') == '' then
					return '[No Name]'
				else
					return vim.fn.getreg('%')
				end
			end
			-- https://github.com/itchyny/lightline.vim/issues/657
			vim.api.nvim_exec(
				[[
				function! g:LightlineFilename()
					return v:lua.LightlineFilenameInLua()
				endfunction
				]],
				true
			)
		end
	},
	-- quick navigation
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings()
		end
	},
	-- better %
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
	-- auto-cd to root of git project
	-- 'airblade/vim-rooter'
	{
		'notjedi/nvim-rooter.lua',
		config = function()
			require('nvim-rooter').setup()
		end
	},
	-- fzf support for ^p
	{
		'junegunn/fzf.vim',
		dependencies = {
			{ 'junegunn/fzf', dir = '~/.fzf', build = './install --all' },
		},
		config = function()
			-- stop putting a giant window over my editor
			vim.g.fzf_layout = { down = '~20%' }
			-- when using :Files, pass the file list through
			--
			--   https://github.com/jonhoo/proximity-sort
			--
			-- to prefer files closer to the current file.
			function list_cmd()
				local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
				if base == '.' then
					-- if there is no current file,
					-- proximity-sort can't do its thing
					return 'fd --type file --follow'
				else
					return vim.fn.printf('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
				end
			end
			vim.api.nvim_create_user_command('Files', function(arg)
				vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--tiebreak=index' }, arg.bang)
			end, { bang = true, nargs = '?', complete = "dir" })
		end
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		config = function()
			-- Setup language servers.
			local lspconfig = require('lspconfig')

			-- Rust
			lspconfig.rust_analyzer.setup {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						imports = {
							group = {
								enable = false,
							},
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
					},
				},
			}

			-- Bash LSP
			local configs = require 'lspconfig.configs'
			if not configs.bash_lsp and vim.fn.executable('bash-language-server') == 1 then
				configs.bash_lsp = {
					default_config = {
						cmd = { 'bash-language-server', 'start' },
						filetypes = { 'sh' },
						root_dir = require('lspconfig').util.find_git_ancestor,
						init_options = {
							settings = {
								args = {}
							}
						}
					}
				}
			end
			if configs.bash_lsp then
				lspconfig.bash_lsp.setup {}
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

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
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<leader>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
					-- *and* there's some way to make it only apply to the current line.
					-- if client.server_capabilities.inlayHintProvider then
					--     vim.lsp.inlay_hint(ev.buf, true)
					-- end

					-- None of this semantics tokens business.
					-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end
	},
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
	-- Yazi file manager integration
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/snacks.nvim"
		},
		keys = {
			{
				"<leader>y",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				"<leader>Y",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<leader>yt",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "?",  -- Change to question mark which is more intuitive for help
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			-- vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	-- language support
	-- terraform
	{
		'hashivim/vim-terraform',
		ft = { "terraform" },
	},
	-- toml
	'cespare/vim-toml',
	-- yaml
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- rust
	{
		'rust-lang/rust.vim',
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
		end
	},
	-- markdown
	{
		'plasticboy/vim-markdown',
		ft = { "markdown" },
		dependencies = {
			'godlygeek/tabular',
		},
		config = function()
			-- never ever fold!
			vim.g.vim_markdown_folding_disabled = 1
			-- support front-matter in .md files
			vim.g.vim_markdown_frontmatter = 1
			-- 'o' on a list item should insert at same level
			vim.g.vim_markdown_new_list_item_indent = 0
			-- don't add bullets when wrapping:
			-- https://github.com/preservim/vim-markdown/issues/232
			vim.g.vim_markdown_auto_insert_bullets = 0
		end
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
		    provider = "vertex_claude",
		    vertex_claude = {
		      endpoint =
			"https://LOCATION-aiplatform.googleapis.com/v1/projects/PROJECT_ID/locations/LOCATION/publishers/anthropic/models",
		      model = "claude-3-7-sonnet@20250219",
		      timeout     = 30000,
		      temperature = 0,
		      max_tokens  = 4096,
		      -- api_key_name = "cmd:echo $VERTEX_TOKEN" -- uncomment if you don’t want to rely on gcloud ADC
		    },
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
})

-------------------------------------------------------------------------------
--
-- other stuff below
--
-------------------------------------------------------------------------------

-- Session management commands from vimrc
vim.api.nvim_create_user_command('Bonly', 
  'silent! execute "%bd|e#|bd#"', 
  { desc = 'Close all buffers except current one' }
)
vim.keymap.set('n', '<leader>bo', ':Bonly<cr>', { desc = 'Close all buffers except current one' })
