#!/bin/bash

echo "grab random driver and insert into first-order-model"
    driverfile=$(find /home/interactionstation/Projects/Ruben/stylegan2/assets/upload -type f | shuf -n 1) 
    echo "$driverfile"

    echo "grab random file and insert into first-order-model"
    file=$(find /home/interactionstation/Projects/Ruben/stylegan2/driver_videos -type f | shuf -n 1) 
    echo "$file"

    python /home/interactionstation/Projects/Ruben/first-order-model/demo.py  --config /home/interactionstation/Projects/Ruben/first-order-model/config/vox-256.yaml --driving_video $file --source_image $driverfile --checkpoint /home/interactionstation/Projects/Ruben/first-order-model/checkpoints/vox-cpk.pth.tar --relative --adapt_scale

    filename=$(($(date +'%s * 1000 + %-N / 1000000')))
    name="$filename.mp4"

    echo "stuur video naar server"
    scp /home/interactionstation/Projects/Ruben/stylegan2/result.mp4 root@85.214.45.48:/root/projectnaam-api/public/videos/

    echo "verander filenaam van video zodat hij niet overschreven wordt en stuur naar backup folder"
    mv result.mp4 /home/interactionstation/Projects/Ruben/first-order-model/backup-video/$name
