here::i_am('code/04_render_report.R')


library(rmarkdown)
render("final_report.Rmd", output_file = here::here("final_report.html"))
