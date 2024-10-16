local config = function()
  -- remap keybinds
  vim.keymap.set("v", "<", "<Plug>(neorg.promo.demote.range)", { buffer = true })
  vim.keymap.set("v", ">", "<Plug>(neorg.promo.promote.range)", { buffer = true })
  vim.keymap.set("n", "<Space>ma", "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)", { buffer = true })
  vim.keymap.set("n", "<Space>mc", "<Plug>(neorg.qol.todo-items.todo.task-cancelled)", { buffer = true })
  vim.keymap.set("n", "<Space>md", "<Plug>(neorg.qol.todo-items.todo.task-done)", { buffer = true })
  vim.keymap.set("n", "<Space>mh", "<Plug>(neorg.qol.todo-items.todo.task-on-hold)", { buffer = true })
  vim.keymap.set("n", "<Space>mi", "<Plug>(neorg.qol.todo-items.todo.task-important)", { buffer = true })
  vim.keymap.set("n", "<Space>mp", "<Plug>(neorg.qol.todo-items.todo.task-pending)", { buffer = true })
  vim.keymap.set("n", "<Space>mr", "<Plug>(neorg.qol.todo-items.todo.task-recurring)", { buffer = true })
  vim.keymap.set("n", "<Space>mu", "<Plug>(neorg.qol.todo-items.todo.task-undone)", { buffer = true })

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
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.journal"] = {
        config = {
          journal_folder = "neorg/journal/"
        }
      },
      ["core.esupports.metagen"] = {
        config = {
          timezone = "implicit-local",
          type = "empty"
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
      },
      ["core.highlights"] = {
        config = {
          highlights = {
            headings = {
              ["1"] = {
                prefix = "+RenderMarkdownH1",
                title = "+RenderMarkdownH1"
              },
              ["2"] = {
                prefix = "+RenderMarkdownH2",
                title = "+RenderMarkdownH2"
              },
              ["3"] = {
                prefix = "+RenderMarkdownH3",
                title = "+RenderMarkdownH3"
              },
              ["4"] = {
                prefix = "+RenderMarkdownH4",
                title = "+RenderMarkdownH4"
              },
              ["5"] = {
                prefix = "+RenderMarkdownH5",
                title = "+RenderMarkdownH5"
              },
              ["6"] = {
                prefix = "+RenderMarkdownH6",
                title = "+RenderMarkdownH6"
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
}
