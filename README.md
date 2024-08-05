# 🎉 Carpitan

For political accountability and power to the people.

## Goals

This project aims to:

1. **Political Leaders Database**:
   - comment: `if possible every information should have a source, if an article we can link to it, if a document lets provide the link to it , if possible have our own copy for the same with metadata that can be used to traceback originality of the information.`  
   - **Details**: 
     - List of political leaders with **names, locations, and jurisdictions** and anything they own that is of public interest
     - Links to **publications**, **dissertations**, and **videos** related to their degrees (e.g., Master’s, Ph.D.).
     - **Education background** (verified degrees and institutions).
     - **Current net-worth**, including properties and asset declarations.
     - **Previously held positions** and deliverables met.
     - **Held companies** and **company partnerships**.
     - **Primary contact information**.

2. **Scandals and Legal Records**:
   - **Details**: 
     - List of **scandals** and **reported offenses**.
     - Record of **all cases**, including **pending cases** and their outcomes.
     - **Allegations** and any **debates and takes on issues**.
     - **Previous utterances** with **original video evidence**.

3. **Legislation Tracker**:
   - **Details**:
     - Detailed records of **legislations**, including **initiators, votes**, and **voters**.
     - **Results** of legislative processes.
     - all legislations, their movers, votes, voters and results

4. **Leaders' Achievements Log**:
   - **Details**:
     - Documentation of **accomplishments and activities** from their election date.
     - **Community initiatives** that have made an impact.

5. **Protest Organization Platform**:
   - **Details**:
     - Tools for **scheduling, promoting, and organizing** peaceful protests.
   - **objective**:
     - A place to organize peaceful protests.


6. **Public Participation Hub**:
   - A place to amass public participation of governance issues
   - **Details**:
     - **Forums** and **discussion boards** for public engagement on governance issues.
     - **Compilation of previous statements** and contributions.

7. **Privacy and Consent Management**:
   - **Details**:
     - Features to manage **data privacy**, including consent for data use.
     - **Anonymization options** where necessary.

9. Be a global open source platform championing the voice of the people over various governments


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
