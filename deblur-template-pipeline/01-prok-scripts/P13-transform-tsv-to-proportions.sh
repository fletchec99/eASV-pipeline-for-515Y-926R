#!/bin/bash

for item in `ls exports/*.with-tax.tsv`
	do
	outdir=`echo $item | cut -d\/ -f1`
	filestem=`basename $item .tsv`
	transform-ESV-tsv-to-proportions.py --input $item --output $outdir/$filestem.proportions.tsv --minimum_abundance_filtered_output $outdir/$filestem.proportions-minabund-0.01.tsv --minimum_abundance_threshold 0.01 --cumulative_abundance_filtered_output $outdir/$filestem.proportions-cumabund-0.99.tsv --cumulative_abundance_threshold 0.99
done
