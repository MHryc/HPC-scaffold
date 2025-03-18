#!/bin/bash

chmod +x scripts/*
mkdir -p results/

export WORK_DIR=$(readlink -f .)
export DATA_DIR=$(readlink -f ~/pl0217-01/scratch/4_MHryc/pac_bio_pszenica)

RABBIT="https://depot.galaxyproject.org/singularity/rabbitqcplus:2.3.0--h5ca1c30_1"
singularity exec \
	--bind "$WORK_DIR:/mnt/proj" \
	--bind "$DATA_DIR:/mnt/data" \
	$RABBIT bash -c /mnt/proj/scripts/rabbit.sh
