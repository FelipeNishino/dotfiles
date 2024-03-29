vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "$HOME/.config/i3/*",
    command = "set filetype=i3config",
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "/etc/samba/*",
    command = "set filetype=samba",
})

