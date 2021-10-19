local lsp_config = require('lspconfig')
local eslint = require('lsp.efm.eslint')
local prettier = require('lsp.efm.prettier')
local luaformat = require('lsp.efm.luaformat')

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = {'package.json', '.git/', '.zshrc'}
local efm_languages = {
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier},
    javascript = {eslint, prettier},
    javascriptreact = {eslint, prettier},
    ["javascript.jsx"] = {eslint, prettier},
    typescript = {eslint, prettier},
    typescriptreact = {eslint, prettier},
    ["typescript.tsx"] = {eslint, prettier},
    css = {prettier},
    scss = {prettier},
    sass = {prettier},
    less = {prettier},
    graphql = {prettier},
    vue = {prettier},
    html = {prettier},
    lua = {luaformat}
}

lsp_config.efm.setup({
    cmd = {
        "efm-langserver", "-c", efm_config, "-logfile", efm_log_dir .. "efm.log"
    },
    filetypes = {
        'javascript', 'javascriptreact', 'javascript.jsx', 'typescript',
        'typescriptreact', 'typescript.tsx', 'lua'
    },
    root_dir = lsp_config.util.root_pattern(unpack(efm_root_markers)),
    init_options = {documentFormatting = true},
    settings = {rootMarkers = efm_root_markers, languages = efm_languages}
})
