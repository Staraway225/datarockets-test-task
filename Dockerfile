FROM ruby:3.2.2

RUN apt update -qq && apt install -y postgresql-client

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install
RUN bundle binstubs --all
