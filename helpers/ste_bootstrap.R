# A function to bootstrap space to event estimates
# A pull request has been issued that will add this to package
ste_bootstrap <- function(df, deploy, occ, reps) {
  purrr::map_df(
    1:reps,
    ~ ste_build_eh(df, deploy, occ) %>%
      ste_estN_fn(1e6 * 100)
  )
}