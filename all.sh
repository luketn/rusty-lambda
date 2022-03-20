set -euo pipefail

export LAMBDA_ARCHITECTURE=aarch64
# export LAMBDA_ARCHITECTURE=x86_64

./compile.sh
./package.sh
./deploy.sh
