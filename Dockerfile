# ===== START FIRST STAGE ======
FROM phusion/baseimage:0.11 as builder
LABEL maintainer "support@polkasource.com"
LABEL description="RUST Builder Image."

ARG PROFILE=release
WORKDIR /rustbuilder
COPY . /rustbuilder

# PREPARE OPERATING SYSTEM & BUILDING ENVIRONMENT
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y cmake pkg-config libssl-dev git clang libclang-dev 
	
# CHECKOUT GIT SUBMODULES
#RUN git submodule update --init --recursive
	
# UPDATE RUST DEPENDENCIES
ENV RUSTUP_HOME "/rustbuilder/.rustup"
ENV CARGO_HOME "/rustbuilder/.cargo"
RUN curl -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH "$PATH:/rustbuilder/.cargo/bin"
RUN rustup update nightly
RUN RUSTUP_TOOLCHAIN=stable cargo install --git https://github.com/alexcrichton/wasm-gc

# BUILD RUNTIME AND BINARY
#RUN rustup target add wasm32-unknown-unknown --toolchain nightly
#RUN cd /rustbuilder/$REPOSITORY/scripts && ./build.sh
#RUN cd /rustbuilder/$REPOSITORY && RUSTUP_TOOLCHAIN=stable cargo build --$PROFILE
# ===== END FIRST STAGE ======