local o = vim.o      --Global Options
local wo = vim.wo    --Window-local Options
local bo = vim.bo    --Buffer-local Options 

local cmd = vim.cmd


-----------------		
-- global options
-----------------

o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
-- ... snip ... 



-----------------
-- mine
-----------------

o.showtabline = 2
o.scrolloff = 5
o.mouse = 'a'
o.backupcopy = 'yes'
o.undolevels = 1000
-- shortmess options?
o.showmode = true        -- nv-ide has false but still shows? Check bar settings?
o.hidden = true
o.splitright = true
o.splitbelow = true
o.wrapscan = true
o.backup = false         -- eh?
o.writebackup = false    -- eh?
o.showcmd = true
o.showmatch = true
o.ignorecase = true
o.hlsearch = true
o.smartcase = true
o.errorbells = false
o.joinspaces = false
o.title = true
o.lazyredraw = true      -- eh?
o.encoding = 'UTF-8'
-- o.completeopt = { 'menu', 'menuone', 'noselect' }
o.clipboard = 'unnamedplus'
--o.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
o.laststatus = 3 
o.timeoutlen = 500
o.termguicolors = true


-----------------------
-- window-local options
-----------------------

wo.number = true
wo.wrap = false
wo.colorcolumn = "+1"
wo.foldmethod = 'indent'
wo.foldlevel = 1
wo.list = false
wo.foldnestmax = 10
wo.signcolumn = 'yes'
wo.relativenumber = true
wo.foldenable = false
wo.cursorline = false


-----------------------
-- buffer-local options
-----------------------

bo.expandtab = true
bo.fileformat = 'unix'
bo.tabstop = 2
--bo.spelllang = 'en'
bo.softtabstop = 2
bo.swapfile = false
bo.undofile = false
bo.expandtab = true
bo.shiftwidth = 2



cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, {last_pos, 0})
  end
end

cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'


