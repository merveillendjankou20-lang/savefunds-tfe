# SaveFunds

SaveFunds est une application web de vigilance financière destinée aux PME et SRL belges.

L'objectif de l'application est d'aider un dirigeant à analyser la situation financière de son entreprise avant certaines décisions, notamment un retrait de fonds. SaveFunds centralise différentes données financières, calcule des indicateurs de vigilance et permet de simuler l'impact d'une décision sur la situation de l'entreprise.

Ce projet a été développé dans le cadre d'un stage puis poursuivi et enrichi dans le cadre d'un travail de fin d'études.

## Architecture du projet

Le projet est organisé sous forme de monorepo :

- `savefunds-backend` : API REST Spring Boot, accès aux données, moteur de vigilance, simulations et audit.
- `savefunds-angular` : interface web Angular.
- `docs` : documentation complémentaire du projet.

## Technologies utilisées

### Backend

- Java 21
- Spring Boot
- Spring Data JPA
- Spring Security
- Maven
- PostgreSQL
- Flyway
- Docker

### Frontend

- Angular
- TypeScript
- HTML
- CSS

## Sources de données

SaveFunds exploite différentes sources de données financières et administratives.

### BCE / KBO

La Banque-Carrefour des Entreprises (BCE/KBO) est utilisée pour rechercher et récupérer les informations disponibles sur une entreprise belge à partir de son numéro d'entreprise.

### BNB - Centrale des bilans

SaveFunds exploite également des données provenant des comptes annuels publiés auprès de la Banque nationale de Belgique.

Certaines données annuelles, comme le chiffre d'affaires et les charges, sont transformées en valeurs mensuelles afin de pouvoir être utilisées dans les analyses de l'application.

La trésorerie issue des comptes annuels correspond à une valeur à la date de clôture et ne représente donc pas nécessairement le solde bancaire actuel.

### Autres sources

L'application permet également de gérer des données provenant :

- d'un encodage manuel ;
- d'imports CSV ;
- de données comptables ;
- de données bancaires.

Les données financières utilisées par l'application sont enregistrées sous forme de snapshots financiers permettant notamment de conserver leur source et leur date.

## Fonctionnalités principales

SaveFunds permet notamment :

- l'inscription et l'authentification des utilisateurs ;
- la gestion des entreprises ;
- la recherche d'entreprises via la BCE/KBO ;
- la récupération de données issues des comptes annuels BNB ;
- la gestion de différentes sources financières ;
- la création de snapshots financiers ;
- la simulation de décisions financières ;
- le calcul d'indicateurs de vigilance ;
- la présentation d'un niveau de vigilance global ;
- la consultation de l'historique des simulations ;
- la gestion de l'accès du comptable aux entreprises ;
- la demande de validation d'une décision ;
- l'enregistrement des décisions du comptable ;
- la gestion de notes internes ;
- la traçabilité des opérations au moyen d'un journal d'audit.

## Indicateurs de vigilance

SaveFunds analyse notamment :

- la couverture de trésorerie après décision ;
- le ratio chiffre d'affaires / charges ;
- le compte courant débiteur du dirigeant lorsque cette information est disponible ;
- le rapport entre le montant demandé et le maximum recommandé.

Les indicateurs de SaveFunds s'appuient sur des principes généraux d'analyse financière. Les seuils numériques retenus constituent toutefois des règles métier de vigilance propres à SaveFunds.

## Lancer le backend

Depuis la racine du projet :

```powershell
cd savefunds-backend
docker compose up -d postgres
$env:SPRING_PROFILES_ACTIVE="dev"
.\mvnw.cmd spring-boot:run
```

Le backend est accessible par défaut sur :

```text
http://localhost:8080
```

### Tests backend

```powershell
cd savefunds-backend
.\mvnw.cmd test
```

## Lancer le frontend

Depuis la racine du projet :

```powershell
cd savefunds-angular
npm install
npm start
```

L'application Angular communique avec le backend disponible sur :

```text
http://localhost:8080
```

### Build Angular

```powershell
cd savefunds-angular
npm run build
```

## Structure du projet

```text
savefunds/
├── savefunds-angular/       # Frontend Angular
├── savefunds-backend/       # Backend Spring Boot
├── docs/                    # Documentation
├── README.md
└── .gitignore
```

## Évolutions prévues

Les principales évolutions envisagées sont :

- l'enrichissement de l'espace comptable ;
- l'intégration bancaire réelle via PSD2/Open Banking ;
- l'amélioration de l'extraction de données depuis des documents PDF ou des images ;
- l'envoi d'alertes par e-mail ;
- les projections financières à 30, 60 et 90 jours ;
- l'authentification via eID, itsme ou CSAM ;
- la vérification du mandat légal du dirigeant ;
- le renforcement de la sécurité et des aspects liés au RGPD ;
- le déploiement sécurisé en HTTPS.

## Contexte académique

Projet réalisé dans le cadre d'un travail de fin d'études en informatique.

SaveFunds est un outil d'aide à l'analyse et à la vigilance financière. Les résultats produits par l'application ne remplacent pas l'avis d'un comptable ou d'un professionnel qualifié.
