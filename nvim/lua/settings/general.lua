local opt = vim.opt

opt.tabstop = 2 -- Replace tab with two spaces.
opt.shiftwidth = 2 -- Indent two spaces.
opt.expandtab = true -- Convert tab to space.

opt.number = true -- Show line number.
opt.relativenumber = true -- Show relative number.

opt.smartcase = true -- Search ignore case.
opt.ignorecase = true -- Ignore all case.

opt.autowrite = true -- Auto save when switch buffer.
opt.confirm = true -- Show confirm when exit not saved buffer.

opt.termguicolors = true -- Show better color.

opt.wrap = true -- Auto wrap when one line has much words.
opt.linebreak = true -- Make one word better show in one line.
