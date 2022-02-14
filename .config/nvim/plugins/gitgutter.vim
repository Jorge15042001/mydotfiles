Plug 'airblade/vim-gitgutter'
" moving between hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" do not show moving messages
let g:gitgutter_show_msg_on_hunk_jumping = 0

"previewHunk
nmap ghp <Plug>(GitGutterPreviewHunk)
"stage
nmap ghs <Plug>(GitGutterStageHunk)
"roolback
nmap ghu <Plug>(GitGutterUndoHunk)

