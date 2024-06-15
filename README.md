# 🎉 Carpitan

For political accountability and power to the people.

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

#### Running with Docker or Docker Compose

See the [Installation docs](https://jumpstartrails.com/docs/installation#docker)

## Contributing

We'd love to receive contributions!

If you have an improvement you'd like to share

1. Create a fork of the repository
2. Make the change
3. Test the change
4. Send us a pull request.
