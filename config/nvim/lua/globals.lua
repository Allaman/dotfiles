local g = vim.g

g.mapleader = " " -- 'vim.g' sets global variables

-- Material theme
g.material_style = 'deep ocean'
g.material_italic_comments = true
g.material_italic_keywords = true
g.material_italic_functions = true
g.material_italic_variables = false
g.material_contrast = true
g.material_borders = false
g.material_disable_background = false
require('material').set()
