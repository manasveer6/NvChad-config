local opts = {
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
  },
  renderer = {
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "M",
          staged = "M",
          renamed = "R",
          untracked = "U",
        },
      },
      git_placement = "after",
    },
  },
  view = {
    centralize_selection = true,
  },
  diagnostics = {
    enable = true,
  },
}

return opts
