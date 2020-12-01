FROM ruby:2

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install -y nodejs yarn

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config --global jobs 7 && \
    bundle config build.nokogiri --use-system-libraries

ENV MAJEFLAGS=-j

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean

EXPOSE 3000

ENTRYPOINT /app/docker-entrypoint.sh
