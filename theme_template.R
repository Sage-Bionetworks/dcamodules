custom_theme <- list(
  "primary" =  "blue", # primary status, header, nav
  "accent" =  "red", # accent status
  "dark" =  NULL, # font - dark
  "light" = NULL, # font - light
  "font" = NULL, # font family
  "base-font-cl" = NULL,
  "header-font-cl" = NULL,
  "sidebar-bg-cl" = NULL,
  "sidebar-font-cl" = NULL,
  "sidebar-bg-select-cl" = NULL,
  "sidebar-font-select-cl" = NULL,
  "sidebar-bg-hover-cl" = NULL,
  "sidebar-font-hover-cl" = NULL,
  "footer-bg-cl" = NULL,
  "footer-font-cl" = NULL,
  "waiter-bg-cl" = NULL
)

saveRDS(custom_theme, "theme_config.rds")
