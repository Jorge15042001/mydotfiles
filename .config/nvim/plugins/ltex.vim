command! GrammarCheck :%!curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" --data "language=en-US&text=<%" http://localhost:8081/v1/check | jq .
autocmd User PlugLoaded ++nested luafile ~/.config/nvim/lua/ltex.config.lua
