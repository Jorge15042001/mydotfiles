require 'lspconfig'.arduino_language_server.setup {
  cmd = { "/usr/bin/arduino-language-server",  "-clangd", "/usr/bin/clangd",  "-cli", "/usr/bin/arduino-cli",  "-cli-config", "$HOME/.arduino15/arduino-cli.yaml", "-fqbn", "arduino:avr:uno" }
}
