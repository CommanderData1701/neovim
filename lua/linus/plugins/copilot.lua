-- Copilot configuration file
local disable_copilot = function()
    vim.cmd("Copilot disable")
    print("Copilot disabled")
end

local enable_copilot = function()
    vim.cmd("Copilot enable")
    print("Copilot enabled")
end

function ToggleCopilot()
    if vim.g.copilot_enabled == 1 then
        disable_copilot()
    else
        enable_copilot()
    end
end

vim.api.nvim_set_keymap("n", "<leader>tc", ":lua ToggleCopilot()<CR>",
    { noremap = true, silent = true })

local unwanted_filetypes = {
    "*.tex",
    "*.txt",
    "*.md",
    "*.html",
    "*.css",
}
for _, filetype in ipairs(unwanted_filetypes) do
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = filetype,
        callback = disable_copilot,
    })
end

local wanted_filetypes = {
    "*.cpp",
    "*.lua",
    "*.py",
    "*.hs",
    "*.rs",
    "*.c",
    "*.js",
    "*.svelte",
    "*.java"
}

local callback = disable_copilot
for _, filetype in ipairs(wanted_filetypes) do
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = filetype,
        callback = callback,
    })
end
disable_copilot()
