# create vectors of data for three medical patients
subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)

# access the second element in body temperature vector
temperature[2]

## examples of accessing items in vector
# include itens in the range 2 to 3
temperature[2:3]

# exclude them 2 using the minus sign
temperature[-2]

# use a vector to indicate whether to include iten
temperature[c(TRUE, TRUE, FALSE)]
