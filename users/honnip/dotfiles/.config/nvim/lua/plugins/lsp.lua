return {
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "jay-babu/mason-null-ls.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({ automatic_installation = true })
      require("mason-null-ls").setup({ automatic_installation = true })
    end,
  },
  {
    "folke/neodev.nvim",
    opts = { experimental = { pathStrict = true } },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "folke/neodev.nvim", "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      -- formatting on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end

      -- add to on_attach callback
      local function hover_on_cursor_hold(_, bufnr)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "rounded",
              source = "always",
              prefix = " ",
              scope = "cursor",
            }
            vim.diagnostic.open_float(nil, opts)
          end,
        })
      end

      -- add to on_attach callback
      local function prefer_null_ls(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end

      -- add to on_attach callback
      local lsp_keymap = function()
        require("which-key").register({
          gD = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration" },
          gd = { "<cmd>Telescope lsp_definitions<cr>", "Goto definitions" },
          gi = { "<cmd>Telescope lsp_implementations<cr>", "Goto implementation" },
          gt = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto type definition" },
          gr = { "<cmd>Telescope lsp_references<cr>", "List references" },
          ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
          ["<leader>rn"] = { "<cmd>lua vim.api.nvim_feedkeys(':IncRename ', 'n', false)<cr>", "Rename" },
          K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
          ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
        })
      end

      local cap = require("cmp_nvim_lsp").default_capabilities()
      cap.textDocument.completion.completionItem.snippetSupport = true
      cap.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
      }

      local servers = {
        -- bash
        bashls = {},

        -- c or c++
        clangd = {
          cmd = {
            "clangd",
            "--clang-tidy",
            "--completion-style=bundled",
            "--header-insertion=iwyu",
            "--cross-file-rename",
          },
          init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
          },
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
        },

        -- html
        html = { filetypes = { "html" } },

        -- css
        cssls = {
          on_attach = prefer_null_ls,
        },

        -- json
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
              format = { enable = true },
            },
          },
          commands = {
            Format = {
              function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
              end,
            },
          },
        },

        -- python
        pyright = {
          on_attach = prefer_null_ls,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
              formatting = { provider = "black" },
            },
          },
        },

        rust_analyzer = {
          on_attach = prefer_null_ls,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },

        typescript = function()
          require("typescript").setup({
            server = {
              on_attach = function(client, bufnr)
                prefer_null_ls(client, bufnr)
                lsp_keymap()
              end,
              capabilities = cap,
              root_dir = lspconfig.util.root_pattern("package.json"),
              single_file_support = false,
            },
          })
        end,

        -- lua
        lua_ls = {
          on_attach = prefer_null_ls,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = {
                callSnippet = "Replace",
              },
              runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 4096, -- default 300;
                preloadFileSize = 1024, -- default 100;
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },

        -- deno
        denols = {
          root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        },

        -- slint
        slint_lsp = {},

        -- svelte
        svelte = {},

        -- yaml
        yamlls = {
          settings = {
            yaml = {
              customTags = {
                "!Mode",
                "!Toggle sequence",
                "!Switch scalar",
              },
            },
          },
        },

        -- toml
        taplo = {},
      }

      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          prefix = "~",
        },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
      })

      for server, config in pairs(servers) do
        if type(config) == "function" then
          config()
          goto continue
        end

        config.capabilities = vim.tbl_deep_extend("keep", config.capabilities or {}, cap)

        -- on_attach
        local temp = config.on_attach
        config.on_attach = function(client, bufnr)
          hover_on_cursor_hold(_, bufnr)
          lsp_keymap()
          if temp then
            temp(client, bufnr)
          end
        end

        lspconfig[server].setup(config)
        ::continue::
      end
    end,
  },
}
