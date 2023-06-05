Plug 'kiyoon/jupynium.nvim', { 'do': 'pip3 install --user .' }
" Plug 'kiyoon/jupynium.nvim', { 'do': 'conda run --no-capture-output -n jupynium pip install .' }
Plug 'hrsh7th/nvim-cmp'       " optional, for completion
Plug 'rcarriga/nvim-notify'   " optional
Plug 'stevearc/dressing.nvim' " optional, UI for :JupyniumKernelSelect

autocmd User PlugLoaded ++nested luafile ~/.config/nvim/lua/jupyternotebooks.lua
