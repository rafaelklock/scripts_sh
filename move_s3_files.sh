#!/bin/bash

#
# 03-08-2020
# Mover arquivos para .pdf no s3
# Rafael Klock
#

PROFILE=''
S3_BUCKET='my_bucket'
S3_DIR='meudir/sub_dir/01/03/teste'


LISTA=$(aws --profile ${PROFILE} s3 ls s3://${S3_BUCKET}/${S3_DIR}/|awk '{print $4}' |grep -v pdf|grep -v 'json.gz' | sort -r)

for arquivo in ${LISTA}; do
        echo "movendo arquivo: ${arquivo} para ${arquivo}.pdf"
        echo aws --profile ${PROFILE} s3 mv s3://${S3_BUCKET}/${S3_DIR}/${arquivo} s3://${S3_BUCKET}/${S3_DIR}/${arquivo}.pdf &
        sleep 1.5

done
