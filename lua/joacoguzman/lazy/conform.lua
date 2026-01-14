return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback", -- use LSP formatting only if no formatter is configured
      },

      formatters_by_ft = {
        -- C
        c = { "clang-format" },

        -- Lua
        lua = { "stylua" },

        -- JS / TS (React, Next.js)
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        -- CSS (incl. Tailwind via prettier-plugin-tailwindcss)
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },

        -- Ruby / Rails
        ruby = { "rubocop" },
        eruby = { "rubocop" },

        -- PHP (WordPress)
        php = { "phpcbf" },
      },

      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=file", "-fallback-style=LLVM" },
        },
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ bufnr = 0 })
    end) -- format buffer
  end,
}
