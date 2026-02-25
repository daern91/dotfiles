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
vim.keymap.set("n", "<leader>t", "<cmd>Yeet<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>Yeet set<cr>")
-- search exact word under cursor
vim.keymap.set("n", "<leader>rg", function()
	local word = vim.fn.expand("<cword>")
	if word ~= "" then
		-- Use ripgrep's word boundary flag for exact matches
		require("fzf-lua").live_grep({
			search = word,
			rg_opts = "--word-regexp --line-number --column",
			silent = true,
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
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
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
			-- Setup language servers using new vim.lsp.config API (Nvim 0.11+)

			-- Rust
			vim.lsp.config("rust_analyzer", {
				-- Server-specific settings. See `:help lsp-config`
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
			if vim.fn.executable("bash-language-server") == 1 then
				vim.lsp.config("bashls", {
					cmd = { "bash-language-server", "start" },
					filetypes = { "sh" },
					root_markers = { ".git" },
				})
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
					vim.keymap.set("n", "gD", function()
						vim.cmd("rightbelow vsplit")
						vim.lsp.buf.definition()
						vim.cmd("normal! zz")
					end, opts)
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
						vim.cmd("normal! zz")
					end, opts)
					vim.keymap.set("n", "gy", function()
						vim.lsp.buf.type_definition()
						vim.cmd("normal! zz")
					end, opts)
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

					vim.keymap.set("n", "gi", function()
						vim.lsp.buf.implementation()
						vim.cmd("normal! zz")
					end, opts)
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
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", function()
						vim.lsp.buf.references()
						vim.cmd("normal! zz")
					end, opts)
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
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "js", "ts", "jsx", "tsx" },
		config = function()
			require("typescript-tools").setup({
				-- Enable for JavaScript and TypeScript files
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				-- Custom handlers for better rename functionality (at top level, not in settings)
				handlers = {
					-- Enhanced rename handler that saves all affected files
					["textDocument/rename"] = function(err, result, ctx, config)
						if err then
							vim.notify("Rename failed: " .. err.message, vim.log.levels.ERROR)
							return
						end

						if not result then
							vim.notify("Nothing to rename", vim.log.levels.INFO)
							return
						end

						-- Apply the workspace edit
						vim.lsp.util.apply_workspace_edit(result, "utf-8")

						-- Collect all URIs that were modified
						local modified_uris = {}

						-- Handle changes format (uri -> array of changes)
						if result.changes then
							for uri, _ in pairs(result.changes) do
								table.insert(modified_uris, uri)
							end
						end

						-- Handle documentChanges format (array of document changes)
						if result.documentChanges then
							for _, change in ipairs(result.documentChanges) do
								if change.textDocument and change.textDocument.uri then
									table.insert(modified_uris, change.textDocument.uri)
								end
							end
						end

						-- Save all modified buffers
						for _, uri in ipairs(modified_uris) do
							local bufnr = vim.uri_to_bufnr(uri)
							if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, "modified") then
								vim.api.nvim_buf_call(bufnr, function()
									vim.cmd("write")
								end)
							end
						end

						vim.notify("Rename completed and " .. #modified_uris .. " files saved", vim.log.levels.INFO)
					end,
				},
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
					expose_as_code_action = { "add_missing_imports", "remove_unused", "organize_imports" },
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
						-- Better completion and import handling
						includeCompletionsForModuleExports = true,
						includePackageJsonAutoImports = "auto",
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
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
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
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	-- Modern completion engine with TypeScript support
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		dependencies = {
			"rafamadriz/friendly-snippets", -- TypeScript and other snippets
			"L3MON4D3/LuaSnip", -- Snippet engine
		},
		version = "v0.*",
		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = true,
				},
			},
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			signature = {
				enabled = true,
			},
		},
	},
	-- Snippet engine (required for blink.cmp snippets)
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Custom console.log snippets
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node

			-- Add custom snippets after VSCode snippets are loaded
			vim.schedule(function()
				-- JavaScript/TypeScript logging snippets
				ls.add_snippets("javascript", {
					s("clo", {
						t("console.log("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clg", {
						t("console.log('"),
						i(1, "variable"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("cll", {
						t("console.log('%c "),
						i(1, "Debug"),
						t("', 'color: orange; font-weight: bold');"),
						i(0),
					}),
					s("cle", {
						t("console.error('"),
						i(1, "error"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clw", {
						t("console.warn('"),
						i(1, "warning"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clt", {
						t("console.table("),
						i(1),
						t(");"),
						i(0),
					}),
					s("cld", {
						t("console.dir("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clj", {
						t("console.log(JSON.stringify("),
						i(1),
						t(", null, 2));"),
						i(0),
					}),
				})

				-- Copy the same snippets for TypeScript
				ls.add_snippets("typescript", {
					s("clo", {
						t("console.log("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clg", {
						t("console.log('"),
						i(1, "variable"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("cll", {
						t("console.log('%c "),
						i(1, "Debug"),
						t("', 'color: orange; font-weight: bold');"),
						i(0),
					}),
					s("cle", {
						t("console.error('"),
						i(1, "error"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clw", {
						t("console.warn('"),
						i(1, "warning"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clt", {
						t("console.table("),
						i(1),
						t(");"),
						i(0),
					}),
					s("cld", {
						t("console.dir("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clj", {
						t("console.log(JSON.stringify("),
						i(1),
						t(", null, 2));"),
						i(0),
					}),
				})

				-- Copy the same snippets for React (JSX/TSX)
				ls.add_snippets("javascriptreact", {
					s("clo", {
						t("console.log("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clg", {
						t("console.log('"),
						i(1, "variable"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("cll", {
						t("console.log('%c "),
						i(1, "Debug"),
						t("', 'color: orange; font-weight: bold');"),
						i(0),
					}),
					s("cle", {
						t("console.error('"),
						i(1, "error"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clw", {
						t("console.warn('"),
						i(1, "warning"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clt", {
						t("console.table("),
						i(1),
						t(");"),
						i(0),
					}),
					s("cld", {
						t("console.dir("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clj", {
						t("console.log(JSON.stringify("),
						i(1),
						t(", null, 2));"),
						i(0),
					}),
				})

				ls.add_snippets("typescriptreact", {
					s("clo", {
						t("console.log("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clg", {
						t("console.log('"),
						i(1, "variable"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("cll", {
						t("console.log('%c "),
						i(1, "Debug"),
						t("', 'color: orange; font-weight: bold');"),
						i(0),
					}),
					s("cle", {
						t("console.error('"),
						i(1, "error"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clw", {
						t("console.warn('"),
						i(1, "warning"),
						t(":', "),
						i(2),
						t(");"),
						i(0),
					}),
					s("clt", {
						t("console.table("),
						i(1),
						t(");"),
						i(0),
					}),
					s("cld", {
						t("console.dir("),
						i(1),
						t(");"),
						i(0),
					}),
					s("clj", {
						t("console.log(JSON.stringify("),
						i(1),
						t(", null, 2));"),
						i(0),
					}),
				})
			end)
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
	-- Add nvim-surround for text manipulation
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	-- Add vim-abolish for advanced search, substitution, and abbreviation
	{
		"tpope/vim-abolish",
		dependencies = {
			"markonm/traces.vim", -- Add traces.vim for live substitution preview
		},
		event = "VeryLazy",
		config = function()
			-- Enable traces.vim integration with Abolish
			vim.g.traces_abolish_integration = 1

			-- Create a shortcut for :Subvert command using :S with proper range handling
			vim.api.nvim_create_user_command("S", function(opts)
				local range = ""
				if opts.range > 0 then
					range = opts.line1 .. "," .. opts.line2
				end
				vim.cmd(range .. "Subvert " .. opts.args)
			end, { nargs = "*", range = true })
		end,
	},
	-- Treesitter for better syntax highlighting and code parsing
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- Automatically install missing parsers when entering buffer
				auto_install = true,
				-- List of parsers to install (or "all" for all available parsers)
				ensure_installed = {
					"typescript",
					"tsx",
					"javascript",
					"lua",
					"rust",
					"json",
					"yaml",
					"toml",
					"markdown",
					"bash",
					"vim",
					"vimdoc",
				},
				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				indent = {
					enable = true,
				},
				-- Treesitter text objects for semantic code navigation
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- Arguments/parameters (like vim-angry)
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							-- Functions
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							-- Classes
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							-- Conditionals (if/else)
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							-- Loops
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
						},
					},
					-- Move between text objects
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
						},
					},
				},
			})
		end,
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
	{
		"samharju/yeet.nvim",
		version = "*", -- use the latest release, remove for master
		cmd = "Yeet",
		opts = {},
	},
	-- Refactoring tool with console.log insertion
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup({
				-- Customize console.log statements for TypeScript
				print_var_statements = {
					typescript = {
						'console.log("%s:", %s);',
					},
					javascript = {
						'console.log("%s:", %s);',
					},
					typescriptreact = {
						'console.log("%s:", %s);',
					},
					javascriptreact = {
						'console.log("%s:", %s);',
					},
				},
				show_success_message = true,
			})

			-- Console.log the current word under cursor
			vim.keymap.set({ "n", "v" }, "<leader>L", function()
				require("refactoring").debug.print_var()
			end, { desc = "Console.log current word/selection" })

			-- Cleanup all debug statements
			vim.keymap.set("n", "<leader>lc", function()
				require("refactoring").debug.cleanup({})
			end, { desc = "Cleanup debug statements" })
		end,
	},
	-- Git client - modern alternative to fugitive
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"ibhagwan/fzf-lua", -- alternative to telescope
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({
				-- Hunk-level staging in commits
				disable_hint = false,
				use_magit_keybindings = false,
				-- Use fzf-lua instead of telescope for better integration
				integrations = {
					fzf_lua = true,
					diffview = true,
				},
			})

			-- Add keybinding for opening Neogit
			vim.keymap.set("n", "<leader>g", function()
				neogit.open()
			end, { desc = "Open Neogit" })
		end,
	},
	-- Git diff and file history viewer
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
			})

			-- Add keybindings for diffview
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
			vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File History" })
			vim.keymap.set("v", "<leader>gh", ":'<,'>DiffviewFileHistory<cr>", { desc = "File History (Selection)" })
			vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
		end,
	},
	-- Git signs in the gutter
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				current_line_blame = false, -- Set to true to show blame on all lines by default
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					-- Navigation
					vim.keymap.set("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, buffer = bufnr })

					vim.keymap.set("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, buffer = bufnr })

					-- Actions
					vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
					vim.keymap.set("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { buffer = bufnr, desc = "Stage Hunk" })
					vim.keymap.set("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { buffer = bufnr, desc = "Reset Hunk" })
					vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr, desc = "Stage Buffer" })
					vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo Stage Hunk" })
					vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr, desc = "Reset Buffer" })
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
					vim.keymap.set("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end, { buffer = bufnr, desc = "Blame Line" })
					vim.keymap.set(
						"n",
						"<leader>gb",
						"<cmd>Gitsigns blame<cr>",
						{ buffer = bufnr, desc = "Git Blame Buffer" }
					)
					vim.keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff This" })
					vim.keymap.set("n", "<leader>hD", function()
						gs.diffthis("~")
					end, { buffer = bufnr, desc = "Diff This ~" })
					vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { buffer = bufnr, desc = "Toggle Deleted" })

					-- Text object
					vim.keymap.set(
						{ "o", "x" },
						"ih",
						":<C-U>Gitsigns select_hunk<CR>",
						{ buffer = bufnr, desc = "Select Hunk" }
					)
				end,
			})
		end,
	},
	-- Sideways.vim for moving function arguments, list items, etc.
	{
		"AndrewRadev/sideways.vim",
		config = function()
			-- Movement keybindings (using Alt instead of Ctrl to avoid conflict with <C-h> for nohlsearch)
			vim.keymap.set("n", "<M-h>", ":SidewaysLeft<CR>", { desc = "Move argument left" })
			vim.keymap.set("n", "<M-l>", ":SidewaysRight<CR>", { desc = "Move argument right" })
			vim.keymap.set("n", "[a", ":SidewaysJumpLeft<CR>", { silent = true, desc = "Jump to left argument" })
			vim.keymap.set("n", "]a", ":SidewaysJumpRight<CR>", { silent = true, desc = "Jump to right argument" })
			vim.keymap.set("n", "<leader>i", "<Plug>SidewaysArgumentInsertBefore", { desc = "Insert argument before" })

			-- Plugin setting (same as vimrc)
			vim.g.sideways_add_item_cursor_restore = 1
		end,
	},
})

-------------------------------------------------------------------------------
--
-- GitHub Browse functionality (like vim-rhubarb's :GBrowse)
--
-------------------------------------------------------------------------------
-- Function to get GitHub URL for current file/selection
local function get_github_url()
	-- Get git remote URL
	local remote_url = vim.fn.systemlist("git remote get-url origin")[1]
	if vim.v.shell_error ~= 0 then
		print("Error: Not in a git repository or no origin remote found")
		return nil
	end

	-- Convert SSH/HTTPS URL to GitHub web URL
	local github_url = remote_url
	-- Handle SSH URLs (git@github.com:user/repo.git)
	github_url = github_url:gsub("git@github%.com:", "https://github.com/")
	-- Handle HTTPS URLs and remove .git suffix
	github_url = github_url:gsub("%.git$", "")

	-- Get current file path relative to repo root
	local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		print("Error: Could not find git repository root")
		return nil
	end

	local current_file = vim.fn.expand("%:p")
	local relative_path = current_file:gsub("^" .. vim.pesc(repo_root .. "/"), "")

	-- Get current branch
	local branch = vim.fn.systemlist("git branch --show-current")[1]
	if vim.v.shell_error ~= 0 then
		branch = "main" -- fallback to main
	end

	-- Construct the URL
	local url = github_url .. "/blob/" .. branch .. "/" .. relative_path

	-- Add line numbers if in visual mode
	local mode = vim.fn.mode()
	if mode == "v" or mode == "V" or mode == "\22" then -- visual modes
		local start_line = vim.fn.line("v")
		local end_line = vim.fn.line(".")
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
		if start_line == end_line then
			url = url .. "#L" .. start_line
		else
			url = url .. "#L" .. start_line .. "-L" .. end_line
		end
	else
		-- Add current line number for normal mode
		local current_line = vim.fn.line(".")
		url = url .. "#L" .. current_line
	end

	return url
end

-- Function to open GitHub URL in browser
local function github_browse()
	local url = get_github_url()
	if url then
		-- Use macOS 'open' command to open URL in browser
		vim.fn.system("open '" .. url .. "'")
		print("Opened: " .. url)
	end
end

-- Set up the keymap for GitHub browse (using <leader>gB since <leader>gb is taken by Gitsigns blame)
vim.keymap.set({ "n", "v" }, "<leader>gB", github_browse, { desc = "Open file on GitHub" })

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
vim.api.nvim_create_user_command(
	"ExitAllNoFormat",
	"noautocmd xa",
	{ desc = "Write all files and exit without formatting" }
)
vim.api.nvim_create_user_command("QuitAllNoFormat", "noautocmd qa!", { desc = "Quit all without saving or formatting" })

-- Add sleuth for automatic indentation detection (like in vimrc)
-- This will help maintain consistent spacing across vim and neovim
