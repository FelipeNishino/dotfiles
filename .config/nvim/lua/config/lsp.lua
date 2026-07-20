-- Lsp configs

vim.lsp.enable("roslyn_ls")

vim.lsp.config("roslyn_ls", {
    filetypes = { "razor", "cs" },

    settings = {
        ["csharp|background_analysis"] = {
            dotnet_analyser_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "openFiles",
        },
    },
})

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
