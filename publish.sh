#!/bin/bash

aws s3 cp ./index.sh s3://travis.nigiri.network/index.sh \
  --content-type 'text/plain' \
  --cache-control 'max-age=60' \
  --acl public-read

aws cloudfront create-invalidation \
  --distribution-id E32HHJ8813LTZ3 \
  --paths '/*'