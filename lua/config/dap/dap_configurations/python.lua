-- python3 -m pip install debugpy

return {
    adapters = {
        python = {
            type = "executable",
            command = "python3",
            args = { "-m", "debugpy.adapter" },
        },
    },
    configurations = {
        python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = "python3",
            },
            {
                type = "python",
                request = "launch",
                name = "Launch Django",
                program = vim.fn.getcwd() .. "/manage.py",
                pythonPath = "python3",
                justMyCode = false,
                args = {
                    "runserver",
                    "127.0.0.1:8000",
                    "--noreload",
                },
            },
        },
    },
}
