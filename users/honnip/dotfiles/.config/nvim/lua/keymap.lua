local wk = require("which-key")
wk.setup({
  layout = {
    align = "center",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "<cr>", "call", "lua", "^:", "^ " },
})

-- LSP keymaps are at plugins/lsp.lua
wk.register({
  ["<leader>f"] = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    n = { "<cmd>enew<cr>", "New File" },
    b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
  },
  ["<leader>g"] = {
    name = "Git",
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Buffer's commits" },
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
    s = { "<cmd>Telescope git_status<cr>", "Status" },
    S = { "<cmd>Telescope git_stash<cr>", "Stash" },
  },
  ["<leader><tab>"] = {
    function()
      if vim.fn.bufname():match("NvimTree_") then
        require("nvim-tree.api").tree.close()
      else
        require("nvim-tree.api").tree.focus()
      end
    end,
    "Tree",
  },
  ["<leader>w"] = {
    a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace" },
    d = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace" },
    l = { "<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>", "List workspaces" },
  },
  ["<leader>`"] = { "<cmd>TroubleToggle<cr>", "Trouble" },
  ["<leader>/"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  ["<leader>]"] = { "<cmd>bn<cr>", "Go previous buffer" },
  ["<leader>["] = { "<cmd>bp<cr>", "Go next buffer" },
  ["<leader>q"] = { "<cmd>bd<cr>", "Close current buffer" },
})
