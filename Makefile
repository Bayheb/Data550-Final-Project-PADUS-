final_report.html: final_report.Rmd code/04_render_report.R output/data_metro.rds output/table1.rds output/boxplot.png
	Rscript code/04_render_report.R
	
output/data_metro.rds: code/01_load_clean_data.R
	Rscript code/01_load_clean_data.R
	
output/table1.rds: code/02_make_table.R output/data_metro.rds
	Rscript code/02_make_table.R

output/boxplot.png: code/03_make_figure.R output/data_metro.rds
	Rscript code/03_make_figure.R
	
.PHONY: clean
clean:
	rm -f output/*