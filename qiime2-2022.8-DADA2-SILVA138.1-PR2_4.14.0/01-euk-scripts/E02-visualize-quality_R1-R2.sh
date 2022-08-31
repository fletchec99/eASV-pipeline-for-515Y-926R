#!/bin/bash -i
conda activate $qiime2version

qiime demux summarize \
--i-data 18s-viz.qza \
--output-dir 02-quality-plots-R1-R2 \
--verbose

conda deactivate
