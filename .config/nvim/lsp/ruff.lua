return {
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",
      configuration = {
        lint = {
          pydocstyle = {
            convention = "numpy",
          },
          ["per-file-ignores"] = {
            ["__init__.py"] = { "E402", "F401" },
            ["test*.py"] = { "S101" },
          },
        },
      },
      lint = {
        select = { "ALL" },
        ignore = { "ANN", "D1", "S311", "FA102", "COM812", "RET504" },
      },
    },
  },
}
