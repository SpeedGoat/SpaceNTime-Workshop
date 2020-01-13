# Read all csv files in a directory

# Get file names, non-recursively
fls <- list.files("path/to/directory", full.names = TRUE, recursive = FALSE)

# Read files into a tibble (i.e. kinder data.frame)
my_dat <- purrr::map_df(
  fls,
  readr::read_csv
)