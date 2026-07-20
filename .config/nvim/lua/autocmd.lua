--[[
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})
]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.tex",
    callback = function()
        vim.diagnostic.config({
            virtual_lines = {
                current_line = false
            }
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "ts",
    callback = function()
        print("loaded otter on ts file.")
        require("otter").activate()
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
