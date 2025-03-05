local config = function()
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = "norg",
    callback = function()
      -- remap keybinds
      vim.keymap.set("n", "<Space>nn", "<Plug>(neorg.dirman.new-note)", { buffer = true })
      vim.keymap.set("n", "<Space>tc", "<cmd>Neorg toc<CR>", { buffer = true })

      vim.keymap.set("i", "<C-d>", "<Plug>(neorg.promo.demote)", { buffer = true })
      vim.keymap.set("i", "<C-t>", "<Plug>(neorg.promo.promote)", { buffer = true })
      vim.keymap.set("i", "<M-CR>", "<Plug>(neorg.itero.next-iteration)", { buffer = true })
      vim.keymap.set("i", "<M-d>", "<Plug>(neorg.tempus.insert-date.insert-mode)", { buffer = true })

      vim.keymap.set("n", "<.", "<Plug>(neorg.promo.demote)", { buffer = true })
      vim.keymap.set("n", "<<", "<Plug>(neorg.promo.demote.nested)", { buffer = true })
      vim.keymap.set("n", "<C-Space>", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", { buffer = true })
      vim.keymap.set("n", "<CR>", "<Plug>(neorg.esupports.hop.hop-link)", { buffer = true })
      vim.keymap.set("n", "<Space>cm", "<Plug>(neorg.looking-glass.magnify-code-block)", { buffer = true })
      vim.keymap.set("n", "<Space>id", "<Plug>(neorg.tempus.insert-date)", { buffer = true })
      vim.keymap.set("n", "<Space>li", "<Plug>(neorg.pivot.list.invert)", { buffer = true })
      vim.keymap.set("n", "<Space>lt", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
      vim.keymap.set("n", "<Space>ma", "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)", { buffer = true })
      vim.keymap.set("n", "<Space>mc", "<Plug>(neorg.qol.todo-items.todo.task-cancelled)", { buffer = true })
      vim.keymap.set("n", "<Space>md", "<Plug>(neorg.qol.todo-items.todo.task-done)", { buffer = true })
      vim.keymap.set("n", "<Space>mh", "<Plug>(neorg.qol.todo-items.todo.task-on-hold)", { buffer = true })
      vim.keymap.set("n", "<Space>mi", "<Plug>(neorg.qol.todo-items.todo.task-important)", { buffer = true })
      vim.keymap.set("n", "<Space>mp", "<Plug>(neorg.qol.todo-items.todo.task-pending)", { buffer = true })
      vim.keymap.set("n", "<Space>mr", "<Plug>(neorg.qol.todo-items.todo.task-recurring)", { buffer = true })
      vim.keymap.set("n", "<Space>mu", "<Plug>(neorg.qol.todo-items.todo.task-undone)", { buffer = true })
      vim.keymap.set("n", "<M-CR>", "<Plug>(neorg.esupports.hop.hop-link.vsplit)", { buffer = true })
      vim.keymap.set("n", "<M-t>", "<Plug>(neorg.esupports.hop.hop-link.tab-drop)", { buffer = true })
      vim.keymap.set("n", ">.", "Plug>(neorg.promo.promote)", { buffer = true })
      vim.keymap.set("n", ">>", "Plug>(neorg.promo.promote.nested)", { buffer = true })

      vim.keymap.set("v", "<", "<Plug>(neorg.promo.demote.range)", { buffer = true })
      vim.keymap.set("v", ">", "<Plug>(neorg.promo.promote.range)", { buffer = true })
    end,
  })

  require("neorg").setup({
    load = {
      ["core.defaults"] = {
        config = {
          disable = {
            "core.esupports.metagen",
            "core.journal",
          }
        }
      },
      ["core.keybinds"] = {
        config = {
          default_keybinds = false
        }
      },
      ["core.summary"] = {},
      -- ["core.latex.renderer"] = {},
      ["core.export"] = {},
      ["core.dirman"] = {
        config = {
          default_workspace = "documents",
          workspaces = {
            documents = "~/Documents/neorg",
            physics = "~/Documents/neorg/uni/fisica",
            asd = "~/Documents/neorg/uni/algoritmi-strutture-dati",
          },
          index = "index.norg"
        }
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.journal"] = {
        config = {
          journal_folder = "journal",
          workspace = "documents"
        }
      },
      ["core.esupports.metagen"] = {
        config = {
          timezone = "implicit-local",
          type = "auto"
        }
      },
      ["core.concealer"] = {
        config = {
          icons = {
            heading = {
              icons = { "󰲠", "󰲢", "󰲤", "󰲦", "󰲨", "󰲪" },
            },
            todo = {
              cancelled = { icon = "" },
              pending = { icon = "󰔛" },
              uncertain = { icon = "" },
              urgent = { icon = "" },
            },
            code_block = {
              conceal = true,
              width = "content",
              padding = {
                right = 1,
              }
            }
          }
        }
      }
    }
  })
end

return {
  "nvim-neorg/neorg",
  lazy = true,
  ft = "norg",
  cmd = "Neorg",
  version = "*", -- Pin Neorg to the latest stable release
  config = config,
  -- dependencies = { "3rd/image.nvim" }
}
