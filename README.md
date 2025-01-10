# Week 9 Assignment

## Overview
This repository contains the solution for Week 9, where we:
1. Created a dataset (`analysis.R`) with variables: `participant_id`, `age`, `gender`, `mean_reaction_time`, `depression`, and `average_sleep`.
2. Wrote a function (`functions.R`) to compute descriptive statistics for the dataset.

## Files
1. **`analysis.R`**:  
   - Generates the dataset.  
   - Uses `functions.R` to calculate and print descriptive statistics.  

2. **`functions.R`**:  
   - Includes the `create_descriptive_stats()` function:
     - Calculates min, max, and mean for numeric variables.
     - Reports levels and counts for categorical variables.
     - Supports filtering by participant range (`subject_start` and `subject_end`).
     - Returns an error if the dataset has <10 rows.

3. **`README.md`**:  
   - Explains the project and its files.
