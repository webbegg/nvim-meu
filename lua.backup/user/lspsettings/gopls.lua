return {
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      completion = {
        matcher = "fuzzy",
        usePlaceholders = true,
        addUnimported = true,
      },
      diagnostics = {
        gofumpt = true,
        gci = true,
        gopls = true,
        staticcheck = true,
      },
      experimentalPostfixCompletions = true,
      hoverKind = "SynopsisDocumentation",
      linksInHover = true,
      usePlaceholders = true,
    },
  }
}
