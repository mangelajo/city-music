FROM ghcr.io/mangelajo/city-music-base

# update our latest gemfile, etc...

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
RUN bundle exec rake assets:precompile && bundle exec rake assets:clean

COPY db/ db/
COPY docker-entrypoint.sh ./

EXPOSE 3000

ENTRYPOINT /app/docker-entrypoint.sh
