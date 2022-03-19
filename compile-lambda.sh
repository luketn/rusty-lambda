set -euo pipefail

docker run -it --rm -v $(pwd):/code --name rust-lambda-compiler -d --entrypoint /bin/bash rust-lambda-compiler || echo "Already running"
docker exec -it rust-lambda-compiler cargo build --release --target aarch64-unknown-linux-gnu

rm -rf ./out-deploy
mkdir -p ./out-deploy
cp ./target/aarch64-unknown-linux-gnu/release/rusty-lambda ./out-deploy/bootstrap
cd ./out-deploy
zip bootstrap bootstrap
ls -lah