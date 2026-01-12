-- ~/.config/nvim/lua/plugins/preview.lua
return {
    "https://gitlab.com/itaranto/preview.nvim.git",
    version = "*",
    build = function()
        local data = vim.fn.stdpath("data")
        local jar  = data .. "/plantuml.jar"
        if vim.fn.empty(vim.fn.glob(jar)) > 0 then
            vim.fn.mkdir(data, "p")
            vim.fn.system({
                "curl", "-L",
                "https://netcologne.dl.sourceforge.net/project/plantuml/plantuml.jar",
                "-o", jar,
            })
        end
    end,
    config = function()
        require("preview").setup({
            render_on_write = true,
            previewers_by_ft = {
                plantuml = {
                    name = "plantuml_svg",
                    previewer = {
                        command    = "java",
                        args       = {
                            "-Dfile.encoding=UTF-8",
                            "-jar",
                            vim.fn.stdpath("data") .. "/plantuml.jar",
                            "-pipe", "-tsvg", "-charset", "UTF-8", "$INPUT_FILE",
                        },
                        stdin      = false,
                        stdout     = true,
                        exit_codes = { [0] = true },
                    },
                    renderer = { type = "buffer" },
                },
            },
        })
    end,
}

