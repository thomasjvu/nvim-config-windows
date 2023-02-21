require("telescope").load_extension "file_browser"

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true <CR>",
  { noremap = true }
)
