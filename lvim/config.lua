lvim.plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "mfussenegger/nvim-dap-python" },
    { "stevearc/dressing.nvim" },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = 'kevinhwang91/promise-async'
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
}

lvim.builtin.luasnip.sources.friendly_snippets = false
-- Gitsigns config
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 100


-- Harpoon settings
local harpoon = require("harpoon")
harpoon:setup({})
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- Python setup
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "pyright"
end, lvim.lsp.automatic_configuration.skipped_servers)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({ { name = "black" }, })
-- lvim.format_on_save.enabled = "false"
-- lvim.format_on_save.pattern = { "*.py" }

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { command = "pylint", filetypes = { "python" } } })
linters.setup({ { command = "mypy", filetypes = { "python" } } })

vim.opt.termguicolors = true
lvim.colorscheme = "catppuccin"

vim.opt.cmdheight = 1

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true


-- telescope keymaps
local builtin = require('telescope.builtin')
lvim.keys.normal_mode["<C-p>"] = { builtin.git_files, {} }
lvim.keys.normal_mode["<leader>sg"] = function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end
lvim.builtin.which_key.mappings["b"] = {
    name = "Buffers",
    h = { ":BufferLineCyclePrev<CR>", "Previous" },
    l = { ":BufferLineCycleNext<CR>", "Next" },
    b = {
        ":lua require('telescope.builtin').buffers({sort_mru = true,ignore_current_buffer = true,})<CR>",
        "Recently Used"
    },
    c = {
        ":BufferLinePickClose<CR>",
        "Pick buffer to close",
    },
    H = {
        ":BufferLineCloseLeft<CR>",
        "Close all to the left",
    },
    L = {
        ":BufferLineCloseRight<CR>",
        "Close all to the right",
    },
    e = {
        ":BufferLineSortByExtension<CR>",
        "Sort by language",
    },
    d = {
        ":BufferLineSortByDirectory<CR>",
        "Sort by directory",
    }
}

lvim.builtin.which_key.mappings["h"] = {
    name = "Harpoon",
    e = {
        function() toggle_telescope(harpoon:list()) end,
        "Open harpoon window"
    },
    a = {
        function() harpoon:list():append() end,
        "Append to list"
    },
    h = {
        function() harpoon:list():prev() end,
        "Prev"
    },
    l = {
        function() harpoon:list():next() end,
        "Next"
    }
}

lvim.keys.normal_mode["<leader>pv"] = ":Ex<CR>"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.builtin.which_key.mappings["u"] = {
    name = "Undotree",
    t = { vim.cmd.UndotreeToggle, "Toggle Undotree" },
}

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["<leader>y"] = "\"+y"
lvim.keys.normal_mode["<leader>Y"] = "\"+Y"
lvim.keys.visual_mode["<leader>y"] = "\"+y"
lvim.keys.normal_mode["<leader>d"] = "\"_d"
lvim.keys.visual_mode["<leader>d"] = "\"_d"
lvim.keys.insert_mode["<C-c>"] = "<Esc>"

local ufo = require("ufo")
ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

lvim.keys.normal_mode["zR"] = ufo.openAllFolds
lvim.keys.normal_mode["zM"] = ufo.closeAllFolds
-- replace the word that you are currently on
-- lvim.keys.normal_mode["<leader>rw"] = [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]]
--
-- Ex mode remapped to no-op
lvim.keys.normal_mode["Q"] = "<nop>"

-- Shout-out file
lvim.keys.normal_mode["<leader><leader>"] = function()
    vim.cmd("so")
end

-- Ctrl-f to switch project with tmux > gotta rebind for wezterm
-- lvim.keys.normal_mode["<C-f>"] = "<cmd>silent !tmux neww tmux-sessionizer<CR>"
--
--
-- Quick fix navigation
-- lvim.keys.normal_mode["<C-k>"] = "<cmd>cnext<CR>zz"
-- lvim.keys.normal_mode["<C-j>"] = "<cmd>cprev<CR>zz"
-- lvim.keys.normal_mode["<leader>k"] = "<cmd>lnext<CR>zz"
-- lvim.keys.normal_mode["<leader>j" = "<cmd>lprev<CR>zz"
--
-- Auto chmod executable files
-- lvim.keys.normal_mode["<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
