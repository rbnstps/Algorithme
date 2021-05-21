#!/bin/bash

# while : 
# do
    source /opt/anaconda/anaconda3/etc/profile.d/conda.sh
    conda activate ruben
    echo ${CONDA_PREFIX}

    echo "Training RUben face"
    python run_training.py --num-gpus=1 --data-dir=assets/tfrecords/ --config=config-f --dataset=ruben --total-kimg 200 --gamma=1000

# done