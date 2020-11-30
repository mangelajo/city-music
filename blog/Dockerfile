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
      sqlite-dev

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config --global jobs 7 && \
    bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN apk add python

RUN yarn install --check-files

COPY . ./

RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean

EXPOSE 3000

ENTRYPOINT /app/docker-entrypoint.sh
