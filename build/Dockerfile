FROM rust:1.37.0
# docker run -it --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust:1.37.0 bash
RUN set -x ; \
        rustup default nightly \
        && rustup target add wasm32-unknown-unknown --toolchain nightly \
        && cargo +nightly install wasm-bindgen-cli \
        && cargo install --version 0.1.13 llvmenv \
        && llvmenv init \
        && llvmenv build-entry 7.0.0
RUN set -s ; \
        git clone https://github.com/lumen/lumen.git /lumen \
        && cd /lumen \
        && export LLVENV_RUST_BINDING=1 \
        && source <\(llvmenv zsh\) \
        && make build
