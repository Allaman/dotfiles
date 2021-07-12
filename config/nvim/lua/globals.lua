local g = vim.g

-- Material theme
-- g.material_style = 'deep ocean'
g.material_style = 'darker'
g.material_italic_comments = true
g.material_italic_keywords = true
g.material_italic_functions = true
g.material_italic_variables = false
g.material_contrast = true
g.material_borders = false
g.material_disable_background = false
g.material_contrast = false
g.material_hide_eob = true
-- Load the colorscheme
require('material').set()
