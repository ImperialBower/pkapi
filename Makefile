PROTO_SRC_DIR  := proto
PROTO_OUT_DIR  := src
PROTO_FILE     := pkdealer/dealer/v1/dealer.proto

.PHONY: gen clean install

## Generate Python gRPC stubs from the proto file
gen:
	python -m grpc_tools.protoc \
		--proto_path=$(PROTO_SRC_DIR) \
		--python_out=$(PROTO_OUT_DIR) \
		--grpc_python_out=$(PROTO_OUT_DIR) \
		$(PROTO_FILE)

## Install runtime and development dependencies
install:
	pip install -e ".[dev]"

## Remove generated Python stub files
clean:
	find $(PROTO_OUT_DIR) -name "*_pb2*.py" -delete
