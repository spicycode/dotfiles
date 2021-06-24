-- Based on: https://github.com/wbthomason/dotfiles
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require('config.utils')
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader/local leader
g.mapleader = [[,]]
-- g.maplocalleader = [[ ]]

-- Settings
local buffer = {o, bo}
local window = {o, wo}


opt('wildmode', 'longest,full')

opt('inccommand', 'nosplit')

opt('tabstop', 2, buffer)
opt('softtabstop', 2, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')

-- Numbers
opt('number', true)
opt('numberwidth', 3)


-- Window Management

-- Open new horizontal split windows below current
opt('splitbelow', true)

-- Open new vertical split windows to the right
opt('splitright', true)


-- Buffers

-- Buffers become hidden when unloaded
opt('hidden', true)
