FROM ruby:2.7.4-alpine3.14

RUN apk add --update --no-cache \
  build-base \
  postgresql-dev \
  tzdata

RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem install bundler 
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com


WORKDIR /app

RUN gem install bundler 
RUN bundle config set --local path 'vendor/bundle'

# Install gems
ADD Gemfile* /app/

RUN bundle install

COPY . .

# use APP_ENV
CMD bundle exec rake server:run

EXPOSE 3000
