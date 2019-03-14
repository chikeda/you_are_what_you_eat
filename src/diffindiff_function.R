rm(list = ls())

library("ggplot2")
library("broom")

repodir <- "J:/temp/chikeda/2018/180606_Jeff_FinalProj/" ### filepath to repo and data folder

dataset <- read.csv(paste0(repodir, "ntd_prev.csv"))
locnames <- read.csv(paste0(repodir, "locnames.csv"))

dataset <- merge(dataset, locnames, by = "location_id", all.x = TRUE)

diff_in_diff <- function(control_loc, experiment_loc, sex, age){
locations <- c(experiment_loc, control_loc)

first_data <- subset(dataset, dataset$sex_id == sex & dataset$location_id %in% locations & dataset$age_group_id == age)
test <- lm(mean ~ 0 + location_name + year_id + mean_maize.csv, data = first_data)
tidyd <- broom::tidy(test)
print(tidyd)

control <- subset(first_data, first_data$location_id == control_loc)
experiment_pre <- subset(first_data, first_data$location_id == experiment_loc & first_data$mean_maize.csv == 0)
experiment_post <- subset(first_data, first_data$location_id == experiment_loc & first_data$mean_maize.csv == 1)

did_plot <- ggplot()+
  geom_point(data = control, aes(x=year_id, y = mean)) + stat_smooth(data = control, aes(x=year_id, y = mean), method = "lm", formula = y~x) +
  geom_point(data = experiment_pre, aes(x=year_id, y = mean)) + stat_smooth(data = experiment_pre, aes(x=year_id, y = mean), color = "red", method = "lm", formula = y~x) +
  geom_point(data = experiment_post, aes(x=year_id, y = mean)) + stat_smooth(data = experiment_post, aes(x=year_id, y = mean), color = "green", method = "lm", formula = y~x) +
  xlab("Year") + ylab("Prevalence of Neural Tube Defects (per 10,000)")

print(did_plot)
}

