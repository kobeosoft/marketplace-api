# Variables
DOCKER_REGISTRY := ghcr.io
VERSION := latest

# Construire et pousser l'image Docker pour un microservice spécifique
build_and_push:
	docker build --build-arg NX_SERVICE=$(SERVICE) -t $(DOCKER_REGISTRY)/kobeosoft/marketplace-api/$(SERVICE):$(VERSION) -f docker/Dockerfile .
	docker push $(DOCKER_REGISTRY)/kobeosoft/marketplace/api/$(SERVICE):$(VERSION)

# Commandes pour construire et déployer chaque microservice
build_pxm:
	make build_and_push SERVICE=pxm

build_oms:
	make build_and_push SERVICE=oms

# Commande par défaut pour construire tous les microservices
all: build_pxm build_oms
