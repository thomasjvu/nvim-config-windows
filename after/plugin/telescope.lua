local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local sorters = require('telescope.sorters')
local new_sorter = sorters.get_levenshtein_sorter()
new_sorter.sort = function(_, prompt, items, cwd)
  local function folder_sort(item)
    return item.is_directory
  end

  table.sort(items, function(a, b)
    local a_is_dir = folder_sort(a)
    local b_is_dir = folder_sort(b)

    if a_is_dir and not b_is_dir then
      return true
    elseif not a_is_dir and b_is_dir then
      return false
    else
      return new_sorter:score(prompt, a, cwd) < new_sorter:score(prompt, b, cwd)
    end
  end)

  return items
end

require('telescope').setup {
  defaults = {
    sorting_strategy = 'descending',
    sorting_reverse = new_sorter,
  },
}
