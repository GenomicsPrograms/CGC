FROM bioconductor/devel_base2

#usage: Rscript potra_corN.R [arguments]

#arguements:
# --mydata.txt
# --genelist.txt
# --Num_sample_normal
# --Num_sample_case
# --PR_quantile
# --output File Name

#MAINTAINER "Margaret Linan" mlinan@asu.edu

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite()'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("BiocGenerics")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("graph")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("graphite")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("igraph")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("org.Hs.eg.db")'

## add json file only for testing purposes see sections below
RUN mkdir -p /usr/bin/potra
COPY PoTRA_Example_Data.RData /usr/bin/potra/
COPY potra_corN_baseCommand.sh /usr/bin/potra/
WORKDIR /usr/bin/potra/
CMD ["bash", "/usr/bin/potra/potra_corN_bashCommand.sh"]
