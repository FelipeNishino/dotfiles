-- Lsp configs

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        --vim.keymap
    end,
})

vim.diagnostic.config({
    virtual_lines = {
        current_line = true
    }
})
