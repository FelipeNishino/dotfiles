return {
    "SirVer/ultisnips",
    enabled = false,
    init = function ()
        vim.g.UltiSnipsExpandTrigger = '<CR>'
        vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end
}

