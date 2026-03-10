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
```

## Getting Started

### 1. Install dependencies

```bash
pip install -e ".[dev]"
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

## Makefile Targets

| Target    | Description                                     |
|-----------|-------------------------------------------------|
| `gen`     | Generate Python gRPC stubs from the proto file  |
| `install` | Install runtime + dev dependencies via pip      |
| `clean`   | Remove generated `*_pb2*.py` stub files         |

## Proto Package

```
pkdealer.dealer.v1
```

Defined in `proto/pkdealer/dealer/v1/dealer.proto`.
