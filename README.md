# pkapi
Protocol Buffer API files for the PK Engine

## Overview

This repository contains the Protocol Buffer (proto3) definitions for the **PK Engine Dealer service** and the Python gRPC stubs generated from them.

The `DealerService` manages a poker table: seating players, starting hands, processing player actions, and resolving showdowns.

## Repository Layout

```
proto/
  pkdealer/dealer/v1/dealer.proto   # proto3 source definition
src/
  pkdealer/dealer/v1/               # generated Python stubs (after `make gen`)
    dealer_pb2.py
    dealer_pb2_grpc.py
Makefile                            # build helpers
pyproject.toml                      # Python package metadata
uv.lock                             # pinned dependency lockfile (managed by uv)
```

## Prerequisites

This project uses [uv](https://github.com/astral-sh/uv) for dependency and environment management.

```bash
# Install uv (if not already installed)
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Getting Started

### 1. Install dependencies

```bash
uv sync --extra dev
```

Or using the Makefile:

```bash
make install
```

### 2. Generate Python stubs

```bash
make gen
```

This runs `grpc_tools.protoc` against `proto/pkdealer/dealer/v1/dealer.proto` and writes
`dealer_pb2.py` and `dealer_pb2_grpc.py` into `src/pkdealer/dealer/v1/`.

### 3. Use the stubs

```python
from pkdealer.dealer.v1 import dealer_pb2, dealer_pb2_grpc

# Build a request
request = dealer_pb2.PingRequest(client_id="my-client")
```

## Maintenance

### Updating the lockfile

`uv.lock` is a fully resolved, reproducible snapshot of all dependencies. It should be committed to version control.

```bash
# Re-resolve dependencies and update uv.lock
uv lock

# Re-resolve and immediately sync your environment
uv lock && uv sync --extra dev
```

### Adding or changing dependencies

Edit `pyproject.toml` directly (under `[project].dependencies` or `[project.optional-dependencies]`), then re-lock:

```bash
uv lock
uv sync --extra dev
```

Or use `uv add` to do both in one step:

```bash
# Add a runtime dependency
uv add some-package

# Add a dev-only dependency
uv add --optional dev some-dev-package
```

### Resetting the lockfile

```bash
# Regenerate uv.lock from scratch
rm -f uv.lock && uv lock

# Revert uv.lock to its last committed state (discard local changes)
git restore uv.lock
```

### Running commands in the managed environment

```bash
# Run a one-off command without activating the venv
uv run python -c "import pkdealer"

# Activate the venv manually (optional)
source .venv/bin/activate
```

## Makefile Targets

| Target    | Description                                     |
|-----------|-------------------------------------------------|
| `gen`     | Generate Python gRPC stubs from the proto file  |
| `install` | Install runtime + dev dependencies via `uv sync`|
| `clean`   | Remove generated `*_pb2*.py` stub files         |

## Proto Package

```
pkdealer.dealer.v1
```

Defined in `proto/pkdealer/dealer/v1/dealer.proto`.
