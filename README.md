# Notes

A simple and elegant notes app.
 
Get it on Google Play store!

<a href="https://play.google.com/store/apps/details?id=br.com.nogales.notes">
  <img src=".github/google-play-badge.png" alt="Get it on Google Play" width="200" />
</a>

Web app link: https://notes-847fe3.netlify.app/

The app's backend is hosted using [Render's](https://render.com/) free tier, so if you get some errors, it's probably because the app is down, and making a new request will start it again.

---
![Homepage app](.github/mobile_home.png)
---
![Homepage web](.github/web_home.png)

## Requisitos

- [NodeJS 12.*](https://nodejs.org/en/download/)
- [Yarn 1.*](https://yarnpkg.com/getting-started/install/)
- [Flutter 3.*](https://docs.flutter.dev/get-started/install)

## Tecnologias/Frameworks

- [NestJs](https://nestjs.com/)
- [Flutter](https://flutter.dev)

<!-- ## Padrões de projeto

- *Clean Architecture* -->

## Running the API

This project can run using SQLite (default) as well as PostgreSQL, to create the database and run the migrations you need to execute the following commands:
```
cd api
cp .env.example .env 
yarn
```
If you want to use PostgreSQL, make sure to change the database variable in the `.env` file you just copied: 
```
ORM_TYPE=postgres
```
Run the API (dev mode):

```shell script
yarn start:dev
```

## Running the Mobile app
Obs: Make sure you have flutter installed (at least version 3).

Change the `base_url` variable in the `env.dev.yaml` file acaccordingly to the platform and device target:

For ios:
```
baseUrl: http://localhost:3000 
```
For Android emulator:
```
baseUrl: http://10.0.2.2:3000 
```
For real android devices you'll need to change to your computer LAN IP. For example:
```
baseUrl: http://192.168.15.234:3000 
```

Running the app:

```
cd app
flutter pub get
// This will list all connected devices
flutter devices
// run with:
flutter run -d <your-device-name>
```

## Running the web app
Obs: Make sure you have flutter installed (at least version 3).

The `base_url` variable in the `env.dev.yaml` file must be target to localhost:
```
baseUrl: http://localhost:3000 
```
Run with:
```
cp app
flutter pub get
flutter run -d chrome
```
## API Endpoints

**URL**: http://localhost:3000
This collection is available to import using [Insomnia](https://insomnia.rest/download/).
### User [All with bearer token except POST]
- **[Create] Post:** /user
- **[Update Info] Patch:** /user
- **[Update Avatar - Multipart form-data] Patch:** /v1/user/avatar
- **[Update Avatar - base64] Patch:** /v2/user/avatar

### Session [SignIn]
- **[Create] Post:** /session
- **[Refresh] Post:** /session/refresh

### Note  [All with bearer token]
- **[Create] Post:** /note
- **[Show All] Get:** /note
- **[Show] Get ID:** /note/{id}
- **[Delete] Delete:** /note/{id}
- **[Delete All Selected] Delete:** /note
- **[Update] Patch:** /note/{id}
