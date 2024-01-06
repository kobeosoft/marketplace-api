DOCKER_REGISTRY := ghcr.io
VERSION ?= latest  # Default version tag
SERVICES ?= pxm oms  # Default list of services

# Dynamic build and push command for each service
build_and_push:
	@for service in $(SERVICES); do \
		echo "Building and pushing $$service:$(VERSION)"; \
		docker build --build-arg NX_SERVICE=$$service -t $(DOCKER_REGISTRY)/kobeosoft/marketplace/api/$$service:$(VERSION) -f docker/Dockerfile .; \
		docker push $(DOCKER_REGISTRY)/kobeosoft/marketplace/api/$$service:$(VERSION); \
	done

# Default command to build all microservices in the SERVICES list
all: build_and_push
