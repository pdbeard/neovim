local o = vim.o      --Global Options
local wo = vim.wo    --Window-local Options
local bo = vim.bo    --Buffer-local Options 
		
-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
-- ... snip ... 

-- window-local options
wo.number = true
wo.wrap = false

-- buffer-local options
bo.expandtab = true
