#!/bin/sh -e

if [ "${S3_BUCKET}" == "" ]; then
  printf "Environment variable S3_BUCKET must be set\n"
  exit 1
fi

if [ "${S3_KEY}" == "" ]; then
  printf "Environment variable S3_KEY must be set\n"
  exit 2
fi

printf "Copying down script\n"

aws s3 cp s3://${S3_BUCKET}/${S3_KEY} .

SCRIPT=basename ${S3_KEY}

printf "Executing script ${SCRIPT}\n"

python ./${SCRIPT}
