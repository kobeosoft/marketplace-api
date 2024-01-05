# Base image for building the service
FROM node:21.5.0-alpine as builder

WORKDIR /usr/src/app

# Copier tout le contenu du projet
COPY . .

# Renommer .env.dist en .env
RUN mv .env.dist .env

# Installer les dépendances
RUN npm install

# Argument pour spécifier quel microservice construire
ARG NX_SERVICE

# Construire le microservice spécifique
RUN npx nx build ${NX_SERVICE} --prod

# Étape de production pour créer l'image finale
FROM node:21.5.0-alpine as production

ARG NX_SERVICE
WORKDIR /usr/src/app

# Copier les artefacts de build et les dépendances node_modules du builder
COPY --from=builder /usr/src/app/dist/apps/${NX_SERVICE} ./dist
COPY --from=builder /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "dist/main"]
