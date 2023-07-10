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
    ["å"] = { "<cmd>GoAlt<cr>", desc = "Alternate file" },
    ["<leader>,"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
