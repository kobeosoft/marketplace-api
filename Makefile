DOCKER_REGISTRY := ghcr.io
VERSION ?= latest  # Default version tag
SERVICES ?= pxm oms  # Default list of services

# Build and push a single service
build_and_push:
	@echo "Building and pushing $(SERVICE):$(VERSION)"
	@docker build --build-arg NX_SERVICE=$(SERVICE) -t $(DOCKER_REGISTRY)/kobeosoft/marketplace/api/$(SERVICE):$(VERSION) -f docker/Dockerfile .
	@docker push $(DOCKER_REGISTRY)/kobeosoft/marketplace/api/$(SERVICE):$(VERSION)

# Build and push all services in the SERVICES list
build_all:
	@for service in $(SERVICES); do \
		$(MAKE) build_and_push SERVICE=$$service; \
	done
