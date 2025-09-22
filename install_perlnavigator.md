# Instructions to install perl navigator

1) in :Mason, install perlnavigator

2. in lsp-config.lua add the following -
```lua
-- perl navigator
lspconfig.perlnavigator.setup {
cmd = { "perlnavigator" },
settings = {
  perlnavigator = {
    perlPath = 'perl',
    enableWarnings = true }
}

```
