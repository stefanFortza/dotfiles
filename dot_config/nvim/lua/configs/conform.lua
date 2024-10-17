local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    python = { "black" },
    sql = { "sqlfmt" },
    haskell = { "fourmolu" },
    bash = { "beautysh" },
    sh = { "beautysh" },
    zsh = { "beautysh" },
    csh = { "beautysh" },

    java = { "google-java-format" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "gofmt" },
    ruby = { "rubocop" },
    php = { "php-cs-fixer" },
    rust = { "rustfmt" },
    kotlin = { "ktlint" },
    swift = { "swift-format" },
    r = { "styler" },
    tex = { "latexindent" },
    scala = { "scalafmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
