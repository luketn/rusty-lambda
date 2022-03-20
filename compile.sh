set -euo pipefail

cargo build --release --target "${LAMBDA_ARCHITECTURE}-unknown-linux-gnu"