#!/usr/bin/env bash

set -ex

# Set conda CC as custom CC in Rust
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=$CC

# Print Rust version
rustc --version

# Apply PEP517 to install the package
maturin build --release -i $PYTHON

# Bundle licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

# Install wheel manually
cd target/wheels
$PYTHON -m pip install *.whl
