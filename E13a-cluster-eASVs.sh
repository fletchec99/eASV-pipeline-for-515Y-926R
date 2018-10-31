#!/bin/bash

source activate qiime2-2018.8-vsearch-hacked

clusteringlevel=$1

if [[ ${#1} -eq 0 ]] ; then
    echo 'Please enter a clustering level for VSEARCH. e.g. E13a-cluster-eASVs-99pc.sh 99'
    exit 0
fi

qiime vsearch cluster-features-de-novo \
	--i-sequences 09-deblurred/representative_sequences.qza \
	--i-table 09-deblurred/table.qza \
	--p-perc-identity 0.$clusteringlevel \
	--p-threads 10 \
	--output-dir clustered-eASVs-99pc \
	--verbose

source deactivate 

echo "Don't forget to copy your UC file manually as noted in the protocol documentation. This information may come in handy later!"