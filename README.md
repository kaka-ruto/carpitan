# 🎉 Carpitan

For political accountability and power to the people.

## Goals

This project aims to:

1. Keep a list of political leaders, their jurisdictions, businesses and anything they own that is of public interest
2. Keep a list of all legislations, their movers, votes, voters and results
3. Keep a list of all an elected leader did or achieved from their election date
4. A place to organize peaceful protests.
5. A place to amass public participation of governance issues
6. Be a global open source platform championing the voice of the people over various governments

## Requirements

You'll need the following installed to run the template successfully:

- Ruby 3.2+
- Node.js v20+
- PostgreSQL 12+
- Redis - For ActionCable support (and Sidekiq, caching, etc)
- Libvips or Imagemagick - `brew install vips imagemagick`
- [Overmind](https://github.com/DarthSim/overmind) or Foreman - `brew install tmux overmind` or `gem install foreman` - helps run all your processes in development

Then you can start the database servers:

```bash
brew services start postgresql
brew services start redis
```

## Initial Setup

First, clone the app

```bash
git clone git@github.com:kaka-ruto/carpitan.git
cd carpitan
```

Run `bin/setup` to install Ruby and JavaScript dependencies and setup your database.

```bash
bin/setup
```

## Running Carpitan

To run your application, you'll use the `bin/dev` command:

```bash
bin/dev
```

This starts up Overmind (or Foreman) running the processes defined in `Procfile.dev`. We've configured this to run the Rails server, CSS bundling, and JS bundling out of the box. You can add background workers like Sidekiq, the Stripe CLI, etc to have them run at the same time.

#### Running on Windows

See the [Installation docs](https://jumpstartrails.com/docs/installation#windows)

#### Running with Docker or Docker Compose (With Jumpstart)

See the [Installation docs](https://jumpstartrails.com/docs/installation#docker)

#### Running with Docker or Docker Compose (Without Jumpstart)

This Docker Compose setup provides a complete environment for running a Rails application with PostgreSQL and Redis. The configuration includes three services: a PostgreSQL database (`db`), a Redis instance (`redis`), and the Rails web application (`web`).

#### Prerequisites

Before you start, make sure you have the following installed on your machine:

- Docker
- Docker Compose

#### 1. Configure Environment Variables

Update the environment variables in the `docker-compose.yml` file if necessary. Ensure you have set the `SECRET_KEY_BASE` for your Rails application and the database credentials:

```yaml
services:
  db:
    environment:
      POSTGRES_DB: carpitan_production
      POSTGRES_USER: carpitan
      POSTGRES_PASSWORD: secretpassword

  web:
    environment:
      DATABASE_URL: postgres://carpitan:secretpassword@db/carpitan_production
      REDIS_URL: redis://redis:6379/1
      RAILS_ENV: production
      SECRET_KEY_BASE: your_generated_secret_key_base
      ASSUME_SSL: "false"
      FORCE_SSL: "false"
```

You can generate a secret key base using the following Rails command:

```bash
rails secret
```

#### 2. Build and Start the Containers

Build and start the containers using Docker Compose:

```bash
docker-compose up --build
```

This command will build the Docker image for the Rails application and start all the services defined in the `docker-compose.yml` file.

#### 3. Access the Application

Once the containers are up and running, you can access the Rails application in your web browser at:

```
http://localhost:3000
```

## Contributing

We'd love to receive contributions!

If you have an improvement you'd like to share

1. Create a fork of the repository
2. Make the change
3. Test the change
4. Send us a pull request.
