local g = vim.g
local o = vim.o

-- general
g.mapleader = [[ ]]
g.maplocalleader = [[,]]
o.mouse = "a"
o.mousemoveevent = true
o.clipboard = "unnamedplus"
o.hidden = true
o.history = true
o.lazydraw = true
o.nobackup = true
g.laststatus = 3
g.completeopt = "menu,menuone,noselect"
o.encoding = "utf-8"
o.fileencoding = "utf-8"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.markdown_fenced_languages = { "ts=typescript" }

-- search
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- UI
o.number = true
o.cursorline = true
o.showmatch = true
o.list = true
o.signcolumn = "yes"
o.title = true

-- tab
o.softtabstop = 2 -- displays two spaces for one tab
o.expandtab = true -- convert tabs to spaces
o.smarttab = true
o.smartindent = true
o.autoindent = true
o.shiftwidth = 2 -- number of spaces for indentation

-- folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter$foldexpr()"
o.foldenable = false
o.foldnestmax = 1
