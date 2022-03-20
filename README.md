# Rusty Lambda

Uses the AWS Labs Rust runtime to compile and deploy a static binary (provided.al2) Lambda hooked up to API Gateway events:  
https://services.mycodefu.com/rust/rusty-lambda

Ref: https://github.com/awslabs/aws-lambda-rust-runtime


## Setup Cross-Compilation Mac OS X
Run this:
```
brew tap messense/macos-cross-toolchains
brew install aarch64-unknown-linux-gnu
brew install x86_64-unknown-linux-gnu
```

Setup the .cargo/config.toml file with this:
```
[target.aarch64-unknown-linux-gnu]
linker = "aarch64-unknown-linux-gnu-gcc"

[target.x86_64-unknown-linux-gnu]
linker = "x86_64-unknown-linux-gnu-gcc"
```

Ref: https://github.com/messense/homebrew-macos-cross-toolchains
