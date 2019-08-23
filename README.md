# Polkasource RUST Builder
Polkasource Dockerfile for RUST Builder

## Building a RUST Builder
Clone substrate-client repository
```bash
git clone https://github.com/polkasource/rust-builder.git
```

Change directory
```bash
cd rust-builder
```

Check available releases
```bash
git tag
```

Checkout a particular release
```bash
git checkout [release]
```

Build the RUST Builder [release]
```bash
docker build -t 'polkasource/rust-builder:[release]' .
```
