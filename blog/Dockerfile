FROM ruby:2-alpine

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      yarn \
      sqlite \
      sqlite-dev \
      imagemagick

RUN apk add python || apk add python3

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config --global jobs 7 && \
    bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

RUN mkdir -p log storage tmp app
COPY babel.config.js Rakefile ./
COPY bin/ bin/
COPY config/ config/ 
COPY config.ru ./
COPY lib/ lib/
COPY public/ public/
COPY app/ app/
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean

COPY db/ db/
COPY docker-entrypoint.sh ./

EXPOSE 3000

ENTRYPOINT /app/docker-entrypoint.sh
