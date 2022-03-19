set -euo pipefail

cd rust-lambda-compiler
docker build -t rust-lambda-compiler .
cd ..

docker run -it --rm -v $(pwd):/code rust-lambda-compiler build --release --target aarch64-unknown-linux-gnu
rm -rf ./out-deploy
mkdir -p ./out-deploy
cp ./target/aarch64-unknown-linux-gnu/release/rusty-lambda ./out-deploy/bootstrap
cd ./out-deploy
zip bootstrap bootstrap
