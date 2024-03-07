-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>m"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
    -- ["<leader>fg"] = { "<cmd>:TodoTelescope<cr>", desc = "Search TODOs" },
    -- ["<leader>fg"] = { function() require("folke/todo-comments.nvim") end, desc = "Search TODO" },
    ["ö"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
    ["Ö"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
    ["<leader>å"] = { "<cmd>Coverage<cr>", desc = "Enable coverage" },
    ["<leader>lm"] = { "<cmd>GoFillStruct<cr>", desc = "Fill Go struct" },
    ["å"] = { "<cmd>GoAlt<cr>", desc = "Alternate file" },
    ["ä"] = { "i<cr><Esc>", desc = "Insert linebreak" },
    ["Z"] = { "zz", desc = "Center view" },
    ["ZZ"] = { "zt", desc = "Top view" },
    ["<leader>,"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
    ["§"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>lk"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous diagnostic" },
    ["<leader>lj"] = { function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },
    ["<C-j>"] = { function() vim.lsp.codelens.run() end, desc = "LSP CodeLens run" },
    ["<C-k>"] = { function() vim.lsp.buf.code_action() end, desc = "LSP code action" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>fs"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      desc = "Search symbols",
    },
    ["°"] = { function() require("aerial").toggle() end, desc = "Symbols outline" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  i = {
    ["<C-g>"] = { function() vim.lsp.buf.signature_help() end },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
