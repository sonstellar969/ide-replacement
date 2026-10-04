require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- IDE navigation and tools
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer: toggle" })
map("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal: toggle bottom" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Open buffers" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics: all buffers" })

-- DAP mappings are defined here too so they win over NvChad's default <leader>b mapping.
local dap = require "dap"
local dapui = require "dapui"
map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
map("n", "<leader>du", dapui.toggle, { desc = "Debug: toggle UI" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
