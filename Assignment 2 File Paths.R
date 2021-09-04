csv_files <- list.files(path = "Data", pattern = ".csv", 
                        full.names = TRUE, recursive = TRUE)

length(csv_files)

wingspan_data_file <- "Data/wingspan_vs_mass.csv"

df <- read.csv(wingspan_data_file, header = TRUE)

head(df, 5)

list.files(recursive = TRUE, full.names = FALSE, pattern = "^b")

