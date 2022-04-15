-- require("lsp_signature").status_line(max_width)
-- local current_signature = function(width)
--   if not packer_plugins["lsp_signature.nvim"] or packer_plugins["lsp_signature.nvim"].loaded == false then
--     return ""
--   end
--   local sig = require("lsp_signature").status_line(width)
--   return sig.label .. "🐼" .. sig.hint
-- end


-- Globals
vim.g.SideWidth=50

vim.g.neovide_transparency=0.86
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_hide_mouse_when_typing =true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/LSPenv/python"
-- vim.g.python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/iris/python"
-- vim.g.python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/iris/python"


lvim.builtin.which_key.setup.spelling = { enabled = false }

-- lvim.builtin.cmp.


lvim.builtin.project.manual_mode = false



-- config.lua
--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- Enable powershell as your default shell

-- Previous
--vim.opt.shellcmdflag =
--  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
--vim.cmd [[
--		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--		set shellquote= shellxquote=
--  ]]
vim.opt.shell = "cmd.exe"
-- vim.opt.shell = "C:/Program Files/PowerShell/pwsh.exe"
-- vim.opt.shell = "pwsh.exe -NoLogo"

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "melange1"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode['<leader>p'] = ':w<CR>:call NeotermTerminalPython(@%, winnr(), 0)<CR>'
lvim.keys.normal_mode['<leader>pk'] = ':w<CR>:Tkill<CR>'
lvim.keys.normal_mode['\\]'] = ':bn<CR>'
-- lvim.keys.normal_mode['<C-]>'] = ':bn<CR>'
lvim.keys.normal_mode['\\['] = ':bp<CR>'
-- lvim.keys.normal_mode['<C-[>'] = ':bp<CR>'
lvim.keys.normal_mode['`'] = ':'
lvim.keys.normal_mode['g['] = ':lua vim.diagnostic.goto_prev()<CR>'
lvim.keys.normal_mode['g]'] = ':lua vim.diagnostic.goto_next()<CR>'
lvim.keys.normal_mode['gt'] = ":lua require('lvim.lsp.peek').Peek('typeDefinition')<CR>"
lvim.keys.normal_mode['gp'] = ":lua require('lvim.lsp.peek').Peek('definition')<CR>"
lvim.keys.normal_mode['<leader>/'] = ":set hlsearch!<CR>:match none<CR>"
--lvim.keys.normal_mode['<leader>T'] = <cmd>lua require("which-key").show(" T", {mode = "n", auto = true})<CR>
lvim.keys.normal_mode['<leader>;'] = "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>"
lvim.keys.normal_mode['\\f'] = ":lua require('telescope.builtin').find_files({layout_strategy='vertical', layout_config={width=0.7}, initial_mode='insert'})<CR>"
lvim.keys.normal_mode["\\d"] = ":Telescope aerial<CR>"
lvim.keys.normal_mode["\\s"] = ":lua require('telescope.builtin').buffers({layout_strategy='vertical', layout_config={width=0.7}, initial_mode='insert'})<CR>"
lvim.keys.normal_mode["\\j"] = ":Telescope buffers<CR>"
-- lvim.keys.normal_mode['coD'] "/=<CR>"
-- lvim.keys.normal_mode["<leader>m"] = "m"

lvim.keys.command_mode['<C-k>'] = "<Up>"
lvim.keys.visual_mode['<leader>;'] = "<Esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>"
lvim.keys.command_mode['<C-j>'] = "<Down"

lvim.keys.normal_mode["<A-h>"] = ":BufferLineCyclePrev<Cr>"
lvim.keys.normal_mode["<A-l>"] = ":BufferLineCycleNext<Cr>"
lvim.keys.normal_mode["<C-p>"] = ":BufferLineCyclePrev<Cr>"
lvim.keys.normal_mode["<C-n>"] = ":BufferLineCycleNext<Cr>"
lvim.keys.normal_mode["<C-j>"] = ":BufferLineCyclePrev<Cr>"
lvim.keys.normal_mode["<C-k>"] = ":BufferLineCycleNext<Cr>"
lvim.keys.normal_mode["<leader>he"] = ":call HighlightWordUnderCursor()<Cr>"
lvim.keys.normal_mode["<leader>hw"] = ":match none<Cr>"

lvim.builtin.which_key.mappings["m"] = {
    name = "General",
    m = {"m", "Mark"},
    f = {":Telescope find_files<Cr>", "Files"},
    a = {":Telescope aerial<Cr>", "Aerial"}
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Telescope",
    r = {":Telescope resume<Cr>", "Previous Observation"},
    f = {":Telescope find_files<Cr>", "Files"},
    k = {":Telescope keymaps<Cr>", "Mappings"},
    w = {":Telescope live_grep<Cr>", "Words"},
    b = {":Telescope buffers<Cr>", "Buffers"},
    a = {":Telescope aerial<Cr>", "Aerial"},
    j = {":Telescope jumplist<Cr>", "Jumplist"},
    h = {":Telescope help_tags<Cr>", "Help"},
    p = {":Telescope projects<Cr>", "Projects"},

    g = {
        name = "Git",
        f = {":Telescope git_files<CR>", "Git Files"},
        C = {":Telescope git_commits<CR>", "Git Commits"},
        c = {":Telescope git_bcommits<CR>", "Git Buffer Commits"},
        b = {":Telescope git_branches<CR>", "Git Branches"},
        s = {":Telescope git_status<CR>", "Git Status"},
        S = {":Telescope git_stash<CR>", "Git Stash"}
    }
}
lvim.builtin.which_key.mappings["f"] = {
    name = "Find",
    d = {":Telescope aerial theme=dropdown<CR>", "Aerial"},
    f = {":Telescope find_files theme=dropdown<CR>", "Files"}
}
lvim.builtin.which_key.mappings["b"] = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    h = { "<cmd>BufferLineCyclePrev<cr>", "Go to left" },
    l = { "<cmd>BufferLineCycleNext<cr>", "Go to right" },
    b = { "<cmd>BufferLineMovePrev<cr>", "Move to left" },
    e = { "<cmd>BufferLineMoveNext<cr>", "Move to right" },
    c = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close"},
    H = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    L = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory"},
    S = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language"},
  }
lvim.keys.normal_mode['<leader>j'] = ":BufferLinePick<Cr>"
lvim.keys.normal_mode['<leader>]'] = ":AerialNext<Cr>"
lvim.keys.normal_mode['<leader>['] = ":AerialPrev<Cr>"
lvim.keys.normal_mode['<leader>}'] = ":AerialNextUp<Cr>"
lvim.keys.normal_mode['<leader>{'] = ":AerialPrevUp<Cr>"
lvim.builtin.which_key.mappings["a"] = {
    name = "Aerial",
    t = { "<cmd>AerialToggle<cr>", "Toggle" },
    c = { "<cmd>AerialClose<cr>", "Close" },
    o = { "<cmd>AerialOpen<cr>", "Open" },
    e = { "<cmd>AerialNext<cr>", "Next" },
    E = { "<cmd>AerialNextUp<cr>", "Next Up" },
    y = { "<cmd>AerialPrev<cr>", "Prev" },
    Y = { "<cmd>AerialPrevUp<cr>", "Prev Up" },
}

lvim.builtin.telescope.defaults.initial_mode = "normal"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_config.width = 0.99

lvim.builtin.project.patterns = {".git"}


-- unmap a default keymapping
lvim.keys.normal_mode["gbc"] = false
lvim.keys.visual_mode["gbc"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
--   -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["D"] = actions.delete_buffer
    },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.which_key.mappings["<F12>"] = { "<cmd>Dashboard<CR>", "Dashboard" }
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = false
-- lvim.builtin.terminal.shell = "pwsh.exe -NoLogo"

-- nvim-tree has some performance issues on windows, see kyazdani42/nvim-tree.lua#549
lvim.builtin.nvimtree.setup.diagnostics.enable = false
lvim.builtin.nvimtree.setup.filters.custom = false
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.enable = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.git_hl = false
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.width = vim.g.SideWidth
--nvim-tree my Configs 
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.git.timeout = 400
lvim.builtin.nvimtree.setup.auto_close = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "c",
  "lua",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.indent.disable = true
-- lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "julia", "python" } }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.override, { "julials" })

local manager = require'lvim.lsp.manager'
manager.setup("julials", {})
local opts = { noremap=true, silent=false }

local my_on_attach = function(client, bufnr)
    -- require "lsp_signature".on_attach({
    --     bind=true,
    --     handler_opts = {
    --         border = "rounded"
    --     }
    -- }, bufnr)  -- Note: add in lsp client on-attach

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',       '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',       '<cmd>lua vim.lsp.buf.definition()<CR>zz', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gk',       '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',       '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs',       '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',       '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gef', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'geq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

local lspconfig = require('lspconfig')

lspconfig.julials.setup{
    settings = {
        julia = {
            analysis = {
                stubPath = 'C:/Users/Lenovo/.julia/packages'
            }
        }
    },
    on_new_config = function(new_config, _)
        local julia = vim.fn.expand("C:/Users/Lenovo/AppData/Local/Programs/Julia-1.7.0/bin/julia")
        if require'lspconfig'.util.path.is_file(julia) then
            new_config.cmd[1] = julia
        end
    end,
    on_attach = my_on_attach,
    filetypes = {'julia'},
    cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", '    # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig\n    # with the regular load path as a fallback\n    ls_install_path = joinpath(\n        get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),\n        "environments", "nvim-lspconfig"\n    )\n    pushfirst!(LOAD_PATH, ls_install_path)\n    using LanguageServer\n    popfirst!(LOAD_PATH)\n    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")\n    project_path = let\n        dirname(something(\n            ## 1. Finds an explicitly set project (JULIA_PROJECT)\n            Base.load_path_expand((\n                p = get(ENV, "JULIA_PROJECT", nothing);\n                p === nothing ? nothing : isempty(p) ? nothing : p\n            )),\n            ## 2. Look for a Project.toml file in the current working directory,\n            ##    or parent directories, with $HOME as an upper boundary\n            Base.current_project(),\n            ## 3. First entry in the load path\n            get(Base.load_path(), 1, nothing),\n            ## 4. Fallback to default global environment,\n            ##    this is more or less unreachable\n            Base.load_path_expand("@v#.#"),\n        ))\n    end\n    @info "Running language server" VERSION pwd() project_path depot_path\n    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)\n    server.runlinter = true\n    run(server)\n  ' }
    --cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", '"using LanguageServer; runserver()"' }
}

-- require'lspsagak






--local opts = {}
---- re-use common lsp configurations (keybindings, buffer-highlight and cmp integration)
--opts = require("lvim.lsp").get_common_opts()
--require('lspconfig').julials.setup(opts)

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>

--vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
--local formatters = require "lvim.lsp.null-ls.formatters"
--formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
lvim.plugins = {
    {"savq/melange"},
    -- {"numirias/semshi"},
    {"kassio/neoterm"},
    -- {"Yggdroot/LeaderF"},
    {"nvim-treesitter/playground"},
    {"JuliaEditorSupport/julia-vim"},
    { "stevearc/aerial.nvim" },
    { "ray-x/lsp_signature.nvim" }
}
vim.cmd('source C:/Users/Lenovo/AppData/Local/lvim/old_init_file.vim')
--vim.cmd('source C:/Users/Lenovo/AppData/Local/lvim/after/plugin/set_mappings.vim')
vim.cmd('source C:/Users/Lenovo/AppData/Local/lvim/defaults.vim')
-- vim.cmd('source C:/Users/Lenovo/AppData/Local/lvim/SidePannels.vim')
vim.cmd('source C:/Users/Lenovo/AppData/Local/lvim/mappings.vim')

-- vim.cmd("autocmd BufRead,BufNewFile *.jl set filetype=julia")
-- vim.cmd("autocmd FileType julia iunmap <buffer> '")






-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = "julia",
--     -- Modules and its options go here
--     highlight = {
--         enable = true,
--         --disable={""},
--         additional_vim_regex_highlighting=true
--     },
--     incremental_selection = { enable = true },
--     textobjects = { enable = true },
--     playground = {
--         enable = true
--     }
-- }



function Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- lvim.builtin.autopairs.on_config_done = function(autopairs)
--     autopairs.remove_rule("'", "'", "julia")
-- end




-- vim.g.python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/LSPenv/python"
-- vim.g.python3_host_prog = "C:/Users/Lenovo/miniconda3/envs/iris/python"


-- Call the setup function to change the default behavior
require("aerial").setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { "treesitter", "lsp", "markdown" },

  -- Enum: persist, close, auto, global
  --   persist - aerial window will stay open until closed
  --   close   - aerial window will close when original file is no longer visible
  --   auto    - aerial window will stay open as long as there is a visible
  --             buffer to attach to
  --   global  - same as 'persist', and will always show symbols for the current buffer
  close_behavior = "auto",

  -- Set to false to remove the default keybindings for the aerial buffer
  default_bindings = true,

  -- Enum: prefer_right, prefer_left, right, left, float
  -- Determines the default direction to open the aerial window. The 'prefer'
  -- options will open the window in the other direction *if* there is a
  -- different buffer in the way of the preferred direction
  default_direction = "prefer_left",

  -- Disable aerial on files with this many lines
  disable_max_lines = 10000,

  -- Disable aerial on files this size or larger (in bytes)
  disable_max_size = 10000000,

  -- A list of all symbols to display. Set to false to display all symbols.
  -- This can be a filetype map (see :help aerial-filetype-map)
  -- To see all available values, see :help SymbolKind
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  --  Array
  --  Boolean
  --  Class
  --  Constant
  --  Constructor
  --  Enum
  --  EnumMember
  --  Event
  --  Field
  --  File
  --  Function
  --  Interface
  --  Key
  --  Method
  --  Module
  --  Namespace
  --  Null
  --  Number
  --  Object
  --  Operator
  --  Package
  --  Property
  --  String
  --  Struct
  --  TypeParameter
  --  Variable

  -- Enum: split_width, full_width, last, none
  -- Determines line highlighting mode when multiple splits are visible.
  -- split_width   Each open window will have its cursor location marked in the
  --               aerial buffer. Each line will only be partially highlighted
  --               to indicate which window is at that location.
  -- full_width    Each open window will have its cursor location marked as a
  --               full-width highlight in the aerial buffer.
  -- last          Only the most-recently focused window will have its location
  --               marked in the aerial buffer.
  -- none          Do not show the cursor locations in the aerial window.
  highlight_mode = "split_width",

  -- Highlight the closest symbol if the cursor is not exactly on one.
  highlight_closest = true,

  -- Highlight the symbol in the source buffer when cursor is in the aerial win
  highlight_on_hover = false,

  -- When jumping to a symbol, highlight the line for this many ms.
  -- Set to false to disable
  highlight_on_jump = 300,

  -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
  -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
  -- default collapsed icon. The default icon set is determined by the
  -- "nerd_font" option below.
  -- If you have lspkind-nvim installed, aerial will use it for icons.
  icons = {},

  -- Control which windows and buffers aerial should ignore.
  -- If close_behavior is "global", focusing an ignored window/buffer will
  -- not cause the aerial window to update.
  -- If open_automatic is true, focusing an ignored window/buffer will not
  -- cause an aerial window to open.
  -- If open_automatic is a function, ignore rules have no effect on aerial
  -- window opening behavior; it's entirely handled by the open_automatic
  -- function.
  ignore = {
    -- Ignore unlisted buffers. See :help buflisted
    unlisted_buffers = true,

    -- List of filetypes to ignore.
    filetypes = {},

    -- Ignored buftypes.
    -- Can be one of the following:
    -- false or nil - No buftypes are ignored.
    -- "special"    - All buffers other than normal buffers are ignored.
    -- table        - A list of buftypes to ignore. See :help buftype for the
    --                possible values.
    -- function     - A function that returns true if the buffer should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `bufnr` and `buftype`.
    buftypes = "special",

    -- Ignored wintypes.
    -- Can be one of the following:
    -- false or nil - No wintypes are ignored.
    -- "special"    - All windows other than normal windows are ignored.
    -- table        - A list of wintypes to ignore. See :help win_gettype() for the
    --                possible values.
    -- function     - A function that returns true if the window should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `winid` and `wintype`.
    wintypes = "special",
  },

  -- When you fold code with za, zo, or zc, update the aerial tree as well.
  -- Only works when manage_folds = true
  link_folds_to_tree = false,

  -- Fold code when you open/collapse symbols in the tree.
  -- Only works when manage_folds = true
  link_tree_to_folds = true,

  -- Use symbol tree for folding. Set to true or false to enable/disable
  -- 'auto' will manage folds if your previous foldmethod was 'manual'
  manage_folds = false,

  -- These control the width of the aerial window.
  -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  -- min_width and max_width can be a list of mixed types.
  -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
  -- max_width = { 15, 0.999 },
  width = vim.g.SideWidth,
  -- min_width = 15,

  -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
  -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
  nerd_font = "auto",

  -- Call this function when aerial attaches to a buffer.
  -- Useful for setting keymaps. Takes a single `bufnr` argument.
  on_attach = nil,

  -- Automatically open aerial when entering supported buffers.
  -- This can be a function (see :help aerial-open-automatic)
  open_automatic = false,

  -- Set to true to only open aerial at the far right/left of the editor
  -- Default behavior opens aerial relative to current window
  placement_editor_edge = true,

  -- Run this command after jumping to a symbol (false will disable)
  post_jump_cmd = "normal! zz",

  -- When true, aerial will automatically close after jumping to a symbol
  close_on_select = false,

  -- Show box drawing characters for the tree hierarchy
  show_guides = false,

  -- The autocmds that trigger symbols update (not used for LSP backend)
  update_events = "TextChanged,InsertLeave",

  -- Customize the characters used when show_guides = true
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },

  -- Options for opening aerial in a floating win
  float = {
    -- Controls border appearance. Passed to nvim_open_win
    border = "rounded",

    -- Enum: cursor, editor, win
    --   cursor - Opens float on top of the cursor
    --   editor - Opens float centered in the editor
    --   win    - Opens float centered in the window
    relative = "win",

    -- These control the height of the floating window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a list of mixed types.
    -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.1 },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,
  },

  lsp = {
    -- Fetch document symbols when LSP diagnostics update.
    -- If false, will update on buffer changes.
    diagnostics_trigger_update = true,

    -- Set to false to not update the symbols when there are LSP errors
    update_when_errors = true,

    -- How long to wait (in ms) after a buffer change before updating
    -- Only used when diagnostics_trigger_update = false
    update_delay = 300,
  },

  treesitter = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },

  markdown = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },
})


-- Set up your LSP clients here, using the aerial on_attach method
require("lspconfig").vimls.setup{
  on_attach = require("aerial").on_attach,
}
-- Repeat this for each language server you have configured
require('telescope').load_extension('aerial')


local showSymbolFinder = function ()
    local opts= {
        symbols = {
            "interface",
            "class",
            "constructor",
            "method",
        }
    }
    if vim.bo.filetype == "vim" then
        opts.symbols = { "function" }
    end
    require('telescope.builtin').lsp_document_symbols(opts)
end

-- require("C:/Users/Lenovo/AppData/Local/lvim/comment.lua")
-- require("C:/Users/Lenovo/AppData/Local/lvim/myConfigs")
--vim.cmd('source C:/Users/Lenovo/AppData/Local/lvim/comment.lua')
