
# TP DevOps - Automatisation CI

## Présentation
API Node.js avec Express, conteneurisée avec Docker et intégrée à une chaîne CI/CD GitHub Actions.

## Optimisation du cache Docker
Le fichier package.json est copié avant le code source afin de profiter du cache des couches Docker.
Ainsi, si le code change sans modification des dépendances, Docker réutilise la couche d'installation npm.
Cela permet d'accélérer les constructions suivantes.

## Exécution locale
npm install
npm test
npm start

## Exécution Docker
docker build -t tp-devops-api:1.0.0 .
docker run -d -p 3000:3000 tp-devops-api:1.0.0
