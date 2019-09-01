FROM ubuntu:latest

RUN set -x \
        && apt-get update \
        && apt-get install -y curl git cmake pkg-config libssl-dev ninja-build ccache python3.7-minimal
RUN set -x \
        && curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

RUN set -x \
        && . $HOME/.cargo/env \
        && rustup target add wasm32-unknown-unknown --toolchain nightly \
        && cargo +nightly install wasm-bindgen-cli
RUN set -x \
        && git clone --depth 1 https://github.com/lumen/llvm-project /llvm-project
RUN set -x \
        && git clone --depth 1 https://github.com/lumen/lumen.git $HOME/.local/share/llvm/lumen \
        && cd /lumen \
        && . $HOME/.cargo/env \
        && cargo fetch
# RUN set -x \
#         && cd /llvm-project
#         && make llvm
#         # && llvmenv init \
#         # && llvmenv global /usr/lib/llvm-7 \
#         # && export LLVM_SYS_$(llvmenv version --major --minor)_PREFIX=$(llvmenv prefix) \
RUN set -x \
        && cd $HOME/.local/share/llvm/lumen \
        && make build
