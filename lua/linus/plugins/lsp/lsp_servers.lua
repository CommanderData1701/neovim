local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

return {
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--compile-commands-dir=./build"
        },
        init_options = {
            usePlaceHolders = true,
            completeUnimported = true,
            clangdFileStatus = true,
            semanticHighlighting = true,
        },
        root_dir = nvim_lsp.util.root_pattern(
            ".git", "CMakeLists.txt"
        ),
        settings = {
            compileCommandsDirectory = "build",
        },
    },

    svelte = {},

    cmake = {
        root_dir = nvim_lsp.util.root_pattern(
            "CMakeLists.txt"
        ),
    },

    dockerls = {},

    lua_ls = {},

    pyright = {
        settings = {
            pyright = {
                { autoimportCompletion = true, },
            },
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "off",
                },
                pythonPath = "/usr/local/bin/python"
            }
        }
    },

    rust_analyzer = {
        settings = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    },
}
