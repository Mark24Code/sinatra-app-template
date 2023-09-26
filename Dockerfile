FROM ruby:3.2.2-bullseye


RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
RUN gem install bundler
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com

WORKDIR /app

# Install gems
ADD Gemfile* /app/

COPY . .

RUN bundle install

CMD ["rackup","-p","4567","-o", "0.0.0.0"]

EXPOSE 4567
