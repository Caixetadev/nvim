return {
  "RRethy/vim-illuminate",
  enabled = true,
  event = { "BufRead", "BufNewFile" },
  config = function()
    local illuminate = require("illuminate")

    illuminate.configure({
      filetypes_denylist = {
        "alpha",
        "NvimTree",
      },

      under_cursor = true,
    })

    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        illuminate["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
  end,
}
