#!/bin/bash

log=$(date +%s)
rm *.log
python ultra.py >> $log.log &&
python final_upload.py >> $log.log &&

echo "run"
