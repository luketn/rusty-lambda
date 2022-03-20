set -euo pipefail

docker run --rm -v $(pwd):/code --platform linux/arm64 --name rust-lambda-compiler luketn/rust-lambda-compiler build --release --target aarch64-unknown-linux-gnu
#docker run --rm -v $(pwd):/code --name rust-lambda-compiler luketn/rust-lambda-compiler || echo "Already running"
#docker exec rust-lambda-compiler cargo build --release --target aarch64-unknown-linux-gnu

rm -rf ./out-deploy
mkdir -p ./out-deploy
cp ./target/aarch64-unknown-linux-gnu/release/rusty-lambda ./out-deploy/bootstrap
cd ./out-deploy
zip bootstrap bootstrap
ls -lah