set -euo pipefail

rm -rf ./out-deploy
mkdir -p ./out-deploy
cp "./target/${LAMBDA_ARCHITECTURE}-unknown-linux-gnu/release/rusty-lambda" "./out-deploy/bootstrap"
cd ./out-deploy
zip bootstrap bootstrap
ls -lah