# Create the function
create_descriptive_stats <- function(data, subject_start = NULL, subject_end = NULL) {
  
  # Check if the data has less than 10 observations
  if (nrow(data) < 10) {
    stop("data is too short")
  }
  
  # Filter data by subject range if specified
  if (!is.null(subject_start) & !is.null(subject_end)) {
    data <- data[data$participant_id >= subject_start & data$participant_id <= subject_end, ]
  }
  
  # Initialize results data frame
  results <- data.frame(
    Variable = character(),
    Type = character(),
    Minimum = numeric(),
    Maximum = numeric(),
    Mean = numeric(),
    Levels = character(),
    Counts = character(),
    stringsAsFactors = FALSE
  )
  
  # Loop through columns
  for (col_name in names(data)) {
    col_data <- data[[col_name]]
    col_class <- class(col_data)
    
    # For numeric variables
    if (col_class %in% c("numeric", "integer")) {
      results <- rbind(results, data.frame(
        Variable = col_name,
        Type = "Numeric",
        Minimum = min(col_data, na.rm = TRUE),
        Maximum = max(col_data, na.rm = TRUE),
        Mean = mean(col_data, na.rm = TRUE),
        Levels = NA,
        Counts = NA
      ))
    }
    
    # For categorical variables (character or factor)
    else if (col_class %in% c("character", "factor")) {
      levels <- unique(col_data)
      counts <- sapply(levels, function(x) sum(col_data == x, na.rm = TRUE))
      results <- rbind(results, data.frame(
        Variable = col_name,
        Type = "Categorical",
        Minimum = NA,
        Maximum = NA,
        Mean = NA,
        Levels = paste(levels, collapse = ", "),
        Counts = paste(counts, collapse = ", ")
      ))
    }
  }
  
  # Return results
  return(results)
}
