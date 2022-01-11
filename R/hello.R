library(tidyverse)
library(NHSRplotthedots)

# read data in from a csv file
# original data is from {NHSRdatasets} package
data <- read_csv("data/example_ae_attendances_data.csv") %>% 
  
  # group and summarise to combine "type 1, 2, and other"
  group_by(org_code, period) %>% 
  summarise(
    attendances = sum(attendances),
    breaches = sum(breaches),
    admissions = sum(admissions),
  ) %>% 
  ungroup()


# filter to a single org_code
rx1_data <- data %>% 
  filter(org_code == "RX1")


# make a basic spc chart
ptd_spc(
  .data = rx1_data,
  value_field = breaches,
  date_field = period
  )

# make the same chart, but fix the limit calcs to the first 20 points
ptd_spc(
  .data = rx1_data,
  value_field = breaches,
  date_field = period,
  fix_after_n_points = 20
  )

# same chart, with some aesthetic presentational changes
# to make presentational changes, use ptd_create_ggplot()
ptd_spc(
  .data = rx1_data,
  value_field = breaches,
  date_field = period,
  fix_after_n_points = 20
  ) %>% 
  ptd_create_ggplot(
    main_title = "Breaches for Organisation RX1",
    x_axis_label = NULL,
    y_axis_label = "Number of Breaches",
    x_axis_date_format = "%b %Y",
    icons_position = "none"
  )

# same chart, with detail added to caption
# we can chain on the labs() call, because ptd_spc returns a ggplot object
ptd_spc(
  .data = rx1_data,
  value_field = breaches,
  date_field = period,
  fix_after_n_points = 20
  ) %>% 
  ptd_create_ggplot(
    main_title = "Breaches for Organisation RX1",
    x_axis_label = NULL,
    y_axis_label = "Number of Breaches",
    x_axis_date_format = "%b %Y",
    icons_position = "none"
  ) + 
    labs(
      caption = "Source: NHSRdatasets example data, Baseline: first 20 points"
  )

# the code below is a simple example of looping through a set of data to produce a set of plots
# define the measures we want spc charts for
measure_names <- c("breaches", "attendances", "admissions")

# this custom function runs an spc plot, and saves it to png file
save_a_chart <- function(name){
  
  # make the plot for the name passed in
  p <- ptd_spc(
    .data = rx1_data,
    value_field = !!{name},
    date_field = period
  ) %>% 
    ptd_create_ggplot()
  
  # save the plot to a file
  ggsave(paste0("output/", name, "_chart.png"), plot = p, device = "png")
  
  # print a message to the user
  message("Plot saved for: ", name, ".  Check output folder.")
  
}

# malk over the measures list, calling save_a_chart() for each requred measure
walk(measure_names, save_a_chart)

# there should now be 3 spc charts in the output folder
