#!/bin/bash

while : 
do
    source /opt/anaconda/anaconda3/etc/profile.d/conda.sh
    conda activate ruben
    echo ${CONDA_PREFIX}

    echo "Dataset to TFRecords"
    python dataset_tool.py create_from_images assets/tfrecords/ruben_512/ assets/datasets/ruben_512/

    echo "Training Ruben face"
    python run_training.py --num-gpus=1 --data-dir=assets/tfrecords/ --config=config-f --dataset=ruben_512 --total-kimg 401 --gamma=1000

    echo "Stuur naar VPS"
    scp assets/upload/* root@85.214.45.48:/root/projectnaam-api/public/images/

    echo "Delete upload"
    rm -rf assets/upload/*

done