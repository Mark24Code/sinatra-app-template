FROM ruby:3.1-alpine3.15

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem install bundler
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com

WORKDIR /app

# Install gems
ADD Gemfile* /app/

RUN apk add --update --no-cache --virtual .build-deps \
  build-base \
  postgresql-dev \
  tzdata \
  && bundle install \
  && apk del .build-deps

COPY . .

CMD ["rackup","-p","4567","-o", "0.0.0.0"]

EXPOSE 4567