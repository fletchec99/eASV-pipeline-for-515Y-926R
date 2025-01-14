#!/bin/bash -i
mkdir -p data-export/eukfrac data-export/16S/subsetted-ASV-tables data-export/18S/subsetted-ASV-tables
cp *EUKfrac* data-export/eukfrac
cp -r *cfg logs runscripts scripts data-export/

### 16S ###
#associated data
cp 02-PROKs/03-DADA2d/*16S*fasta data-export/16S/
cp 02-PROKs/03-DADA2d/*16S*stats.tsv data-export/16S/
cp 02-PROKs/10-exports/*taxonomy.tsv data-export/16S/

#subsetted tables
cp 02-PROKs/10-exports/*filtered*biom data-export/16S/subsetted-ASV-tables/
cp 02-PROKs/10-exports/*filtered*proportions.tsv data-export/16S/subsetted-ASV-tables/
cp 02-PROKs/10-exports/*filtered*with-tax.tsv data-export/16S/subsetted-ASV-tables/

#whole tables
cp 02-PROKs/10-exports/*all-16S*with*biom data-export/16S/
cp 02-PROKs/10-exports/*all-16S*with-tax.tsv data-export/16S/
cp 02-PROKs/10-exports/*all-16S*with-tax.proportions.tsv data-export/16S/

### 18S ###
#associated data
cp 02-EUKs/08-DADA2d/*18S*fasta data-export/18S/
cp 02-EUKs/08-DADA2d/*18S*stats.tsv data-export/18S/
cp 02-EUKs/15-exports/*taxonomy*.tsv data-export/18S/

#subsetted tables
cp 02-EUKs/15-exports/*filtered*biom data-export/18S/subsetted-ASV-tables/
cp 02-EUKs/15-exports/*filtered*proportions.tsv data-export/18S/subsetted-ASV-tables/
cp 02-EUKs/15-exports/*filtered*with-*tax.tsv data-export/18S/subsetted-ASV-tables/

#whole tables
cp 02-EUKs/15-exports/*all-18S*with*biom data-export/18S/
cp 02-EUKs/15-exports/*all-18S*with-*tax.tsv data-export/18S/
cp 02-EUKs/15-exports/*all-18S*with-*tax.proportions.tsv data-export/18S/

#scripts
cp -r 02-PROKs/scripts/ data-export/16S
cp -r 02-EUKs/scripts/ data-export/18S

echo "This repository contains scripts and data from a custom pipeline for analyzing amplicons from the 515Y/926R primers (https://github.com/jcmcnch/eASV-pipeline-for-515Y-926R). The configuration file included here specifies parameters that the user chose during the analysis. The \`eukfrac\` folder indicates the fraction of eukaryotic sequences in each sample after primer trimming and before denoising. 16S and 18S data tables are presented separately but could be merged if desired, since they are derived from the same samples / sequencing libraries. A number of subsetted ASV tables are available as well (for example, if you wanted to exclude Metazoa, Chloroplasts, or Mitochondria from your ASV table). ASV sequences are exported in a file ending in \*dna-sequences.fasta and denoising statistics as a file ending with \*stats.tsv." > data-export/README.md
