# A function to explore sampling frequency and learn about its effect on
#  estimates, requires purrr package is installed
# Example call: ste_explore_freq(df, deploy, occ, c(60 * c(1, 5, 10, 30), 3600))
ste_explore_freq <- function(df, deploy, occ, freq) {
  purrr::map_df(
    freq,
    ~ build_occ(
      .x,
      samp_length = 10,
      study_start = study_dates[1],
      study_end = study_dates[2]
    ) %>%
      ste_build_eh(df, deploy, .) %>%
      ste_estN_fn(1e6 * 100) %>%
      mutate(
        Freq = .x
      )
  )
}