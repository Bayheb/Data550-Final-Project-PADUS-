FROM rocker/tidyverse:4.5.1 as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

COPY renv.lock renv.lock
COPY .Rprofile .
COPY renv/activate.R renv/
COPY renv/settings.json renv/

RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE=/home/rstudio/project/renv/.cache

RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"
RUN Rscript -e "renv::restore(prompt = FALSE)"

### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ###
FROM rocker/tidyverse:4.5.1
RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project . 

COPY Makefile . 
COPY final_report.Rmd .

RUN mkdir code 
RUN mkdir output
RUN mkdir data

COPY data/padus_ar_cov_trct.csv data
COPY code code

RUN mkdir final_report

CMD make && mv final_report.html final_report