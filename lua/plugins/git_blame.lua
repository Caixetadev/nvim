return {
  'f-person/git-blame.nvim',
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<CR>",  desc = "Blame Toggle"  },
    { "<leader>go", "<cmd>GitBlameOpenCommitURL<CR>",  desc = "Open Commit URL"  },
    { "<leader>gO", "<cmd>GitBlameOpenFileURL<CR>",  desc = "Open File URL"  },
    { "<leader>gch", "<cmd>GitBlameCopySHA<CR>",  desc = "Copy Blame Commit SHA"  },
    { "<leader>gcu", "<cmd>GitBlameCopyCommitURL<CR>",  desc = "Copy Commit URL"  },
    { "<leader>gcf", "<cmd>GitBlameCopyFileURL<CR>",  desc = "Copy File URL"  },
  },
  config = function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_message_when_not_committed = "Not yet?"
  end
}
