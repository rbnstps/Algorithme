echo "hallo"

if added img detected
    

    #conversion
    python dataset_tool.py create_from_images fractal_realities/tfrecords fractal_realities/dataset
    
    
    #training
    python run_training.py --num-gpus=1 --data-dir=fractal_realities/ --config=config-f --dataset=dataset --total-kimg 1 --gamma=1

    