vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Preserve cursor position when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle of the screen when half page scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep searched term in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank into system clipboard, from asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without overwriting paste register with deleted selection
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("n", "Q", "<nop>")
-- Create a new tmux session
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Select and Replace current word on entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Replace current visual selection
vim.keymap.set("v", "<leader>s", [["hy:%s/<C-r>h//g<left><left>]])
-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Balanced symbols by Adriano_Pinaffo at
-- Close brackets automatically, with return
vim.keymap.set("i", "{<CR>", "{<cr>}<C-O><S-O>")
vim.keymap.set("i", "(<CR>", "(<cr>}<c-o><s-o>")
vim.keymap.set("i", "[<CR>", "[<cr>]<c-o><s-o>")
-- Close brackets without return
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "[", "[]<left>")
-- Two cases below are covered by inoremap <exp>
vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "'", "''<left>")
-- If you close a bracket that is already closed, it overwrites
-- vim.keymap.set("i", "<expr> )", "strpart(getline('.'), col('.')-1, 1) == \")\" ? \"\\<Right>\" : \")\"")
-- vim.keymap.set("i", "<expr> }", "strpart(getline('.'), col('.')-1, 1) == \"}\" ? \"\\<Right>\" : \"}\"")
-- vim.keymap.set("i", "<expr> ]", "strpart(getline('.'), col('.')-1, 1) == \"]\" ? \"\\<Right>\" : \"]\"")
-- vim.keymap.set("i", "<expr> '", "strpart(getline('.'), col('.')-1, 1) == \"'\" ? \"\\<Right>\" : \"''<left>\"")
-- vim.keymap.set("i", "<expr> \"", "strpart(getline('.'), col('.')-1, 1) == \"\"\" ? \"\\<Right>\" : \"\"\"<left>\"")
-- enclose a word in normal mode with "'({[
--vim.keymap.set("n", "<C-'>", "mmbi'<esc>ea'<esc>`m<right>")
--vim.keymap.set("n", "<C-S-'>", "mmbi\"<esc>ea\"<esc>`m<right>")
--vim.keymap.set("n", "<C-(>", "mmbi(<esc>ea)<esc>`m<right>")
--vim.keymap.set("n", "<C-{>", "mmbi{<esc>ea}<esc>`m<right>")
--vim.keymap.set("n", "<C-[>", "mmbi[<esc>ea]<esc>`m<right>")
-- enclose a selection in visual mode with "'({[
--vim.keymap.set("v", "<C-'>", "<Esc>`<i'<Esc>`>a<right>'<Esc>")
--vim.keymap.set("v", "<C-S-'>", "<Esc>`<i\"<Esc>`>a<right>\"<Esc>")
-- vim.keymap.set("v", "<C-S-9>", "<Esc>`<i(<Esc>`>a<right>)<Esc>")
-- vim.keymap.set("v", "<C-{>", "<Esc>`<i{<Esc>`>a<right>}<Esc>")
-- vim.keymap.set("v", "<C-[>", "<Esc>`<i[<Esc>`>a<right>]<Esc>")
