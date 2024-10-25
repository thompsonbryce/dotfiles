return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive"
      },
      view = {
        width = 30
      },
      filters = {
        dotfiles = true
      }
    })

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    vim.keymap.set("n", "<leader><Space>", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")
  end
}
