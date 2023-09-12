return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      return {
        sources = {
          formatting.stylua,
          formatting.black,
          formatting.clang_format,
          formatting.gofmt,
          formatting.deno_fmt,
          formatting.taplo, -- toml
          formatting.prettier.with({
            extra_filetypes = { "svelte" },
          }),
          formatting.rustfmt.with({
            extra_args = function(params)
              local Path = require("plenary.path")
              local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

              if cargo_toml:exists() and cargo_toml:is_file() then
                for _, line in ipairs(cargo_toml:readlines()) do
                  local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                  if edition then
                    return { "--edition=" .. edition }
                  end
                end
              end
              -- default edition when we don't find `Cargo.toml` or the `edition` in it.
              return { "--edition=2021" }
            end,
          }),
          diagnostics.ruff, -- python
          diagnostics.clang_check,
          diagnostics.commitlint,
          require("typescript.extensions.null-ls.code-actions"),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      }
    end,
  },
}
