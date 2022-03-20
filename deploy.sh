set -euo pipefail

aws s3 cp ./out-deploy/bootstrap.zip s3://rusty-lambda-deploy/bootstrap.zip
aws lambda update-function-code --function-name rusty-lambda --s3-bucket rusty-lambda-deploy --s3-key bootstrap.zip
