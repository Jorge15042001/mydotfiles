Plug 'nvim-lua/plenary.nvim' 
Plug 'ThePrimeagen/harpoon'

nnoremap <leader>hu :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>

" navigate to different files
nnoremap <leader>h1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>h2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>h3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>h5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>h6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>h7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>h8 :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>h9 :lua require("harpoon.ui").nav_file(9)<CR>



nnoremap <leader>hj :lua require("harpoon.ui").nav_next()<CR>   
nnoremap <leader>hk :lua require("harpoon.ui").nav_prev()<CR>

nnoremap<leader>ht1 :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap<leader>ht2 :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap<leader>ht3 :lua require("harpoon.term").gotoTerminal(3)<CR>
nnoremap<leader>ht4 :lua require("harpoon.term").gotoTerminal(4)<CR>
nnoremap<leader>ht5 :lua require("harpoon.term").gotoTerminal(5)<CR>
nnoremap<leader>ht6 :lua require("harpoon.term").gotoTerminal(6)<CR>
nnoremap<leader>ht7 :lua require("harpoon.term").gotoTerminal(7)<CR>
nnoremap<leader>ht8 :lua require("harpoon.term").gotoTerminal(8)<CR>
nnoremap<leader>ht9 :lua require("harpoon.term").gotoTerminal(9)<CR>

