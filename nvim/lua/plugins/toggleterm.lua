local init = function()
  local keymap = vim.keymap
  keymap.set("n", "<C-t>", ":ToggleTerm<Enter>",
    { noremap = true, silent = true, desc = "Terminal (ToggleTerm)" }) -- Terminal
  keymap.set("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<Enter>")
  keymap.set("n", "<Space>g", ":ToggleLazyGit<Enter>",
    { noremap = true, silent = true, desc = "LazyGit (ToggleTerm)" }) -- LazyGit
end

local config = function()
  require("toggleterm").setup {
    autochdir = false,
    direction = "float",
    open_mapping = [[<c-t>]],
    terminal_mappings = true,
    start_in_insert = true,
    float_opts = {
      border = "curved",
    },
    on_open = function(term)
      local cwd = vim.fn.getcwd()
      if term.dir ~= cwd then
        term:send("cd " .. cwd .. " && clear")
        term.dir = cwd
      end
    end,
  }
  local Terminal = require("toggleterm.terminal").Terminal
  local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
  }

  -- LazyGit
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", ":close<Enter>", opts)
    end,
    -- function to run on closing the terminal
    on_close = function()
      vim.cmd("startinsert!")
    end,
  })
  local function toggle_lazygit()
    lazygit:toggle()
  end
  vim.api.nvim_create_user_command("ToggleLazyGit", toggle_lazygit, {})
end

return {
  "akinsho/toggleterm.nvim",
  lazy = true,
  cmd = { "ToggleTerm", "ToggleLazyGit" },
  init = init,
  config = config,
}
