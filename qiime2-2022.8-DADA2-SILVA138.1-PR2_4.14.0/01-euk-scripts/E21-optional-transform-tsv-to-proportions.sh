#!/bin/bash -i

conda activate qiime2-2019.4

#PR2

for item in `ls 20-exports/04-converted-biom-to-tsv/PR2/*biom.tsv`; do
	
	outdir=`dirname $item`
	filestem=`basename $item .tsv`

	transform-ESV-tsv-to-proportions.py --input $item --output $outdir/$filestem.proportions.tsv --minimum_abundance_filtered_output $outdir/$filestem.proportions-minabund-0.01.tsv --minimum_abundance_threshold 0.01 --cumulative_abundance_filtered_output $outdir/$filestem.proportions-cumabund-0.99.tsv --cumulative_abundance_threshold 0.99

done

#SILVA138

for item in `ls 20-exports/04-converted-biom-to-tsv/SILVA138/*biom.tsv`; do

        outdir=`dirname $item`
        filestem=`basename $item .tsv`

        transform-ESV-tsv-to-proportions.py --input $item --output $outdir/$filestem.proportions.tsv --minimum_abundance_filtered_output $outdir/$filestem.proportions-minabund-0.01.tsv --minimum_abundance_threshold 0.01 --cumulative_abundance_filtered_output $outdir/$filestem.proportions-cumabund-0.99.tsv --cumulative_abundance_threshold 0.99

done
