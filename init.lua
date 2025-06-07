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
-- tabs: use same settings as vimrc
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
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
vim.keymap.set("", "<C-p>", "<cmd>Files<cr>")
-- search buffers
vim.keymap.set("n", "<leader>;", "<cmd>Buffers<cr>")
-- fuzzy search in files
vim.keymap.set("n", "<leader>s", "<cmd>FzfLua live_grep<cr>")
-- search exact word under cursor
vim.keymap.set("n", "<leader>rg", function()
	local word = vim.fn.expand("<cword>")
	if word ~= "" then
		-- Use ripgrep's word boundary flag for exact matches
		require("fzf-lua").live_grep({ 
			search = word,
			rg_opts = "--word-regexp"
		})
	else
		print("No word under cursor")
	end
end)
-- quick-save (formatting will happen automatically via BufWritePre autocmd)
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
-- save without formatting
vim.keymap.set("n", "<leader>W", "<cmd>noautocmd w<cr>")
-- save all without formatting
vim.keymap.set("n", "<leader>Wa", "<cmd>noautocmd wa<cr>")
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
vim.keymap.set("v", "<C-h>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<C-h>", "<cmd>nohlsearch<cr>")
-- -- Jump to start and end of line using the home row keys
-- vim.keymap.set('', 'H', '^')
-- vim.keymap.set('', 'L', '$')
-- Neat X clipboard integration
-- <leader>p will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
-- vim.keymap.set('n', '<leader>p', '<cmd>read !wl-paste<cr>')
-- vim.keymap.set('n', '<leader>c', '<cmd>w !wl-copy<cr><cr>')
vim.keymap.set("", "<leader>p", '"+p')
vim.keymap.set("", "<leader>c", '"+y')
-- <leader><leader> toggles between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")
-- -- <leader>, shows/hides hidden characters
-- vim.keymap.set('n', '<leader>,', ':set invlist<cr>')
-- always center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })
-- "very magic" (less escaping needed) regexes by default
-- vim.keymap.set('n', '?', '?\\v')
-- vim.keymap.set('n', '/', '/\\v')
-- vim.keymap.set('c', '%s/', '%sm/')
-- -- open new file adjacent to current file
-- vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- no arrow keys --- force yourself to use the home row
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")
-- -- make j and k move by visual line, not actual line, when text is soft-wrapped
-- vim.keymap.set('n', 'j', 'gj')
-- vim.keymap.set('n', 'k', 'gk')
-- -- handy keymap for replacing up to next _ (like in variable names)
-- vim.keymap.set('n', '<leader>m', 'ct_')
-- F1 is pretty close to Esc, so you probably meant Esc
vim.keymap.set("", "<F1>", "<Esc>")
vim.keymap.set("i", "<F1>", "<Esc>")
-- Move to hover window without cycling through all panes
vim.keymap.set("n", "<leader>h", function()
	-- Find and focus the hover window
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name == "" and vim.api.nvim_buf_get_option(buf, "buftype") == "nofile" then
			vim.api.nvim_set_current_win(win)
			return
		end
	end
	print("No hover window found")
end)

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	command = "silent! lua vim.highlight.on_yank({ timeout = 500 })",
})
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function(ev)
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			-- except for in git commit messages
			-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })
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
		"tpope/vim-obsession",
		lazy = false,
	},
	{
		"dhruvasagar/vim-prosession",
		lazy = false,
		dependencies = {
			"tpope/vim-obsession",
		},
		config = function()
			-- Create & use a 'default' session when no matching session is found
			vim.g.prosession_default_session = 1
			-- Set the directory where sessions are stored
			vim.g.prosession_dir = vim.fn.expand("~/.vim/session/")
		end,
	},
	-- main color scheme
	{
		"RRethy/base16-nvim", -- ← correct GitHub path
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("base16-gruvbox-dark-hard")
			vim.o.background = "dark"
			vim.opt.termguicolors = true -- 24-bit colours (needed in most terminals)
		end,
	},
	-- nice bar at the bottom
	{
		"itchyny/lightline.vim",
		lazy = false, -- also load at start since it's UI
		config = function()
			-- no need to also show mode in cmd line when we have bar
			vim.o.showmode = false
			vim.g.lightline = {
				active = {
					left = {
						{ "mode", "paste" },
						{ "readonly", "filename", "modified" },
					},
					right = {
						{ "lineinfo" },
						{ "percent" },
						{ "fileencoding", "filetype" },
					},
				},
				component_function = {
					filename = "LightlineFilename",
				},
			}
			function LightlineFilenameInLua(opts)
				if vim.fn.expand("%:t") == "" then
					return "[No Name]"
				else
					return vim.fn.getreg("%")
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
		end,
	},
	-- quick navigation
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	-- better %
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	-- auto-cd to root of git project
	-- 'airblade/vim-rooter'
	{
		"notjedi/nvim-rooter.lua",
		config = function()
			require("nvim-rooter").setup()
		end,
	},
	-- fzf-lua for fuzzy finding
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzf_lua = require("fzf-lua")
			fzf_lua.setup({
				winopts = {
					height = 0.40,
					width = 1.0,
					row = 1.0,
					border = "none",
				},
				fzf_opts = {
					["--layout"] = "reverse",
					["--info"] = "inline",
				},
				files = {
					-- Use fd as default, proximity-sort will be handled in the Files command
					cmd = "fd --type file --follow",
					fzf_opts = {
						["--tiebreak"] = "index",
					},
				},
			})

			-- Create Files command for compatibility
			vim.api.nvim_create_user_command("Files", function(opts)
				local function get_files_cmd()
					local base = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:.:S")
					-- Check if proximity-sort is available
					if base ~= "." and vim.fn.executable("proximity-sort") == 1 then
						return vim.fn.printf(
							"fd --type file --follow | proximity-sort %s",
							vim.fn.shellescape(vim.fn.expand("%"))
						)
					else
						return "fd --type file --follow"
					end
				end

				if opts.args and opts.args ~= "" then
					fzf_lua.files({
						cwd = opts.args,
						cmd = get_files_cmd(),
					})
				else
					fzf_lua.files({
						cmd = get_files_cmd(),
					})
				end
			end, { nargs = "?", complete = "dir" })

			-- Create Buffers command for compatibility
			vim.api.nvim_create_user_command("Buffers", function()
				fzf_lua.buffers()
			end, {})
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setup language servers.
			local lspconfig = require("lspconfig")

			-- Rust
			lspconfig.rust_analyzer.setup({
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
			})

			-- Bash LSP
			local configs = require("lspconfig.configs")
			if not configs.bash_lsp and vim.fn.executable("bash-language-server") == 1 then
				configs.bash_lsp = {
					default_config = {
						cmd = { "bash-language-server", "start" },
						filetypes = { "sh" },
						root_dir = require("lspconfig").util.find_git_ancestor,
						init_options = {
							settings = {
								args = {},
							},
						},
					},
				}
			end
			if configs.bash_lsp then
				lspconfig.bash_lsp.setup({})
			end

			-- TypeScript/JavaScript will be handled by typescript-tools.nvim plugin below

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			-- Additional mappings for compatibility with vimrc
			vim.keymap.set("n", "]E", vim.diagnostic.goto_next)
			vim.keymap.set("n", "[E", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- Enhanced hover functionality with better scrolling
					vim.keymap.set("n", "K", function()
						-- First try LSP hover
						local hover_available = false
						for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
							if client.server_capabilities.hoverProvider then
								hover_available = true
								break
							end
						end

						if hover_available then
							-- Configure hover window for better scrolling
							vim.lsp.buf.hover()
						else
							-- Fallback to default Vim help or show a message
							local word = vim.fn.expand("<cword>")
							print("LSP hover not available for: " .. word)
							-- Try Vim's built-in help as fallback
							pcall(vim.cmd, "help " .. word)
						end
					end, opts)

					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)

					-- Debug LSP info
					vim.keymap.set("n", "<leader>li", function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							print("No LSP clients attached to this buffer")
						else
							for _, client in pairs(clients) do
								print("LSP Client: " .. client.name)
								print(
									"  - Hover support: " .. tostring(client.server_capabilities.hoverProvider or false)
								)
								print(
									"  - Definition support: "
										.. tostring(client.server_capabilities.definitionProvider or false)
								)
							end
						end
					end, opts)
					--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					-- Formatting is handled by conform.nvim, not LSP directly

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
		end,
	},
	-- TypeScript/JavaScript enhanced LSP
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		config = function()
			require("typescript-tools").setup({
				-- Enhanced settings for better hover and functionality
				settings = {
					-- spawn additional tsserver instance to calculate diagnostics on it
					separate_diagnostic_server = true,
					-- "change"|"insert_leave" determine when the client asks the server about diagnostic
					publish_diagnostic_on = "insert_leave",
					-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
					-- "remove_unused_imports"|"organize_imports") -- or string "all"
					-- to include all supported code actions
					-- specify commands exposed as code_actions
					expose_as_code_action = {},
					-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
					-- not exists then standard path resolution strategy is applied
					tsserver_path = nil,
					-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
					-- (see 💅 `styled-components` support section)
					tsserver_plugins = {},
					-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
					-- memory limit in megabytes or "auto"(basically no limit)
					tsserver_max_memory = "auto",
					-- described below
					tsserver_format_options = {},
					tsserver_file_preferences = {
						-- Inlay hints
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
					-- locale of all tsserver messages, supported locales you can find here:
					-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
					tsserver_locale = "en",
					-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
					complete_function_calls = false,
					include_completions_with_insert_text = true,
					-- CodeLens
					-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
					-- possible values: ("off"|"all"|"implementations_only"|"references_only")
					code_lens = "off",
					-- by default code lenses are displayed on all referencable values and for some of you it can
					-- be too much this option reduce count of them by removing member references from lenses
					disable_member_code_lens = true,
					-- JSXCloseTag
					-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
					-- that maybe have a conflict if enable this feature. )
					jsx_close_tag = {
						enable = false,
						filetypes = { "javascriptreact", "typescriptreact" },
					},
				},
			})
		end,
	},
	-- Code formatting with prettier and other formatters
	-- NOTE: For best performance, install prettierd: npm install -g @fsouza/prettierd
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		config = function()
			require("conform").setup({
				-- Map of filetype to formatters (using faster alternatives where possible)
				formatters_by_ft = {
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					vue = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					scss = { "prettierd", "prettier", stop_after_first = true },
					less = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					jsonc = { "prettierd", "prettier", stop_after_first = true },
					yaml = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
					graphql = { "prettierd", "prettier", stop_after_first = true },
					handlebars = { "prettierd", "prettier", stop_after_first = true },
					-- Add other formatters as needed
					lua = { "stylua" },
					rust = { "rustfmt" },
					-- Use a sub-list to run multiple formatters
					-- python = { "isort", "black" },
				},
				-- Set up format-on-save
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 2000, lsp_fallback = true }
				end,
				-- Customize formatters
				formatters = {
					prettier = {
						-- You can customize the base config if you need to
						prepend_args = function(self, ctx)
							return { "--stdin-filepath", "$FILENAME" }
						end,
					},
				},
			})
		end,
	},
	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<C-j>", -- Same as vimrc: <C-J>
						accept_word = false,
						accept_line = false,
						next = "<C-]>", -- Same as vimrc: <C-]>
						prev = false, -- Don't map previous, would conflict with <Esc>
						dismiss = "<C-\\>", -- Different key to avoid conflicts
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- TAB cycling for completions (like vimrc)
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "path" },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
				}),
			})
		end,
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require("lsp_signature").setup({
				doc_lines = 0,
				handler_opts = {
					border = "none",
				},
			})
		end,
	},
	-- Yazi file manager integration
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/snacks.nvim",
			"ibhagwan/fzf-lua",
		},
		keys = {
			{
				"<leader>f",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				"<leader>E",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<leader>e",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "?", -- Change to question mark which is more intuitive for help
			},
			integrations = {
				grep_in_directory = function(directory)
					require("fzf-lua").live_grep({
						cwd = directory,
						prompt = "Grep in " .. vim.fn.fnamemodify(directory, ":t") .. "> ",
					})
				end,
				grep_in_selected_files = function(selected_files)
					require("fzf-lua").live_grep({
						file_ignore_patterns = {},
						fzf_opts = {
							["--query"] = "",
						},
						-- Convert file list to grep command
						cmd = "rg --column --line-number --no-heading --color=always --smart-case -- '' "
							.. table.concat(selected_files, " "),
					})
				end,
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			-- vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	-- Add vim-sleuth for automatic indentation detection
	{
		"tpope/vim-sleuth",
		lazy = false,
	},
	-- language support
	-- terraform
	{
		"hashivim/vim-terraform",
		ft = { "terraform" },
	},
	-- toml
	"cespare/vim-toml",
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
		"rust-lang/rust.vim",
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = "wl-copy"
		end,
	},
	-- markdown
	{
		"plasticboy/vim-markdown",
		ft = { "markdown" },
		dependencies = {
			"godlygeek/tabular",
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
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "vertex_claude",
			providers = {
				vertex_claude = {
					endpoint = "https://LOCATION-aiplatform.googleapis.com/v1/projects/PROJECT_ID/locations/LOCATION/publishers/anthropic/models",
					-- model = "claude-3-7-sonnet@20250219",
					model = "claude-sonnet-4@20250514",
					timeout = 30000,
					extra_request_body = {
						temperature = 0,
						max_tokens = 4096,
					},
					-- api_key_name = "cmd:echo $VERTEX_TOKEN" -- uncomment if you don’t want to rely on gcloud ADC
				},
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
				"MeanderingProgrammer/render-markdown.nvim",
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
vim.api.nvim_create_user_command(
	"Bonly",
	'silent! execute "%bd|e#|bd#"',
	{ desc = "Close all buffers except current one" }
)
vim.keymap.set("n", "<leader>bo", ":Bonly<cr>", { desc = "Close all buffers except current one" })

-- Commands for saving without formatting
vim.api.nvim_create_user_command("WriteAllNoFormat", "noautocmd wa", { desc = "Write all files without formatting" })
vim.api.nvim_create_user_command("ExitAllNoFormat", "noautocmd xa", { desc = "Write all files and exit without formatting" })
vim.api.nvim_create_user_command("QuitAllNoFormat", "noautocmd qa!", { desc = "Quit all without saving or formatting" })

-- Add sleuth for automatic indentation detection (like in vimrc)
-- This will help maintain consistent spacing across vim and neovim
