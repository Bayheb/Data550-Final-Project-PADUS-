here::i_am('code/03_make_figure.R')

data_metro <- readRDS(
  file = here::here("output/data_metro.rds"))

library(ggplot2)
# Histogram by group in ggplot2
boxplot_fig <- ggplot(data_metro, aes(x = State_County_FIPS, y = pc_park)) +
  geom_boxplot() + labs(
    title = "Park Percentage by Metro County",
    x = "County",
    y = "Park Percentage"
  )

ggsave(
  filename = here::here("output/boxplot.png"),
  plot = boxplot_fig,
  device="png"

)