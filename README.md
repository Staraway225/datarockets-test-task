# README

Solution for Datarockets [test task](https://github.com/datarockets/career/blob/master/jobs/ruby/test-task.md).

## Setup

### Docker

1. Build Docker image
   ```bash
   docker compose build
   ```
2. Rename `.env.example` to `.env`
3. Setup database
   ```bash
   docker compose run --rm web bin/rails db:create db:migrate
   ```
4. Start the containers

   - Start `rails` server
     ```bash
     docker compose up
     ```
   - Start terminal session from the Docker container
     ```bash
     docker compose run -it --rm --service-ports web bash
     ```

### Locally

1. Ensure you have installed Ruby version specified in `.ruby-version`
2. Ensure you have installed and running PostgreSQL
3. Install dependencies using `bundler`
   ```bash
   bundle install
   ```
4. Rename `.env.example` to `.env` and change `DB_HOSTNAME` variable to `localhost`
5. Initialize database
   ```bash
   bin/rails db:create db:migrate
   ```
6. Start `rails` server by `bin/rails s`
