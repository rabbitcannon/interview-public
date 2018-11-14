FROM ruby:2.3.0

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

RUN mkdir /interview-project
WORKDIR /interview-project
