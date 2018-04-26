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
ADD src/potra_corN.R /usr/local/bin/
ADD src/potra_corN_baseCommand.sh /usr/local/bin/

CMD ["bash", "/usr/local/bin/potra_corN_bashCommand.sh"]
