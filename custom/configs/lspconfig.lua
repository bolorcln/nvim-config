local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local servers = { "intelephense", "html", "cssls", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

local angular_cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  "~/.local/share/nvim/mason/packages/angular-language-server/node_modules/typescript/lib",
  "--ngProbeLocations",
  "~/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/bin"
}
lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = angular_cmd,
  on_new_config = function(new_config, _)
    new_config.cmd = angular_cmd
  end
}
