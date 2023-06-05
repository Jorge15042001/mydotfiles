local opt = vim.opt
local map = require("map").map

-- set number
opt.number = true

opt.encoding="utf-8"

opt.mouse = ""

opt.backspace="indent,eol,start"

opt.autoindent = true
opt.hlsearch = false

opt.hidden = true
opt.errorbells = false

opt.tabstop=2
opt.softtabstop=2
opt.shiftwidth=2
opt.expandtab = true

opt.smartindent = true
opt.ignorecase = true

opt.wrap = false
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff=8

vim.g.mapleader = ' '


-- allow gf to open non-existing files
-- nmap <silent> gf :edit <cfile><cr>
map('n',"gf",":edit <cfile><cr>",{silent = true})

-- reselect for indentaion
-- vnoremap < <gv
-- vnoremap > >gv
map('v',"<","<gv",{silent = true})
map('v',">",">gv",{silent = true})


