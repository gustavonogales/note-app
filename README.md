# Notes

Aplicação web e mobile para anotações rápidas.

![Homepage web](.github/web_home.png)
---
![Homepage app](.github/mobile_home.png)
---

## Requisitos

- [NodeJS 12.*](https://nodejs.org/en/download/)
- [Yarn 1.*](https://yarnpkg.com/getting-started/install/)
- [Flutter 3.*](https://docs.flutter.dev/get-started/install)

## Tecnologias/Frameworks

- [NestJs](https://nestjs.com/)
- [React](https://github.com/facebook/react)
- [Flutter](https://flutter.dev)

<!-- ## Padrões de projeto

- *Clean Architecture* -->

## Running the API

This project utilizes PostgreSQL, to create the database and run the migrations you need to run the following commands:
```
cp .env.example .env 
yarn
docker-compose up -d
```
Run the API (dev mode):

```shell script
yarn start:dev
```

## Endpoints API

**URL**: http://localhost:3000

### User [All with bearer token except POST]
- **[Create] Post:** /user
- **[Update Info] Patch:** /user
- **[Update Avatar] Patch:** /user/avatar

### Session [SignIn]
- **[Create] Post:** /session
- **[Refresh] Post:** /session/refresh

### Note  [All with bearer token]
- **[Create] Post:** /note
- **[Show All] Get:** /note
- **[Show] Get ID:** /note/{id}
- **[Delete] Delete:** /note/{id}
- **[Update] Patch:** /note/{id}


Obs: Está disponível nesse repositório o arquivo json para importação no [Insomnia](https://insomnia.rest/download/).


## How to delete your account

1. Go to your profile details by clicking on the top-right corner icon

<p align="center">
  <img src=".github/delete-account-1.png" alt="Account deletion step 1" width="200"/>
</p>

2. Scroll down the page and click on "Delete your account"
<p align="center">
  <img src=".github/delete-account-2.png" alt="Account deletion step 2" width="200"/>  
</p>

3. Confirm by clicking "Delete" (This action is irreversible)

<p align="center">
  <img src=".github/delete-account-3.png" alt="Account deletion step 3" width="200"/>  
</p>
<!-- ## Endpoints Web

- URL: http://localhost:3000/
- Session: http://localhost:3000/session
- User: http://localhost:3000/user -->
