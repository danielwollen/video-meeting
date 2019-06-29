# Video-Meeting

Create video meetings at the click of a button (Rails API / VueJs / Twilio).

Setup:

```sh
docker-compose build
docker-compose run -u root backend bundle
docker-compose run frontend yarn
docker-compose run backend bin/rails db:create
docker-compose run backend bin/rails db:migrate
```

Start:

```sh
docker-compose up
```

